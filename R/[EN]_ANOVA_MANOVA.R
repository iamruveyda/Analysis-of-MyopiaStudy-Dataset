# This function removes all variables and functions from the current environment in R
rm(list = ls()) 

## --------------------------------------------------------------------------------------------------
# R Packages
packages <- c("tidyverse", "ggplot2", "rstatix", "pander", "heplots", "readr")

suppressPackageStartupMessages(lapply(packages, require, character.only = TRUE))

# Importing Data
df <- read.csv("./dataset/myopia-study.csv", sep = ",")

# for kaggle
# df <- read.csv("../input/myopia-study/myopia.csv", sep = ";")

# Top 6 rows
head(df)


## --------------------------------------------------------------------------------------------------
class(df)


## --------------------------------------------------------------------------------------------------
print(sapply(df, class))


## --------------------------------------------------------------------------------------------------
# Structure of the data frame
str(df)


## --------------------------------------------------------------------------------------------------
# Statistical summary
summary(df)


## --------------------------------------------------------------------------------------------------
# Check missing values
sum(is.na(df))


## --------------------------------------------------------------------------------------------------
results_01 <- lapply(df, shapiro.test)
shapiro_data <- as.data.frame(do.call(rbind, results_01))
shapiro_data <- shapiro_data[-c(1), ]

# p-value check

p <- c(as.numeric(shapiro_data$p.value))


shapiro_data$p.value <- scales::pvalue(p,
  accuracy = 0.05,
  decimal.mark = ".",
  add_p = TRUE
)

shapiro_table <- shapiro_data %>%
  filter(!is.na(as.numeric(shapiro_data$statistic))) %>%
  select(!data.name)

pander(shapiro_table)


## --------------------------------------------------------------------------------------------------
df$AGE <- as.factor(df$AGE)
df$MYOPIC <- as.factor(df$MYOPIC)
df$GENDER <- as.factor(df$GENDER)
df$MOMMY <- as.factor(df$MOMMY)
df$DADMY <- as.factor(df$DADMY)


## --------------------------------------------------------------------------------------------------
# examine whether it has equal variance

print("AL - Axial Length")
levene_test(data = df, AL ~ GENDER, center = mean)

print("ACD - Anterior Chamber Depth")
levene_test(data = df, ACD ~ GENDER, center = mean)

print("LT - Lens Thickness")
levene_test(data = df, LT ~ GENDER, center = mean)

print("VCD - Vitreous Chamber Depth")
levene_test(data = df, VCD ~ GENDER, center = mean)


## --------------------------------------------------------------------------------------------------
group_by(df, GENDER) %>%
  summarise(
    n = n(),
    mean = mean(LT, na.rm = TRUE),
    sd = sd(LT, na.rm = TRUE),
    se = sd / sqrt(n),
    LCL = mean - qt(1 - (0.05 / 2), n - 1) * se,
    UCL = mean + qt(1 - (0.05 / 2), n - 1) * se,
    min = min(LT, na.rm = TRUE),
    max = max(LT, na.rm = TRUE)
  )


## --------------------------------------------------------------------------------------------------
model_a1 <- aov(LT ~ GENDER, data = df)

pander(summary(model_a1))


## --------------------------------------------------------------------------------------------------
levene_test(data = df, SPHEQ ~ GENDER * AGE, center = mean)


## --------------------------------------------------------------------------------------------------
group_by(df, GENDER, AGE) %>%
  summarise(
    mean = mean(SPHEQ, na.rm = TRUE),
    sd = sd(SPHEQ, na.rm = TRUE),
    n = n(), .groups = "drop"
  )


## --------------------------------------------------------------------------------------------------
model_a2 <- lm(
  SPHEQ ~ GENDER * AGE,
  data = df,
  contrasts = list(GENDER = contr.sum, AGE = contr.sum)
)

two_way <- anova_test(model_a2,
  type = 3,
  detailed = TRUE
)

pander(two_way)


## --------------------------------------------------------------------------------------------------
tukey_hsd(model_a2, which = "AGE")


## --------------------------------------------------------------------------------------------------
boxM(cbind(ACD, AL) ~ AGE, data = df)


## --------------------------------------------------------------------------------------------------
print("ACD - Anterior Chamber Depth")
levene_test(data = df, ACD ~ AGE, center = mean)

print("AL - Axial Length")
levene_test(data = df, AL ~ AGE, center = mean)


## --------------------------------------------------------------------------------------------------
df %>%
  group_by(AGE) %>%
  get_summary_stats(ACD, AL, type = "mean_sd")


## --------------------------------------------------------------------------------------------------
model_m1 <- lm(cbind(ACD, AL) ~ AGE,
  data = df
)

# Multivariate Tests
summary(Manova(model_m1,
  type = 3
))


## --------------------------------------------------------------------------------------------------
summary.aov(model_m1)


## --------------------------------------------------------------------------------------------------
boxM(cbind(DIOPTERHR, TVHR, SPORTHR) ~ GENDER * MYOPIC, data = df)


## --------------------------------------------------------------------------------------------------
df %>%
  group_by(GENDER, MYOPIC) %>%
  get_summary_stats(DIOPTERHR, TVHR, SPORTHR, type = "mean_sd")


## --------------------------------------------------------------------------------------------------
model_m2 <-
  lm(cbind(DIOPTERHR, TVHR, SPORTHR) ~ GENDER * MYOPIC, data = df)

# Multivariate Tests
summary(Manova(model_m2,
  type = 3
))

## --------------------------------------------------------------------------------------------------
summary.aov(model_m2)