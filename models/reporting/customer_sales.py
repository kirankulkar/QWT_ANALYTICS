import snowflake.snowpark.functions as F
from snowflake.snowpark.functions import col, lit, sum as sum_, max as max_, min as min_, count as count_
import holidays

def avg_sales(total_sales,total_orders):
    return total_sales/total_orders

def is_holiday(date_col):
    french_holidays = holidays.France()
    is_holiday = (date_col in french_holidays)
    return is_holiday   

def model(dbt, session):
    dbt.config(materialised = 'view', schema='reporting',packages = ["holidays"])
    df_DC = dbt.ref("dim_customer")
    df_FO = dbt.ref("fct_orders")

    df = df_DC.join(df_FO,"customerid")

    df_new = df.group_by("companyname","contactname","city").agg( min_("orderdate").alias("first_order_date"),
                      max_("orderdate").alias("recent_order_date"),
                      count_("orderid").alias("total_orders"),
                      sum_("linesalesamount").alias("total_sales"))

    df_new = df_new.withColumn("AVG_Sales", avg_sales(df_new.total_sales,df_new.total_orders))                  

    df_new = df_new.filter(F.col("FIRST_ORDER_DATE").isNotNull())

    df_new = df_new.to_pandas()

    df_new["IS_HOLIDAY_FIRST_ORDER"] = df_new["FIRST_ORDER_DATE"].apply(is_holiday)

    return df_new    
