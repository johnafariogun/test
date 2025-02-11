# Use official Python image
FROM python:3.12

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Install Nginx
RUN apt update && apt install -y nginx && rm -rf /var/lib/apt/lists/*

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf
#checking out some additionaln stuff
# Expose the necessary ports
EXPOSE 80

# Start Nginx and FastAPI together
CMD service nginx start && uvicorn main:app --host 0.0.0.0 --port 8000
