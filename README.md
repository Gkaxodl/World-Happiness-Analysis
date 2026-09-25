# World Happiness Analysis

Statistical analysis of factors associated with national happiness using the 2019 World Happiness Report dataset.

> **Course project:** DATS 1001 · Fall 2023  
> **Team:** Tae Yi Ham (Andrew Ham in the original course files), Aneesh Reddy, Sean Kim

## Project Overview

This project examined how national happiness scores are associated with economic, health, social, and regional factors across 156 countries. The analysis focused on GDP per capita, social support, healthy life expectancy, generosity, and geographic region.

## Research Question

**What variables are associated with a country's happiness score, and how does happiness vary across regions?**

The wording above is intentionally association-focused. This observational analysis identifies relationships in the data; it does not establish that these variables cause changes in happiness.

## Dataset

- **Source:** 2019 World Happiness Report dataset distributed through Kaggle
- **Observations:** 156 countries
- **Outcome:** Happiness score
- **Primary predictors:** GDP per capita, social support, healthy life expectancy, generosity
- **Additional comparison:** Geographic region

The original dataset is included in [`data/2019.csv`](data/2019.csv).

## Methods

- Data cleaning and variable preparation in R
- Country-to-region mapping with `countrycode`
- Pearson correlation analysis
- Multiple linear regression
- Variance Inflation Factor (VIF) checks for multicollinearity
- Scatterplots with fitted linear trends
- Regional boxplot comparison

## Key Findings

| Variable | Pearson correlation with happiness |
|---|---:|
| GDP per capita | 0.794 |
| Healthy life expectancy | 0.780 |
| Social support | 0.777 |
| Generosity | 0.076 |

The multiple linear regression using social support, GDP, healthy life expectancy, and generosity produced **R² = 0.742**. GDP, healthy life expectancy, and social support showed strong positive bivariate relationships with happiness in this dataset, while generosity had a much weaker bivariate correlation.

Regional comparisons also showed meaningful differences in observed happiness-score distributions. Because some regions contain far fewer countries than others, those comparisons should be interpreted cautiously.

## Limitations

- Happiness is a subjective construct and is difficult to represent with a single score.
- The analysis uses one cross-sectional year (2019), so it should not be interpreted as causal evidence.
- Regional sample sizes are uneven.
- The dataset predates the COVID-19 pandemic and does not represent later global conditions.

## Repository Structure

```text
World-Happiness-Analysis/
├── README.md
├── analysis.Rmd
├── data/
│   └── 2019.csv
├── presentation/
│   └── DATS-1001-Final-Presentation.pptx
└── original/
    └── FinalProject-original.Rmd
```

## Reproducibility

[`analysis.Rmd`](analysis.Rmd) is a cleaned, portfolio-ready version of the original course analysis. It removes the machine-specific local path that the 2023 file used for country-flag images and uses standard `ggplot2` points instead, so another user can run the analysis after installing the listed R packages.

The original R Markdown file is preserved unchanged in [`original/FinalProject-original.Rmd`](original/FinalProject-original.Rmd) for transparency.

## Tools

**R · ggplot2 · dplyr · countrycode · corrplot · Linear Regression · Statistical Analysis**

## Team Project Note

This was completed as a three-person course project. The repository preserves the team attribution from the original submission. It is included here as an early example of my development in statistical analysis and data visualization.
