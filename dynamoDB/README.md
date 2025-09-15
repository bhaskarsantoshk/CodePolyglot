# DynamoDB & NoSQL Crash Notes

---

## Relational Databases (RDBMS)

Relational databases store data in **tables (rows & columns)** with **predefined schemas**.  
They use **SQL** for queries and maintain strong integrity rules.

### Advantages
- **ACID** compliance (Atomicity, Consistency, Isolation, Durability).  
- Complex queries & relationships are possible.  
- Strong data integrity.

### Limitations
- Schema rigidity → frequent schema changes are difficult.  
- Doesn’t scale easily for massive workloads (replication overhead).  
- Poor fit for **unstructured/evolving data** (e.g., streaming platform watch history).  
- Impedance mismatch: application models ≠ relational models.

---

## NoSQL Databases

NoSQL = **non-relational databases** designed for scale & flexibility.  
They handle **unstructured, semi-structured, and evolving data**.

### Types of NoSQL
- **Document Stores** → JSON-like documents (MongoDB, CouchDB).  
- **Key-Value Stores** → Simple pairs (Redis, DynamoDB).  
- **Column-Family Stores** → Rows + column families (Cassandra, HBase).  
- **Graph Databases** → Nodes + edges for relationships (Neo4j, Amazon Neptune).

### Advantages
- Schema-less → easy to evolve.  
- Horizontally scalable across many servers.  
- Friendly to Agile development.  
- Good for hierarchical/complex data.  

---

## Amazon DynamoDB (AWS NoSQL)

DynamoDB = **fully managed key-value + document database**.  
Built for **internet scale**: high availability, auto-scaling, and single-digit millisecond latency.

### Features
- **Serverless**: AWS manages infrastructure, scaling, partitioning, replication.  
- **Performance**: Consistent low latency.  
- **Scaling**: Auto partitioning with consistent hashing.  
- **Availability**: Multi-region replication, eventual consistency.  
- **Pricing**: Pay for throughput (read/write units).  
- **Schema-less**: Only need a **primary key**.

### Limitations
- No joins or complex queries.  
- Must design **access patterns upfront**.  
- Non-key queries = expensive (table scans).  
- Not for storing large binaries (images/videos → use S3).

---

## DynamoDB Data Model

- **Table** → like a relational table, but schema-less.  
- **Item** → like a row (JSON object).  
- **Attributes** → fields of the item (scalar, list, map).  

### Primary Key Types
1. **Partition Key (Hash Key)**  
   - Single attribute.  
   - Each item must have a unique partition key.  

2. **Partition Key + Sort Key (Composite)**  
   - Partition key decides the partition.  
   - Sort key orders items inside that partition.  
   - Combination must be unique.

---

## Example: Library Books Table

```json
{
  "book_id": "BOOK-001",
  "title": "Designing Data-Intensive Applications",
  "author": "Martin Kleppmann",
  "published_year": 2017,
  "genres": ["Technology", "Databases"],
  "available": true,
  "borrower": null
}

{
  "book_id": "BOOK-002",
  "title": "Clean Code",
  "author": "Robert C. Martin",
  "published_year": 2008,
  "genres": ["Software Engineering"],
  "available": false,
  "borrower": {
    "member_id": "MEM-778",
    "borrow_date": "2025-09-10"
  }
}
```

### Querying
- By **book_id** → efficient (`GetItem`).  
- By author or genre → requires index, otherwise scan.  

---

## Data Types in DynamoDB

- **Scalar** → String, Number, Boolean, Null, Binary.  
- **Document** → Map (key-value), List (array).  
- **Set** → String Set, Number Set, Binary Set (all unique values).  

---

## Why Primary Keys?

Think of DynamoDB as a **distributed HashMap**:  

```
put(Key, Value) → store  
get(Key)        → retrieve  
```

Without a **primary key**, items cannot be uniquely identified or retrieved efficiently.

