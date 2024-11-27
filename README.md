# mysql_connection_function_app

**mysql_connection_function_app** is a serverless application built on the Microsoft Azure Functions platform. This project demonstrates an automated workflow where survey responses submitted via Microsoft Forms are seamlessly stored in an Azure MySQL database. The repository showcases advanced skills in cloud computing, event-driven architecture, and database management, making it a standout project for data science and machine learning engineering roles.

---

## **Features**

1. **Event-Driven Architecture**:
   - Uses an HTTP Trigger in Azure Functions to automate workflows whenever a new Microsoft Form response is submitted.
   - Ensures real-time processing of survey response data.

2. **Dynamic Database Integration**:
   - Establishes a secure connection to the Azure MySQL database.
   - Automatically stores form responses into a pre-defined database table with the correct schema.

3. **Robust Testing Support**:
   - Includes `test.sql` to validate database connectivity and schema integrity.

---

## **How It Works**

1. **Trigger**:
   - The `function.json` file defines the HTTP Trigger binding, specifying how the Azure Function listens for incoming survey response events.

2. **Data Processing**:
   - The `index.js` file contains the core logic for:
     - Parsing survey response data.
     - Establishing a connection with the Azure MySQL database.
     - Inserting the data into the appropriate table schema.

3. **Database Testing**:
   - The `test.sql` script provides a set of SQL queries to validate the database structure and test data accuracy.

---

## **Repository Structure**

```plaintext
mysql_connection_function_app/
├── function.json                  # Defines the HTTP trigger binding for Azure Function
├── index.js                       # Implements the core logic for database connection and data insertion
├── test.sql                       # SQL queries for database testing
├── README.md                      # Project documentation (this file)
