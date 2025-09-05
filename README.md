# Inception

> **Inception** is a system administration/devops project that aims to set up a secure, scalable, and production-ready web server infrastructure using Docker Compose. This project is typically part of the 42 School curriculum and covers topics like containerization, service orchestration, and system security.

## 🚀 Project Overview

This repository contains the code and configuration necessary to deploy a multi-container web application stack using Docker Compose. The stack generally includes services like:

- **Nginx** (reverse proxy & SSL termination)
- **WordPress** (content management system)
- **MariaDB** (database)
- **phpMyAdmin** (optional, for DB management)
- **Redis** (optional, for caching)
- **Adminer** (optional, for DB management)

All services are containerized and orchestrated together, following security best practices.

## 📦 Features

- Automated deployment using Docker Compose.
- TLS/SSL encryption for secure connections.
- Persistent data storage using Docker volumes.
- Environment variable configuration for flexibility.
- Optional database management tools (phpMyAdmin/Adminer).
- Isolation of services for enhanced security.

## 🛠️ Setup & Usage

1. **Clone the repository**
   ```bash
   git clone https://github.com/otmansabir/Inception.git
   cd Inception
   ```

2. **Configure environment variables**

   Edit the `.env` file to set up your credentials and service parameters.

3. **Build and start the services**
   ```bash
   docker-compose up --build
   ```

4. **Access the services**
   - WordPress: [https://localhost](https://localhost)
   - phpMyAdmin/Adminer: [https://localhost:PORT](https://localhost:PORT) (if enabled)

## 📁 Project Structure

```
.
├── srcs/
│   ├── requirements/
│   │   ├── nginx/
│   │   ├── wordpress/
│   │   ├── mariadb/
│   │   └── ...
│   └── ...
├── .env
├── docker-compose.yml
├── README.md
└── ...
```

## 🧑‍💻 Author

- [Otman Sabir](https://github.com/otmansabir)

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

**Note:** Replace or extend the sections above according to your specific project setup, requirements, and goals.
