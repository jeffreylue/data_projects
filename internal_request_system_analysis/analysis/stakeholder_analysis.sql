/* =======================================
// SLA Performance by Stakeholder Group //

Objective:
Evaluate whether SLA performance differs across stakeholder groups

Findings:
Executives submit fewer total requests than Employees.
Executives maintain a 0% breach rate.
Executives experience significantly lower average resolution times.
Employees’ average resolution time is more than double that of Executives.

Interpretation:
Performance discrepancies suggest potential stakeholder prioritization bias
or escalation asymmetry within workflow handling.
=================================================== */
-- SLA Performance by Stakeholder Group [SQL QUERY] --
SELECT
    request_source,
    COUNT(*) AS total_requests,
    ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_time,
    ROUND(
        SUM(CASE WHEN sla_breached = 'Yes' THEN 1 ELSE 0 END)::decimal 
        / COUNT(*) * 100, 2
    ) AS breach_rate_percentage
FROM internal_requests
GROUP BY request_source;

/* ========================================================
// Month-over-month SLA Performance by Stakeholder Group //

Objective: 
Evaluate breach rate and average resolution time changes over time grouped by request source.

Findings:
Trend of increasing breach rates and average resolution times for Employee requests.
Executives have a 0% breach rate, so this would exemplify the consistency of 0%.
We can also see that resolution time never surpasses 30 hours. 

Interpretation:
This query was more for visualization purposes and my own workflow
We already know that Executives have a 0% breach rate, meaning Employees hold all the breached requests. 
Isolates the increasing breach rate trend to Employee requests and we see the correlation with the macro trend.
This would be good to plot in charts for communication purposes.
==================================================================== */
-- Month-over-month SLA performance by Stakeholder Group [SQL QUERY] --
SELECT
	DATE_TRUNC('month', created_at) AS month,
	request_source,
	COUNT (*) AS total_cases,
	SUM(CASE WHEN sla_breached = 'Yes' THEN 1 ELSE 0 END) AS cases_breached,
	ROUND(
        SUM(CASE WHEN sla_breached = 'Yes' THEN 1 ELSE 0 END)::decimal 
        / COUNT(*) * 100, 2) AS breach_rate,
	ROUND(AVG(resolution_time_hours), 2) AS avg_resolution_time
FROM internal_requests
GROUP BY 1,2
ORDER BY 2,1

/* ===============================================
// Priority Volume Distribution by Stakeholder //

Objective: Evaluate priority classification distribution by stakeholder

Findings:
Executives submit only Critical and High-priority cases.
Employees rarely submit Critical cases and account for most Medium/Low volume.

Interpretation:
Priority escalation behavior differs by stakeholder group.
This may contribute to observed SLA performance asymmetries.
Cases may be escalated to a higher priority due to stakeholder pressure.
============================================================ */
-- Priority Volume Distribution by Stakeholder [SQL QUERY] --
SELECT
	request_source,
	COUNT (*) as total_requests,
	SUM (CASE WHEN priority = 'Critical' THEN 1 ELSE 0 END) AS total_critical_cases,
	SUM (CASE WHEN priority = 'High' THEN 1 ELSE 0 END) AS total_high_cases,
	SUM (CASE WHEN priority = 'Medium' THEN 1 ELSE 0 END) AS total_medium_cases,
	SUM (CASE WHEN priority = 'Low' THEN 1 ELSE 0 END) AS total_low_cases
FROM internal_requests
GROUP BY request_source;
