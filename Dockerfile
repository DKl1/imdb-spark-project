FROM python:3.8-slim

# Install Java
RUN apt-get update && apt-get install -y \
    openjdk-11-jdk \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PYSPARK_PYTHON=/usr/local/bin/python
ENV PYSPARK_DRIVER_PYTHON=/usr/local/bin/python

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Command to run when container starts
CMD ["python", "main.py"] 