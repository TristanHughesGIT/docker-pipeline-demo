# 📚 Bookstore API

A FastAPI-based microservice for managing a list of books. Built with Python, SQLite, and SQLAlchemy, and containerized using Docker for easy deployment.

---

## 📁 Project Folder Structure

```
.
├── .github/
│   └── workflows/
│       └── docker-build.yml     # GitHub Actions workflow
├── .dockerignore                # Docker ignore rules
├── dockerfile                   # Container build definition
├── main.py                      # FastAPI application
├── README.md                    # Project documentation
├── requirements.txt             # Python dependencies

```

---

## 🔗 GitHub Repository

- **Repo:** [`TristanHughesGIT/docker-pipeline-demo`](https://github.com/TristanHughesGIT/docker-pipeline-demo)
- Clone it locally:
  ```bash
  git clone https://github.com/TristanHughesGIT/docker-pipeline-demo.git
  ```

---

## ⚙️ Environment Variables

These can be configured in a `.env` file or passed into Docker at runtime:

| Variable           | Default                                | Description                                              |
|--------------------|----------------------------------------|----------------------------------------------------------|
| `DATABASE_URL`     | `sqlite:///./db/books.db`              | SQLAlchemy DB connection string                          |
| `LOG_LEVEL`        | `INFO`                                 | Logger level (`DEBUG`, `INFO`, `WARNING`, etc.)          |
| `LOG_FORMAT`       | `%(levelname)s:%(name)s:%(message)s`   | Logging output format                                    |
| `PAGE_SIZE`        | `10`                                   | Items per page in `/books/` endpoint                     |
| `APP_ENV`          | `dev`                                  | App environment label (`dev`, `staging`, `prod`)         |
| `HOST`             | `0.0.0.0`                              | Uvicorn bind host                                        |
| `PORT`             | `8080`                                 | Uvicorn port                                             |
| `RELOAD`           | `False`                                | Enable hot-reloading (for development)                   |
| `ALLOWED_ORIGINS`  | `*`                                    | CORS allowed origins                                     |
| `DB_POOL_SIZE`     | `5`                                    | SQLAlchemy connection pool size                          |
| `DB_MAX_OVERFLOW`  | `10`                                   | SQLAlchemy max overflow connections                      |

---

## 🧪 GitHub Actions – CI Pipeline

### 📄 Workflow File
`.github/workflows/docker-build.yml`

### 🧱 Job: `build-and-push`

This job:
- Checks out the source code
- Sets up Docker Buildx
- Logs into Docker Hub using GitHub Secrets
- Builds the Docker image
- Pushes the image to Docker Hub (optional)
- Saves the image as a `.tar` artifact for local testing

### 🔐 Required Secrets

| Secret Name        | Purpose                                          |
|--------------------|--------------------------------------------------|
| `DOCKER_USERNAME`  | Your Docker Hub username                         |
| `DOCKER_PASSWORD`  | Your Docker Hub access token (not your password) |

---

## 🐳 Docker Hub Repository

- **Public Repo:** [hughestris/docker-pipeline-demo](https://hub.docker.com/r/hughestris/docker-pipeline-demo)

### ⬇️ Pull the latest image:
```bash
docker pull hughestris/docker-pipeline-demo:latest
```

---

## 🖥️ Running the Docker Image Locally

### 🐋 Pull, List, and Run:
```bash
# Pull image from Docker Hub
docker pull hughestris/docker-pipeline-demo:latest

# List images
docker image ls

# Run the container
docker run -d -p 8080:8080 --name docker-pipeline-demo hughestris/docker-pipeline-demo:latest

# Check running containers  
docker ps
```

---

## ✅ Testing the Setup

1. Open your browser
2. Navigate to: [http://localhost:8080/docs](http://localhost:8080/docs)
3. You should see the **Swagger UI** for the Bookstore API
