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
- Can efficiently store and query complex or hierarchical