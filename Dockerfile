# Use the official Python image from the Docker Hub
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make port 8080 available to the world outside this container
EXPOSE 4200

# Define environment variable
ENV FLASK_APP=wsgi.py

# Run Gunicorn server when the container launches
CMD ["gunicorn", "--bind", "0.0.0.0:4200", "wsgi:app"]
