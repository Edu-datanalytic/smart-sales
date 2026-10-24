## 🤖 Sales Monitoring Automation — n8n

### Overview
As part of the Smart Sales project, I developed a sales monitoring workflow using **n8n** to automate daily sales analysis and identify potential drops in business performance.

The workflow processes daily sales data exported from the sales database and evaluates whether the latest sales figure indicates a significant decline compared with the historical average.

### Workflow Architecture

The automation follows these steps:

1. **Download File** — Retrieves the sales CSV file from Google Drive.
2. **Extract From File** — Extracts daily sales records from the CSV file.
3. **Analysis Sales** — Processes the data using JavaScript, calculates the latest sales, historical average and percentage variation.
4. **Significant Drop** — Evaluates whether a significant sales drop has been detected, using a configurable 20% threshold.
5. **Create Alert** — Generates an alert message containing the date, latest sales, average sales and percentage variation when the condition is met.
6. **No Problem** — Generates a status message when no significant sales drop is detected.

### Technologies
- n8n — Workflow automation
- JavaScript — Data processing and business logic
- CSV — Daily sales data
- Google Drive — Input file storage

### Business Value
This workflow demonstrates how sales monitoring can be automated to reduce manual checks, identify potential performance issues and support faster business decision-making.

### Validation Status
The workflow has been executed using 365 daily sales records. The normal execution path has been checked. Further validation of the alert branch and workflow publication is pending.

### Project Context
This automation is part of **Smart Sales**, a portfolio project combining SQL, Power BI and workflow automation to demonstrate an end-to-end sales analytics solution.
## Workflow Preview

![Sales Drop Monitoring Workflow](N8N_sales__monitoring.PNG.)
