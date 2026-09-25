# World Happiness Analysis
# Portfolio-friendly standalone R script based on the original course analysis.

library(readr)
library(dplyr)
library(ggplot2)
library(corrplot)
library(car)

happiness <- read_csv("data/2019.csv", show_col_types = FALSE)

analysis_data <- happiness |>
  transmute(
    Happiness = Score,
    GDP = `GDP per capita`,
    SocialSupport = `Social support`,
    HealthyLife = `Healthy life expectancy`,
    Freedom = `Freedom to make life choices`,
    Generosity = Generosity,
    Corruption = `Perceptions of corruption`
  )

# Descriptive statistics
summary(analysis_data)

# Pearson correlation matrix
correlation_matrix <- cor(analysis_data, use = "complete.obs")
corrplot(correlation_matrix, method = "color", type = "upper")

# Multiple linear regression used in the original project
model <- lm(
  Happiness ~ SocialSupport + GDP + HealthyLife + Generosity,
  data = analysis_data
)

summary(model)
vif(model)

# Exploratory relationships
ggplot(analysis_data, aes(x = GDP, y = Happiness)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(
    title = "Happiness Score vs GDP per Capita",
    x = "GDP per Capita",
    y = "Happiness Score"
  )

ggplot(analysis_data, aes(x = SocialSupport, y = Happiness)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  theme_minimal() +
  labs(
    title = "Happiness Score vs Social Support",
    x = "Social Support",
    y = "Happiness Score"
  )
