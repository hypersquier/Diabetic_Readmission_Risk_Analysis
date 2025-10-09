# Diabetic_Readmission_Risk_Analysis

## Overview

This project focuses on a deep, data-driven analysis of hospital records for diabetic patients to identify key clinical and behavioral factors contributing to early readmission (within 30 days). The primary objective was to transform complex, raw clinical data into actionable insights for quality improvement and cost reduction by focusing on high-risk patient segments.
## Features and Analysis

- **Data Engineering & Cleaning**: Cleaning and preparing over 100,000 patient records from eight related tables using advanced SQL techniques to handle missing values and feature engineering (e.g., creating the Readmission Flag).

- **KPI Calculation**: Calculating and benchmarking the overall 30-Day Readmission Rate against various clinical dimensions.
- **Clinical Risk Assessment**: Identifying and ranking the Top Primary Diagnoses (ICD-9 Codes) associated with the highest readmission risk, guiding clinical resource allocation.
- **Behavioral Analysis**: Analyzing Average External Resource Utilization (Emergency Room visits, prior inpatient stays) based on readmission status to highlight patients with poor self-management.
- **Logistics Efficiency**: Comparing Average Length of Stay (ALOS) for readmitted vs. non-readmitted patients to assess discharge planning effectiveness.
- **Visual Storytelling** : Designing an interactive dashboard using Tableau to communicate risk profiles and potential intervention areas to hospital administration..



## Technologies Used

- **SQLite Browser**: Core platform for data manipulation, cleaning, and executing complex analytical SQL queries.

- **SQL (Standard SQL)**: Used for data aggregation, conditional logic (using the CASE statement), and calculating crucial analytical metrics (e.g., Window Functions for ranking, if applicable).

- **Tableau Desktop/Public**: The main tool for data visualization, creating interactive dashboards (Bar Charts, Bubble Charts), and communicating findings.

- **Calculated Fields**: Used in Tableau to correctly format and display Percentage KPIs and manage visual data representation.



## Key Performance Indicator (KPI)

- **Overall 30-Day Readmission Rate**: The project's central metric, defining the rate of success/failure in discharge planning.

- **Readmission Risk by Age Group**: The rate of return broken down by patient age cohorts.

- **Average External Visits**: The mean number of prior Emergency and Inpatient visits for readmitted patients (a key behavioral driver).

- **Top Risk Diagnoses**: The ICD-9 codes with the highest associated readmission percentages.

## Usage

- **data Source** :https://www.kaggle.com/datasets/brandao/diabetes/data
- **Sql code** : https://github.com/hypersquier/Diabetic_Readmission_Risk_Analysis/blob/main/view.sql
- **Final Diabetic_Readmission_Risk_Analysis Dashboard** : https://public.tableau.com/views/projectmedcin/Dashboard?:language=en-US&publish=yes&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link
- **diabetic_readmission_analysis_final_data** : https://github.com/hypersquier/Diabetic_Readmission_Risk_Analysis/blob/main/Diabetic_Readmission_Risk_Analysis_Data.7z


## Contributing

Contributions are welcome! Please open an issue or submit a pull request for improvements.



## License

This project is licensed under the MIT License.



## Contact

For questions or collaboration, please contact [zarab99999@gmail.com].اجعل تلخيص مشروع Diabetic Readmission 
