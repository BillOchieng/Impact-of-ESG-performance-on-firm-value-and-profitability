-- SQL Schema & Queries for ESG Analysis

-- 1. Create ESG and financial data table
CREATE TABLE esg_financials (
  firm_id INTEGER PRIMARY KEY,
  firm_name TEXT,
  industry TEXT,
  year INTEGER,
  esg_score REAL,
  environment REAL,
  social REAL,
  governance REAL,
  roe REAL,
  roa REAL,
  market_valuation REAL
);

-- 2. Sample query: average ESG score by industry
SELECT industry, AVG(esg_score) AS avg_esg_score
FROM esg_financials
GROUP BY industry
ORDER BY avg_esg_score DESC;

-- 3. Sample query: top firms by ESG and ROE
SELECT firm_name, esg_score, roe
FROM esg_financials
WHERE year = 2023
ORDER BY esg_score DESC, roe DESC
LIMIT 10;

-- 4. Window function: ESG score ranking by industry
SELECT firm_name, industry, esg_score,
       RANK() OVER (PARTITION BY industry ORDER BY esg_score DESC) AS industry_rank
FROM esg_financials;