---

## Partition Key + Sort Key (Range Key)

- **Partition Key** → decides physical location.  
- **Sort Key** → allows ordered queries & uniqueness within partition.  
- Sort key is optional but useful for **range queries** and multiple access patterns.

### Example: Movie Reviews Table
- **Partition Key**: `movie_id`  
- **Sort Key**: `review_timestamp`  

```json
{
  "movie_id": "MOV-100",
  "review_timestamp": "2025-09-14T10:00:00Z",
  "user_id": "USER-22",
  "rating": 5,
  "comment": "Outstanding!"
}

{
  "movie_id": "MOV-100",
  "review_timestamp": "2025-09-14T12:00:00Z",
  "user_id": "USER-45",
  "rating": 3,
  "comment": "Good but too long."
}
```

### Access Patterns Supported
- All reviews for a given movie.  
- Reviews sorted by time for a movie.  
- Filter reviews by rating using indexes.  

---

## Access Pattern Design (Golden Rule)

> **Design tables based on how you will access data, not how you store it.**

- DynamoDB is **query-optimized**, not storage-optimized.  
- Start by mapping **application queries** → then design PK + SK + GSIs (Global Secondary Indexes).

---

## Consistency Models

- **Eventually Consistent Reads (default)** → May return stale data for a few milliseconds.  
- **Strongly Consistent Reads** → Always up-to-date but higher latency and cost.  

---

## Quick Revision

- DynamoDB = **serverless, scalable key-value & document DB**.  
- Tables → Items → Attributes.  
- PK or PK + SK = required.  
- No joins, no complex queries → design access patterns first.  
- Great for scalability, poor for ad-hoc analytics.  
- Binary data → use **S3**, not DynamoDB.  

---
# DynamoDB Setup and Create Table Example

---

## 1. Setup Instructions

