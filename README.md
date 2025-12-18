# Real Estate Listings Database  
CSC 370 – Database Systems  
University of Victoria

## Overview
This project is a relational database designed for a real estate listings system.  
It was developed as part of the **CSC 370 (Database Systems)** course at the University of Victoria.

The database models real-world entities involved in real estate management, including properties, agents, buyers, sellers, and transactions. The project focuses on correct database design, normalization, constraints, and advanced SQL queries rather than application development.

---

## Project Objectives
The main goals of this project are to:
- Design a relational database using an Entity-Relationship (ER) model
- Translate the ER model into a normalized SQL schema
- Enforce data integrity using constraints and triggers
- Demonstrate database interaction through complex SQL queries
- Apply concepts such as views, indexes, subqueries, and transactions

---

## Database Design
The database design is based on a detailed ER diagram that models the relationships between core entities in a real estate domain.

### ER Diagrams
- `ER_diagram.jpg` — initial conceptual ER diagram
- `advanced_erd.pdf` — refined ER diagram with detailed relationships and constraints

The schema was designed to follow normalization principles (up to **Third Normal Form (3NF)**) to reduce redundancy and maintain data consistency.

---

## Schema Definition
- `SQL_Schema.sql`  
  Contains SQL statements to create all tables, primary keys, foreign keys, and relationships.

Key design considerations include:
- Use of primary and foreign keys to enforce relationships
- Appropriate data types for attributes
- Referential integrity constraints

---

## Sample Data
- `dummydata.sql`  
  Populates the database with sample records to allow testing of queries and constraints.

---

## SQL Interaction and Features
The `SQL_Interaction/` directory demonstrates various SQL concepts required for CSC 370.

### Queries
- `queries.sql` — basic and intermediate queries
- `subqueries.sql` — nested and correlated subqueries
- `complex_and_data_aggression_query.sql` — complex queries involving joins and aggregations

### Constraints
- `constraints.sql` — additional integrity constraints applied after table creation

### Triggers
- `triggers.sql` — triggers used to enforce business rules and automate updates

### Views and Indexes
- `index_and_views.sql` — creation of database views and indexes for performance and abstraction

### Transactions
- `transactions.sql` — demonstrates transaction control using COMMIT and ROLLBACK

### Privileges
- `privileges.txt` — outlines access control and privilege management

---

## How to Run the Project
1. Open a MySQL-compatible database environment.
2. Execute `SQL_Schema.sql` to create the database schema.
3. Run `dummydata.sql` to insert sample data.
4. Execute scripts inside the `SQL_Interaction/` folder to test queries, triggers, views, and transactions.

Scripts should be executed in a logical order to ensure all dependencies are satisfied.

---

## Course Context
This project was created **solely for academic purposes** as part of CSC 370 at the University of Victoria.  
The focus is on database design and SQL proficiency rather than frontend or backend application development.

---

## Author
**Parvesh Yadav**

---

## Notes
- No application layer is included.
- The repository is intended to demonstrate database concepts taught in CSC 370.
- SQL scripts are organized by concept for clarity and evaluation.

