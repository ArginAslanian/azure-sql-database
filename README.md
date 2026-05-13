# 🚙 Azure Serverless Fleet Booking Automator

## 📋 Overview
This project is an end-to-end, serverless business automation workflow built entirely in Azure. It demonstrates how to securely ingest customer data from a public-facing frontend, process it using event-driven serverless compute, store it in a relational database, and trigger automated stakeholder alerts. 

Most importantly, this architecture implements **Zero Trust** security principles by utilizing Microsoft Entra ID Managed Identities and Role-Based Access Control (RBAC), eliminating the need to store or pass hardcoded database credentials.

## 🛠️ Tools & Technologies Used
*   **Azure SQL Database:** Relational data storage (Serverless/Basic tier).
*   **Azure Logic Apps:** Event-driven, serverless workflow automation.
*   **Microsoft Entra ID:** System-assigned Managed Identity for secure authentication.
*   **Microsoft Forms:** Public-facing user interface and frontend data validation.
*   **Office 365 Outlook:** Automated email alerting system.
*   **Azure Firewall:** IP-based network restriction for the database endpoint.

## 🚀 What This Project Accomplishes
1.  **Automated Data Ingestion:** Instantly captures user inputs from Microsoft Forms and routes them to an Azure Logic App.
2.  **Data Transformation:** Uses Logic App expression functions (e.g., `int()`, `utcNow()`) to sanitize and convert string payloads into the strict data types required by the SQL schema.
3.  **Enterprise-Grade Security:** Replaces standard SQL authentication with a System-Assigned Managed Identity. The Logic App is granted minimal `db_datawriter` access via Entra ID, ensuring secure, password-less database interaction.
4.  **Network Hardening:** The Azure SQL server is protected by an IP whitelist, blocking all public internet traffic except for internal Azure services and explicit administrator IPs.
5.  **Real-Time Alerting:** Automatically extracts dynamic content from the database payload to generate and send formatted email alerts to business owners upon successful booking creation.

## 🏗️ Architecture Flow
1. User submits a booking request via **Microsoft Forms**.
2. **Azure Logic Apps** triggers instantly upon submission.
3. Logic App extracts the JSON payload and validates data types.
4. Logic App authenticates to **Azure SQL** using its **Entra ID Managed Identity**.
5. A new reservation record is inserted into the `Bookings` SQL table.
6. Logic App connects to **Office 365** and sends an automated confirmation email to the administrator.

## 🔒 Security Highlights
*   **No Hardcoded Secrets:** Connection strings and passwords were intentionally omitted in favor of Managed Identity integration.
*   **Least Privilege:** RBAC was utilized to ensure the automation engine only has permission to write to the specific database table, reducing the attack surface.
