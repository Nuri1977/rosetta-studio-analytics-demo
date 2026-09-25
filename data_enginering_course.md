# Jaffle Shop Data Engineering Course: Real-World Enterprise Edition

This course mirrors a real-world enterprise data engineering project. We will transition from raw, siloed data to a high-performance analytical warehouse using the Medallion Architecture.

## Course Outline

### Phase 1: Ingestion & The Bronze Layer (The Data Swamp)
- **Context:** Working with raw, unformatted data dumps from operational systems (e-commerce, CRM, inventory).
- **Topics:**
    - Source configuration and freshness checks.
    - Handling schema drift and basic data quality issues during ingestion.
    - Standardizing naming conventions across disparate source systems.
    - Implementing `stg_` models as the immutable "truth" layer.

### Phase 2: The Silver Layer (Business Logic & Standardization)
- **Context:** Building the "Enterprise Data Model." Translating messy raw data into consistent business metrics.
- **Topics:**
    - Developing `int_` models to handle complex join logic (e.g., matching orders to items and payments).
    - Implementing data cleaning (handling nulls, currency conversion, timezone normalization).
    - Enforcing referential integrity and rigorous dbt testing (unique, not_null, accepted_values, relationships).
    - Version control best practices and collaborative model development.

### Phase 3: The Gold Layer (Analytics Marts & Performance)
- **Context:** Powering executive dashboards and BI tools with performant, user-friendly data marts.
- **Topics:**
    - Designing star schemas (`fct_` vs `dim_` tables).
    - Handling Slowly Changing Dimensions (SCD Type 2) for historical accuracy.
    - Optimizing compute costs with Incremental Models.
    - Window functions for advanced metrics (e.g., CLV - Customer Lifetime Value, cohort analysis).

### Phase 4: Productionization & Reliability
- **Context:** Managing a production data platform that the business relies on.
- **Topics:**
    - Automating pipelines for continuous data delivery.
    - CI/CD workflows: Testing changes in ephemeral environments before merging.
    - Documentation as Code: Auto-generating and hosting a data catalog.
    - Monitoring and Alerting: Detecting pipeline failures and data quality anomalies in real-time.
