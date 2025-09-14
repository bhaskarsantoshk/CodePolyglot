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
