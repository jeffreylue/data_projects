# Internal Request Management System Analysis

## Project Snapshot

**Objective:**  
Investigate rising SLA breach rates within an internal request management system and identify potential operational drivers.

**Dataset:**  
Synthetic service desk dataset simulating internal request workflows, stakeholders, priority levels, and departmental ownership.

**Languages:**  
SQL (PostgreSQL)

**Analytical Focus:**  
Operational Performance Analysis, Root Cause Investigation, SLA Monitoring

**Key Insight:**  
SLA breaches increased despite stable request volume, indicating operational inefficiencies rather than demand overload.

**Primary Driver Identified:**  
High-priority workflows within the Operations department contributed disproportionately to the rise in SLA breaches.

**Outcome:**  
The analysis identified workflow review, priority classification audits, and automation opportunities as key improvement areas.

## Project Overview
This case study simulates an internal request management system where leadership wants to assess the sustainability and fairness of SLA performance across the organization. 
<br>The [dataset](https://github.com/jeffreylue/data_projects/blob/main/internal_request_system_analysis/data/sample_data.sql) was synthetically generated to reflect common service desk operational patterns.

The objective of this analysis was to determine whether increasing SLA breaches were driven by higher demand, stakeholder behavior, departmental strain, or structural workflow inefficiencies.

Rather than focusing purely on query complexity, this analysis emphasizes structured investigation, business interpretation, and actionable insights. 

## Analytical Approach

This project was designed to simulate a real-world internal analytics investigation. Rather than beginning with isolated queries, the analysis followed a structured framework:

1. Establish macro system performance trends
2. Segment performance by stakeholder groups
3. Evaluate operational performance by department
4. Identify workflow-level inefficiencies and automation opportunities

Each stage of the investigation builds on insights from the previous stage to isolate potential drivers of SLA degradation and translate analytical findings into operational recommendations.

## Business Problem
Leadership observed an increase in SLA breaches and wants to understand the underlying causes.<br>
<br>**Key questions include:**
* Is the system experiencing demand overload?
* Are certain departments under operational strain?
* Is priority classification influencing performance outcomes? 
* Are stakeholders experiencing unequal service levels?
<br>This analysis aims to isolate the primary drivers behind SLA degradation and identify areas requiring operational intervention. 

## Investigation Framework
To determine the root cause of rising SLA breaches, the analysis followed a structured investigation framework. The investigation progressed from **macro-level performance trends** to a **targeted operational analysis**, allowing systemic patterns to be identified before conducting deeper segmentation analysis.
<br>
### 1. Macro Performance Trends
The analysis began evaluating **overall system performance over time**, focusing on total request volume and SLA breach rates.<br>
<br>
This step establishes whether performance degradation is driven by **increased demand or internal operational factors**<br>
<br>**Key metrics evaluated:**
* Monthly request volume<br>
* Monthly SLA breach rate<br>
* Stakeholder submission volume trends<br>
* Total submissions and SLA metrics by department<br>
* SLA performance by case priority<br>
<br>
This macro view provides context for identifying **system-wide performance shifts** and determining segmentation for the deeper analysis. The investigation was subsequently divided into two parts: Stakeholder Performance and Department Performance.<br>
<br>SQL Files:<br>

• [macro_volume_trends.sql](https://github.com/jeffreylue/data_projects/blob/main/internal_request_system_analysis/analysis/macro_volume_trends.sql)

### 2. Stakeholder Performance Analysis
This stage evaluated whether SLA performance differed across stakeholder groups.<br>
<br>
Because internal service systems often prioritize executive requests, this analysis examines the differences in **request patterns and service delivery based on request source**.<br>
<br>**Key questions addressed:**
* Do Executives and Employees experience different SLA performance?
* Are resolution times consistent across stakeholder groups?
* Does breach rate change over time for specific stakeholder groups?
* Does case volume have a different priority distribution for different stakeholder groups?

This analysis helps determine whether **workflow prioritization dynamics** contribute to observed breach patterns.<br>
<br>SQL Files:<br>
• [stakeholder_analysis.sql](https://github.com/jeffreylue/data_projects/blob/main/internal_request_system_analysis/analysis/stakeholder_analysis.sql)

### 3. Departmental Performance Analysis
Following the stakeholder analysis, the investigation conducted a deeper review of **department-level operational performance**.<br>
This stage examines whether SLA breaches are concentrated within specific operational teams and whether **priority distribution contributes to those outcomes**.<br>
<br>**Key areas analyzed:**
* Priority distribution across departments
* Department SLA performance per priority classification
* Department SLA performance trends over time

This stage helps identify **operational bottlenecks and workflow inefficiencies** that may be contributing to the increase in SLA breaches.<br>
<br>SQL Files:<br>
• [department_analysis.sql](https://github.com/jeffreylue/data_projects/blob/main/internal_request_system_analysis/analysis/department_analysis.sql)

### 4. Service Type Performance Review
Finally, the investigation evaluated **service request categories** to identify operational patterns and potential automation opportunities. <br>
<br>High-volume, repetitive service requests can often be optimized through workflow improvements or automation<br>
<br>**Key areas evaluated:**
* Request volume by service type
* SLA performance by service type
* Average resolution time by service type

This step identifies opportunities for operational efficiency improvements beyond organizational structure, particularly for recurring operational workflows.<br>
<br>SQL Files:<br>
• [department_analysis.sql](https://github.com/jeffreylue/data_projects/blob/main/internal_request_system_analysis/analysis/department_analysis.sql)

## Key Findings
•	Overall request volume has remained stable month-over-month
<br>•	SLA breach rates increased over time, with a notable spike in April
<br>•	Executive requests maintained a 0% breach rate and lower average resolution times
<br>•	High-priority cases exhibited the highest breach rate and longest resolution times
<br>•	The Operations department demonstrated increasing breach rates and resolution times despite stable volume
<br>•	Access Requests and Password Resets represent high-volume, repeatable operational tasks

## Risk & Interpretation
The increase in SLA breaches despite stable volume suggests structural inefficiencies rather than capacity overload. 
<br>
<br>Differences in stakeholder performance may indicate prioritization asymmetry or escalation bias. 
<br>
<br>Operational strain appears concentrated with specific departments and high-priority workflows.

## Recommendations
**Immediate**
<br>•	Conduct workflow review within Operations Department
<br>•	Audit High-priority case classification standards
<br>
<br>**Structural**
<br>•	Standardize escalation criteria across stakeholders and request type 
<br>•	Implement ongoing SLA monitoring dashboards
<br>
<br>**Modernization Opportunity**
<br>•	Explore AI-assisted ticket classification and validation
<br>•	Assess automation potential for recurring operational requests
<br>•	Consider system/workflow adjustments where operational strain is identified

## Repository Structure
```
/data
- schema.sql
- sample_data.sql

/analysis

macro_volume_trends.sql
- Monthly Macro Performance Trends
- Monthly Volume by Stakeholder
- Department-level SLA Performance
- SLA Performance by Case Priority

stakeholder_analysis.sql
- SLA performance by stakeholder group
- Month-over-month SLA Performance by Stakeholder Group
- Priority Volume Distribution by Stakeholder

department_analysis.sql
- Priority × Department Cross Analysis
- Department Performance Over Time
- Service Type Performance Review

images_query_results.pdf
Query result screenshots used to support key findings.

executive_summary.pdf
Concise business summary of findings and recommendations.

README.md
Project documentation and analytical framework.
```