1. **Install AWS CLI**
   - macOS (Homebrew):
     ```sh
     brew install awscli
     ```
   - Linux (apt):
     ```sh
     sudo apt-get install awscli -y
     ```
   - Windows: [Download from AWS](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

2. **Verify installation**
   ```sh
   aws --version
   ```

3. **Configure AWS CLI**
   ```sh
   aws configure
   ```
   You will be prompted for:
   - `AWS Access Key ID`
   - `AWS Secret Access Key`
   - `Default region` (e.g., `us-east-1`)
   - `Default output format` (e.g., `json`)

4. **Check IAM permissions**
   Ensure your IAM user/role has these minimum permissions:
   - `dynamodb:CreateTable`
   - `dynamodb:DescribeTable`
   - `dynamodb:PutItem`
   - `dynamodb:GetItem`
   - `dynamodb:Query`
   - `dynamodb:UpdateTable`
   - `dynamodb:DeleteTable`

5. **(Optional) DynamoDB Local for testing**
   ```sh
   docker run -p 8000:8000 amazon/dynamodb-local
   ```
   To run CLI commands against local:
   ```sh
   aws dynamodb list-tables --endpoint-url http://localhost:8000
   ```

---

## 2. Create a Table Example

Let’s create a `ConferenceSessions` table.

- **Partition key**: `conference_id` (string)  
- **Sort key**: `session_id` (string)  
- This makes each item unique by combination of conference and session.

### Provisioned Throughput Example
```sh
aws dynamodb create-table   --table-name ConferenceSessions   --attribute-definitions     AttributeName=conference_id,AttributeType=S     AttributeName=session_id,AttributeType=S   --key-schema     AttributeName=conference_id,KeyType=HASH     AttributeName=session_id,KeyType=RANGE   --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=2   --region us-east-1
```

### On-Demand Example (recommended for unpredictable workloads)
```sh
aws dynamodb create-table   --table-name ConferenceSessions   --attribute-definitions     AttributeName=conference_id,AttributeType=S     AttributeName=session_id,AttributeType=S   --key-schema     AttributeName=conference_id,KeyType=HASH     AttributeName=session_id,KeyType=RANGE   --billing-mode PAY_PER_REQUEST   --region us-east-1
```

---

## 3. Breaking Down the Command

| Flag / Parameter | Meaning |
|------------------|---------|
| `--table-name ConferenceSessions` | Name of the new table. |
| `--attribute-definitions` | Defines attributes used in keys/indexes. |
| `AttributeName=conference_id,AttributeType=S` | Attribute `conference_id` of type `S` (string). |
| `AttributeName=session_id,AttributeType=S` | Attribute `session_id` of type `S` (string). |
| `--key-schema` | Defines primary key structure. |
| `AttributeName=conference_id,KeyType=HASH` | Partition key = `conference_id`. |
| `AttributeName=session_id,KeyType=RANGE` | Sort key = `session_id`. |
| `--provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=2` | Explicit capacity units (reads/writes per second). |
| `--billing-mode PAY_PER_REQUEST` | Pay-per-request pricing (no need for throughput units). |
| `--region us-east-1` | Region where the table is created. |

---

## 4. Verify the Table

```sh
aws dynamodb describe-table --table-name ConferenceSessions --region us-east-1
```

---

## 5. Add and Get an Item

### Insert Item
```sh
aws dynamodb put-item   --table-name ConferenceSessions   --item '{
    "conference_id": {"S": "CONF-2025-01"},
    "session_id": {"S": "S01"},
    "title": {"S": "Scaling with DynamoDB"},
    "speaker": {"S": "Jane Doe"},
    "time": {"S": "2025-10-01T09:00:00Z"}
  }'
```

### Get Item
```sh
aws dynamodb get-item   --table-name ConferenceSessions   --key '{
    "conference_id": {"S": "CONF-2025-01"},
    "session_id": {"S": "S01"}
  }'
```

# DynamoDB Tables, Queries, and Secondary Indexes

---

## 1. Creating a Table

### Example: `Students` Table

We will create a table to store student enrollments.

- **Partition key**: `student_id` (string)
- **Sort key**: `course_id` (string)

```sh
aws dynamodb create-table   --table-name Students   --attribute-definitions     AttributeName=student_id,AttributeType=S     AttributeName=course_id,AttributeType=S   --key-schema     AttributeName=student_id,KeyType=HASH     AttributeName=course_id,KeyType=RANGE   --billing-mode PAY_PER_REQUEST   --region us-east-1
```

---

## 2. Adding Items

```sh
aws dynamodb put-item   --table-name Students   --item '{
    "student_id": {"S": "STU-001"},
    "course_id": {"S": "MATH101"},
    "grade": {"S": "A"},
    "semester": {"S": "Fall2025"}
  }'

aws dynamodb put-item   --table-name Students   --item '{
    "student_id": {"S": "STU-001"},
    "course_id": {"S": "PHY102"},
    "grade": {"S": "B+"},
    "semester": {"S": "Fall2025"}
  }'
```

---

## 3. Querying Data

### a) Query by Partition Key only
Get all courses for a student:

```sh
aws dynamodb query   --table-name Students   --key-condition-expression "student_id = :stu"   --expression-attribute-values '{":stu":{"S":"STU-001"}}'
```

### b) Query by Partition Key + Sort Key
Get a specific course for a student:

```sh
aws dynamodb query   --table-name Students   --key-condition-expression "student_id = :stu AND course_id = :cid"   --expression-attribute-values '{":stu":{"S":"STU-001"}, ":cid":{"S":"MATH101"}}'
```

### c) Scan (inefficient)
Get all students who received an "A":

```sh
aws dynamodb scan   --table-name Students   --filter-expression "grade = :grade"   --expression-attribute-values '{":grade":{"S":"A"}}'
```

**Note:** Scans are slow and expensive because they read the entire table.

---

## 4. Secondary Indexes Overview

| Reading option          | Access patterns      | Cost      | Speed  |
|--------------------------|----------------------|-----------|--------|
| Query on primary key     | Limited              | Low       | High   |
| Scan                     | Many (any attribute) | Very high | Slow   |
| Query on secondary index | Moderate             | Moderate  | High   |

### Types of Secondary Indexes

- **Global Secondary Index (GSI)**: alternate partition key (and optional sort key). Can be created or deleted anytime.
- **Local Secondary Index (LSI)**: alternate sort key, same partition key as the table. Must be defined at table creation.

---

## 5. Global Secondary Index (GSI)

### Example: `Orders` Table

- Primary key: `customer_id` (partition key), `order_id` (sort key)
- Attributes: `order_date`, `status`, `total_amount`

We want to query orders by `status` efficiently. For that, we create a GSI on `status`.

```sh
aws dynamodb create-table   --table-name Orders   --attribute-definitions     AttributeName=customer_id,AttributeType=S     AttributeName=order_id,AttributeType=S     AttributeName=status,AttributeType=S   --key-schema     AttributeName=customer_id,KeyType=HASH     AttributeName=order_id,KeyType=RANGE   --billing-mode PAY_PER_REQUEST   --global-secondary-indexes '{
    "IndexName": "StatusIndex",
    "KeySchema": [
      {"AttributeName": "status", "KeyType": "HASH"},
      {"AttributeName": "order_id", "KeyType": "RANGE"}
    ],
    "Projection": {
      "ProjectionType": "INCLUDE",
      "NonKeyAttributes": ["total_amount", "order_date"]
    }
  }'
```

Now we can query all "Shipped" orders:

```sh
aws dynamodb query   --table-name Orders   --index-name StatusIndex   --key-condition-expression "status = :s"   --expression-attribute-values '{":s":{"S":"Shipped"}}'
```

### Key Points about GSIs
- Alternate partition key allowed.
- Sort key optional.
- Provisioned separately from the base table.
- Only **eventual consistency** supported.
- Can be added or removed anytime.

---

## 6. Local Secondary Index (LSI)

### Example: `Projects` Table

- Primary key: `team_id` (partition key), `project_id` (sort key)
- Attributes: `deadline`, `priority`

We want to also query projects by priority, but within the same `team_id`.  
For that, we define an **LSI** with `priority` as the alternate sort key.

```sh
aws dynamodb create-table   --table-name Projects   --attribute-definitions     AttributeName=team_id,AttributeType=S     AttributeName=project_id,AttributeType=S     AttributeName=priority,AttributeType=N   --key-schema     AttributeName=team_id,KeyType=HASH     AttributeName=project_id,KeyType=RANGE   --local-secondary-indexes '{
    "IndexName": "PriorityIndex",
    "KeySchema": [
      {"AttributeName": "team_id", "KeyType": "HASH"},
      {"AttributeName": "priority", "KeyType": "RANGE"}
    ],
    "Projection": {
      "ProjectionType": "ALL"
    }
  }'   --billing-mode PAY_PER_REQUEST
```

Query: Get all projects for `team_id = TEAM-123` ordered by priority.

```sh
aws dynamodb query   --table-name Projects   --index-name PriorityIndex   --key-condition-expression "team_id = :t"   --expression-attribute-values '{":t":{"S":"TEAM-123"}}'
```

### Key Points about LSIs
- Must be created **when table is created** (cannot add later).  
- Partition key must be the same as base table.  
- Provide **strongly consistent reads** (unlike GSIs).  
- Item collection size per partition key (table + LSIs) ≤ 10 GB.  

---

## 7. Summary

- Use **primary key query** for speed and low cost.  
- Use **scan** sparingly (last resort).  
- Use **GSI** for alternate partition keys. Flexible but eventually consistent.  
- Use **LSI** when you need another sort key with strong consistency, but must define it at table creation.  


