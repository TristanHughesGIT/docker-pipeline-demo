# Use a Python version that has prebuilt wheels for common libs
FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# Install deps first for better cache
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the app code
COPY main.py .

# Expose your API port (choose one and keep it consistent)
EXPOSE 8080

# If FastAPI (recommended)
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8080"]

# If you're actually using Flask instead, swap the CMD to:
# CMD ["python", "main.py"]
