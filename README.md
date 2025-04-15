# Big Data Analysis Project

This project is focused on analyzing large datasets using Apache Spark and PySpark.

## Project Structure

```
project/
├── data/                    # External folder for datasets
├── src/
│   ├── data_processing/     # Data processing modules
│   ├── analysis/           # Analysis modules
│   └── utils/              # Utility functions
├── notebooks/              # Jupyter notebooks for analysis
├── results/                # Analysis results
├── Dockerfile
├── requirements.txt
├── .gitignore
└── main.py
```

## Setup Instructions

### Using Docker

1. Build the Docker image:
```bash
docker build -t my-spark-img .
```

2. Run the container:
```bash
docker run my-spark-img
```

### Local Setup

1. Install Python 3.8
2. Install required packages:
```bash
pip install -r requirements.txt
```

3. Run the project:
```bash
python main.py
```

## Dataset

The project uses IMDB for analysis. The dataset is stored in the `data/` directory.

## Analysis

The project includes analysis of the dataset with focus on:
- Data processing and cleaning
- Statistical analysis
- Business insights
- Data visualization
