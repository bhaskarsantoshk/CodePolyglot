# Dynamo DB

## Relational Databases

Relational databases organize data into tables with predefined schemas, using rows and columns to represent records and attributes. They support powerful querying through SQL and enforce data integrity via constraints and relationships between tables.

**Advantages:**  
- Strong consistency and ACID (Atomicity, Consistency, Isolation, Durability) compliance ensure reliable transactions.
- Flexible querying and robust data integrity make them ideal for structured data and complex relationships.

**Limitations:**  
- Most modern data is unstructured and evolves rapidly, making it difficult to model in rigid relational schemas. For example, user preferences or activity data on platforms like YouTube are hard to fit into fixed tables, and new data features often emerge as applications evolve.
- The mismatch between application data models and relational schemas is known as impedance mismatch, leading to complexity in development.
- Strict consistency requirements hinder horizontal scaling; replicating data across machines for writes slows down performance on large datasets.
- Frequent schema changes, common in Agile development, are cumbersome and erroridly growing datasets.
- Schema rigidity can limit flexibility when handling unstructured or evolving data

## NoSQL Databases

NoSQL databases are designed to handle large volumes of unstructured, semi-structured, or rapidly changing data. Unlike relational databases, they do not require fixed schemas and can scale horizontally across many servers, making them suitable for modern web-scale applications.

**Types of NoSQL Databases:**  
- **Document Stores:** Store data as JSON-like documents (e.g., MongoDB, CouchDB).
- **Key-Value Stores:** Store data as key-value pairs (e.g., Redis, DynamoDB).
- **Column-Family Stores:** Organize data into columns and column families (e.g., Cassandra, HBase).
- **Graph Databases:** Store data as nodes and edges to represent relationships (e.g., Neo4j, Amazon Neptune).

**Advantages:**  
- Flexible schemas allow easy handling of evolving and unstructured data.
- High scalability and performance for large-scale, distributed applications.
- Better suited for Agile development and frequent schema changes.
- Can efficiently store and query complex or hierarchical data structures

## DynamoDB

Amazon DynamoDB is a fully managed NoSQL database that supports both key-value and document data models. It delivers single-digit millisecond performance at any scale and is designed for high availability with multi-region, multi-active replication. DynamoDB includes built-in security, automated backup and restore, and in-memory caching, making it ideal for internet-scale applications.

**Features**  
- Fully managed: No need to manage servers or software updates—just focus on your data.
- High performance: Consistently delivers single-digit millisecond latency, even at massive scale.
- Scalable: Automatically scales to handle large numbers of requests using a distributed architecture and consistent hashing.
- Durable and highly available: Provides high availability with eventual consistency for reads; data becomes consistent within milliseconds.
- Cost effective: Charges only for the capacity you use, with no separate storage costs—pricing is based on throughput units.
- Flexible/schema-less: The only requirement is a unique primary key for each item. You can store any data structure, which is useful for Agile development. However, access patterns must be planned, as queries are efficient only by primary key or indices; scanning by other attributes is slow and

**Fully Managed by AWS** :  
- Automatic software updates and security patches are handled by AWS.
- DynamoDB is serverless, so there is no need to manage hardware or infrastructure.
- Data is automatically partitioned and horizontally scaled across multiple servers. AWS manages partitioning and re-partitioning seamlessly as servers are added or removed, with no downtime.
- Data replication for durability is managed under the hood, ensuring high availability without manual intervention.
- Tables are set to auto-scaling by default, so throughput units adjust automatically with changing workloads, providing seamless scaling and

To consider with DynamoDB:
- Not suitable for complex queries or joins; best for simple key-based access patterns.
- Data retrieval is efficient only by primary key or defined indices; querying by non-key attributes is limited and slow.
- Not designed for storing large binary objects (blobs) such as as images or videos.

## Data Model

- **Tables:** The fundamental data store in DynamoDB. You can have multiple tables, similar to relational databases. However, DynamoDB tables are schema-less, so there is no fixed column structure—any item can have any attributes, as long as the primary key is unique.
- **Items:** Analogous to rows in relational databases. Each item belongs to a table and can have multiple attributes. Items are often represented as JSON objects (collections of key-value pairs).
- **Attributes:** Each key-value pair within an item is called an attribute. Attributes are like properties of the item and can be of various scalar or composite data types.

### Primary Key

Each table must have a primary key, which uniquely identifies every item and is used internally for partitioning and storage. There are two types of primary keys:

- **Partition key:** A single unique attribute (string, number, or boolean) that determines the partition where the item is stored.
- **Partition key and Sort key:** A composite key with two attributes. The partition key determines the partition, and the sort key determines the order within that partition. The combination of both must be unique, though individually they may not be.

Let’s look at an example of items in a table
```
// Example of an item in a fictional "Orders" table
{
    "order_id": "ORD20250913-001",
    "customer_id": "CUST12345",
    "order_date": "2025-09-13T14:30:00Z",
    "status": "Delivered",
    "total_amount": 620,
    "currency": "USD",
    "items": [
        {
            "product_id": "P1001",
            "name": "Wireless Mouse",
            "price": 200,
            "quantity": 2
        },
        {
            "product_id": "P2002",
            "name": "Mechanical Keyboard",
            "price": 220,
            "quantity": 1
        }
    ],
    "shipping_address": {
        "street": "123 Main St",
        "city": "San Francisco",
        "state": "CA",
        "zip": "94105"
    }
}

{
    "order_id": "ORD20250913-002",
    "customer_id": "CUST67890",
    "order_date": "2025-09-13T16:00:00Z",
    "status": "Completed",
    "total_amount": 350,
    "currency": "JPY",
    "service": "Parking",
    "parking_details": {
        "location": "Shibuya Parking Lot",
        "duration_hours": 5,
        "vehicle_number": "AB-1234"
    }
}
```
In the above examples, each item in the "Orders" table is uniquely identified by its `order_id`, which serves as the primary key (partition key). To retrieve these items from DynamoDB, you would typically use a `GetItem` or `Query` operation specifying the primary key value.

For example:
- To fetch the first order, you would query the table with `order_id = "ORD20250913-001"`.
- To fetch the second order, you would query with `order_id = "ORD20250913-002"`.

Since DynamoDB is optimized for primary key lookups, these queries are efficient and return the exact item matching the given key. If a sort key is also defined, you would provide both the partition key and sort key values to retrieve a specific item.

### Data Types

DynamoDB supports three main categories of data types:

- **Scalar:** Includes String (`S`), Number (`N`), Boolean (`BOOL`), Null, and Binary (`B`). Binary is used for storing images, documents, or encrypted messages, but when used as a primary key, its size must not exceed 2048 bytes (applies to both single and composite keys).
- **Document:** Includes Map (a collection of key-value pairs) and List (an ordered collection of values), allowing for complex and nested data structures.
- **Set:** Includes String Set (`SS`), Number Set (`NS`), and Binary Set (`BS`), which store unique collections of their respective types.

Each type allows DynamoDB to efficiently store and retrieve both simple and complex data structures within