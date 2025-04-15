from pyspark.sql import SparkSession

def create_spark_session():
    """
    Create and return a Spark session
    """
    return SparkSession.builder \
        .appName("BigDataAnalysis") \
        .config("spark.some.config.option", "some-value") \
        .getOrCreate()

def main():
    """
    Main function to run the analysis
    """
    # Initialize Spark session
    spark = create_spark_session()
    
    try:
        # TODO: Add data processing and analysis code here
        print("Spark session created successfully!")
        
    finally:
        # Stop Spark session
        spark.stop()

if __name__ == "__main__":
    main() 