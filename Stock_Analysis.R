# Loading all libraries
library(dplyr)
library(ggplot2)
library(lubridate)
library(zoo)
library(TTR)
library(skimr)
library(DescTools)
library(janitor)

# Loading dataset
library(readxl)
Tesla_dataset <- read_excel("C:/Users/azung/Downloads/Tesla_dataset.xlsx")
View(Tesla_dataset)

# Loading the dataset from a CSV file
Tesla_dataset <- read.csv("C:\Users\azung\OneDrive\Desktop\PORTFOLIO\R Projects\Tesla_dataset.csv.csv")

# Check the first few rows of the dataset
head(Tesla_dataset)

# Checking the structure and first few rows of the dataset
str(Tesla_dataset)
head(Tesla_dataset)

# Cleaning column names
Tesla_dataset <- janitor::clean_names(Tesla_dataset) 

# Checking cleaned column names
colnames(Tesla_dataset) 

#Checking for missing values
skimr::skim(Tesla_dataset) 

# Counting total missing values by column
colSums(is.na(Tesla_dataset)) 

# Removing rows with any missing values
Tesla_dataset <- na.omit(Tesla_dataset)

# Converting the 'close' column to numeric if it's not already
Tesla_dataset$close <- as.numeric(Tesla_dataset$close)

# Checking for any NA values introduced during conversion
sum(is.na(Tesla_dataset$close))

# Plotting a boxplot for outlier detection with correct data type
ggplot(Tesla_dataset, aes(x = "", y = close)) +
  geom_boxplot() +
  labs(title = "Boxplot for Close Prices", y = "Close Price")

# Calculating IQR (Interquartile Range) for close prices
Q1 <- quantile(Tesla_dataset$close, 0.25)  # 1st Quartile (25th percentile)
Q3 <- quantile(Tesla_dataset$close, 0.75)  # 3rd Quartile (75th percentile)
IQR_value <- Q3 - Q1  # Calculate the Interquartile Range (IQR)

# Displaying the IQR value
IQR_value

# Final structure checking
str(Tesla_dataset)

# Checking summary statistics
summary(Tesla_dataset)

# Line plot for closing prices over time
ggplot(Tesla_dataset, aes(x = date, y = close)) +
  geom_line(color = "blue") +
  labs(title = "Tesla Stock Closing Prices Over Time", x = "Date", y = "Closing Price") 

# Bar plot for volume over time
ggplot(Tesla_dataset, aes(x = date, y = volume)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  labs(title = "Tesla Stock Trading Volume Over Time", x = "Date", y = "Volume") 
# Calculating average monthly closing prices
Tesla_dataset <- Tesla_dataset %>%
  mutate(month = lubridate::floor_date(date, "month"))

# Bar plot for volume over time
ggplot(Tesla_dataset, aes(x = date, y = volume)) +
  geom_bar(stat = "identity", fill = "lightblue") +
  labs(title = "Tesla Stock Trading Volume Over Time", x = "Date", y = "Volume") 
# Calculating average monthly closing prices
Tesla_dataset <- Tesla_dataset %>%
  mutate(month = lubridate::floor_date(date, "month"))
monthly_avg <- Tesla_dataset %>%
  group_by(month) %>%
  summarize(avg_close = mean(close, na.rm = TRUE))

# Plotting monthly average closing prices
ggplot(monthly_avg, aes(x = month, y = avg_close)) +
  geom_line(color = "blue") +
  labs(title = "Average Monthly Closing Prices of Tesla Stock", x = "Month", y = "Average Closing Price") 

library(zoo)

# Calculating 50-day and 200-day simple moving averages
Tesla_dataset <- Tesla_dataset %>%
  mutate(SMA_50 = rollmean(close, 50, fill = NA),
         SMA_200 = rollmean(close, 200, fill = NA))

# Plotting closing prices with moving averages
ggplot(Tesla_dataset, aes(x = date)) +
  geom_line(aes(y = close), color = "blue") +
  geom_line(aes(y = SMA_50), color = "red", linetype = "dashed") +
  geom_line(aes(y = SMA_200), color = "green", linetype = "dashed") +
  labs(title = "Tesla Stock Prices with 50-day and 200-day Moving Averages", x = "Date", y = "Price")

# Calculating daily returns
Tesla_dataset <- Tesla_dataset %>%
  mutate(daily_return = (close - lag(close)) / lag(close))

# Plotting daily returns over time
ggplot(Tesla_dataset, aes(x = date, y = daily_return)) +
  geom_line(color = "purple") +
  labs(title = "Daily Returns of Tesla Stock", x = "Date", y = "Daily Return")

# Scatter plot between volume and closing price
ggplot(Tesla_dataset, aes(x = volume, y = close)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  labs(title = "Correlation Between Volume and Closing Price", x = "Volume", y = "Closing Price")

# Calculating correlation coefficient
cor(Tesla_dataset$volume, Tesla_dataset$close, use = "complete.obs") 

library(TTR)

# Calculating RSI
Tesla_dataset$rsi <- RSI(Tesla_dataset$close, n = 14)

# Plotting RSI over time
ggplot(Tesla_dataset, aes(x = date, y = rsi)) +
  geom_line(color = "purple") +
  labs(title = "Tesla Stock RSI (Relative Strength Index)", x = "Date", y = "RSI")

# Simple linear regression of close price based on volume
model <- lm(close ~ volume, data = Tesla_dataset)
summary(model)

