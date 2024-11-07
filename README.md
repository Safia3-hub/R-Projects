# Tesla Stock Analysis

## Overview
This project provides an in-depth analysis of Tesla's stock performance,
focusing on trends, volatility, and indicators over time. 
The analysis was conducted in R, and various data visualization techniques were 
employed to help interpret the stock's historical performance.

## Dataset
- **File Name**: `Tesla_dataset.csv`
- **Source**: Historical stock prices for Tesla Inc.
- **Description**: The dataset includes daily stock data, including opening, closing, high, low prices, trading volume, and adjusted close prices.

### Columns:
  - `date`: Date of the stock data.
  - `open`: Opening price of the stock.
  - `high`: Highest price of the stock for the day.
  - `low`: Lowest price of the stock for the day.
  - `close`: Closing price of the stock for the day.
  - `volume`: Number of shares traded.
  - `adj_close`: Adjusted closing price.

## Analysis Steps

### 1. Data Cleaning
- Converted character columns to numeric where needed.
- Handled missing values using methods like `na.locf()` for filling missing values in a time series.

### 2. Key Analyses Performed
  - **Volume Trends Over Time**: Created a bar plot to show trends in trading volume.
  - **Monthly Average Closing Prices**: Aggregated closing prices by month and plotted the average monthly prices.
  - **Moving Averages (50-day & 200-day)**: Calculated and plotted 50-day and 200-day Simple Moving Averages (SMA) to identify trends.
  - **Daily Returns (Volatility Analysis)**: Calculated daily returns to understand stock volatility, plotting it over time.
  - **Correlation Between Volume and Closing Price**: Examined the relationship between trading volume and closing prices using scatter plots and correlation coefficients.
  - **Relative Strength Index (RSI)**: Calculated RSI to identify overbought or oversold conditions, then plotted the RSI over time.

## File Structure
- **Dataset**: `Tesla_dataset.csv` (Cleaned data used for analysis)
- **Analysis Script**: `Stock_Analysis.R` (Contains all R code used for analysis and plotting)
- **Output Files**:
  - `Tesla_plot.png`: Line plot of closing prices over time.
  - `Tesla_moving_averages.png`: Plot of moving averages (50-day and 200-day).
  - `Tesla_volume_trends.png`: Volume trends bar plot.
  - `Tesla_RSI_plot.png`: RSI over time plot.
  - `Tesla_daily_returns.png`: Daily returns plot.

## Requirements
The following R packages are required for the analysis:
- `dplyr`: Data manipulation.
- `ggplot2`: Data visualization.
- `lubridate`: Date handling.
- `TTR`: Technical indicators (for RSI and moving averages).
- `zoo`: Time series analysis, used for rolling operations.
- `skimr`: Summary statistics.

  "To install all necessary packages, you can run:",
  "",
  "```r",
  "install.packages(c(\"dplyr\", \"ggplot2\", \"lubridate\", \"TTR\", \"zoo\", \"skimr\"))",
  "```",
  "",
  "## How to Run the Analysis",
  "1. **Load the Dataset**:",
  "   - If you have the dataset as `Tesla_dataset.csv`, load it in R using:",
  "   ```r",
  "   Tesla_dataset <- read.csv(\"Tesla_dataset.csv\")",
  "   ```",
  "",
  "2. **Run the Analysis Script**:",
  "   - Open the `Stock_Analysis.R` script and run the code to generate visualizations and calculations.",
  "   - Each section of the script corresponds to one of the analyses (volume trends, moving averages, etc.).",
  "",
  "3. **View Output**:",
  "   - All generated plots and output files will be saved in the specified output directory or the working directory.",
  "",
  "## Key Insights",
  "The analysis of Tesla's stock data reveals several patterns, including:",
  "- **Volume Trends**: Significant spikes in trading volume on certain dates, indicating possible news or events.",
  "- **Price Trends**: Moving averages helped identify long-term trends and short-term fluctuations.",
  "- **Volatility**: Daily returns highlight periods of high volatility, which can be important for risk management.",
  "- **RSI Analysis**: The RSI indicated periods where the stock was overbought or oversold, potentially signaling buying or selling opportunities.",
  "",
  "## Conclusion",
  "This analysis provides a detailed overview of Tesla's stock performance over time, utilizing technical analysis tools to draw insights into trends and volatility. The results can aid in understanding past performance and assessing future investment decisions."
)

