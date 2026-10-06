# -*- coding: utf-8 -*-
"""
Created on Wed Sep 30 15:54:18 2026

@author: Lenovo
"""

## this query is used for checking folders present in its path
import os 
print("Current folder:")
print(os.getcwd())
print("\nFiles in current folder:")
print(os.listdir())

#Starting of project

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

#Load dataset
df = pd.read_csv("Coffee_sales.csv")
df.head()

df.shape
df.info()
df.describe(include="all")

#finding missing values
df.isnull().sum()

missing = (
    df.isnull()
    .sum()
    .sort_values(ascending=False)
)
missing_percent = (
    df.isnull()
    .mean()
    .mul(100)
    .sort_values(ascending=False)
)
missing_df = pd.DataFrame({
    "Missing_Count": missing,
    "Missing_Percentage": missing_percent
})
missing_df

#Duplicate Checkss
df.duplicated().sum()

#Converting dates
df["Date"] = pd.to_datetime(
    df["Date"],
    format="%d-%m-%Y"
)

df["Date"].min(), df["Date"].max()

#Overall KPI
total_revenue = df["money"].sum()
total_transactions = len(df)
average_transaction = df["money"].mean()
print("Total Revenue:", round(total_revenue, 2))
print("Total Transactions:", total_transactions)
print("Average Transaction:", round(average_transaction, 2))

#Coffee performance
coffee_analysis = (
    df.groupby("coffee_name")
    .agg(
        Transactions=("money", "count"),
        Revenue=("money", "sum"),
        Avg_Transaction=("money", "mean")
        )
        .sort_values("Revenue", ascending=False)
    )
coffee_analysis

#Coffee revenue charts
plt.figure(figsize=(10,6))
coffee_analysis["Revenue"].sort_values().plot(
    kind="barh"
    )
plt.title("Revenue by Coffee")
plt.xlabel("Revenue")
plt.ylabel("Coffee")
plt.tight_layout()
plt.show()

#Time of day
time_analysis = (
    df.groupby("Time_of_Day")
    .agg(
        Transactions=("money", "count"),
        Revenue=("money", "sum"),
        Avg_Transaction=("money", "mean")
        )
    )
time_analysis

#chart (Time of day)
plt.figure(figsize=(8,5))
time_analysis["Revenue"].plot(kind="bar")

plt.title("Revenue by time of day")
plt.xlabel("Time of day")
plt.ylabel("Revenue")
plt.xticks(rotation=0)
plt.tight_layout()
plt.show()

#Weekly analysis
weekday_order = [
    "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" , "Sun"
    ]
weekday_analysis = (
    df.groupby("Weekday")
    .agg(
        Transactions=("money", "count"),
        Revenue=("money", "sum")
        )
    .reindex(weekday_order)
    )
weekday_analysis

#charts (weekday analysis)
plt.figure(figsize=(10,5))
plt.plot(
    weekday_analysis.index,
    weekday_analysis["Revenue"],
    marker="o"
    )
plt.title("Revenue by Weekday")
plt.xlabel("Weekday")
plt.ylabel("Revenue")
plt.tight_layout()
plt.show()

#Hour Analysis
hour_analysis = (
    df.groupby("hour_of_day")
    .agg(
        Transactions=("money", "count"),
        Revenue=("money", "sum")
        )
    .sort_index()
    )
hour_analysis

#charts (hour analysis)
plt.figure(figsize=(12,5))
plt.plot(
    hour_analysis.index,
    hour_analysis["Revenue"],
    marker="o"
    )
plt.title("Hourly Revenue Trend")
plt.xlabel("Hour")
plt.ylabel("Revenue")

plt.tight_layout()
plt.show()

#Monthly Trend
#here we have make sure that Date should be in a datetime format
df["Date"] = pd.to_datetime(
    df["Date"],
    format="%d-%m-%Y",
    errors="coerce"
)

# Check the result
print(df["Date"].dtype)
print(df["Date"].head())
#creating year-month
df["Year_Month"] = df["Date"].dt.to_period("M")
#Monthly analysis
monthly = (
    df.groupby("Year_Month")
    .agg(
        Trasnactions=("money", "count"),
        Revenue=("money", "sum")
        )
    .sort_index()
    )
monthly

#charts (monthly trend)
plt.figure(figsize=(14,6))
plt.plot(
    monthly.index.astype(str),
    monthly["Revenue"],
    marker="o"
    )
plt.title("Monthly Revenue Trend")
plt.xlabel("Month")
plt.ylabel("Revenue")
plt.xticks(rotation=45)
plt.tight_layout()
plt.show()

#Correlation
numeric_cols = [
    "hour_of_day",
    "money",
    "Weekdaysort",
    "Monthsort"
    ]
df[numeric_cols].corr()

#chart (Heatmap) 
plt.figure(figsize=(8,6))
sns.heatmap(
        df[numeric_cols].corr(),
        annot=True,
        fmt=".2f"
)
plt.title("Correlation Matrix")
plt.tight_layout()    
plt.show()    


# To save after eda done dataset
df.to_csv("Coffee_Sales_Cleaned.csv", index=False)
print("Clean Dataset saved successful")

#to check its saved dataset path in drive
import os
print(os.path.abspath("Coffee_Sales_Cleaned.csv"))




















