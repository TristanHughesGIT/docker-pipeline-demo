# Use official Python slim image
FROM python:3.11-slim

# Set environment variables for app config
ENV DATABASE_URL="sqlite:///./db/books.db" \
    LOG_LEVEL="INFO" \
    LOG_FORMAT="%(levelname)s:%(name)s:%(message)s" \
    PAGE_SIZE=10 \
    APP_ENV="dev" \
    HOST="0.0.0.0" \
    PORT=8080 \
    RELOAD=False \
    ALLOWED_ORIGINS="*" \
    DB_POOL_SIZE=5 \
    DB_MAX_OVERFLOW=10

# Set the working directory inside the container
WORKDIR /app

# Copy dependency file first to leverage Docker cache
COPY requirements.txt .

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Create the db directory (if not using docker volume mount)
RUN mkdir -p /app/db

# Expose the port used by Uvicorn
EXPOSE 8080

# Start the FastAPI app using Uvicorn
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]
