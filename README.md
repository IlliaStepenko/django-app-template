# DJANGO application template

## 1. Clone the repository

```bash
git clone git@github.com:IlliaStepenko/django-app-template.git
```

## 2. Create and fill .env

```bash
cp .env.example .env
```

## 3. Run docker-compose
For local development

```bash
docker compose -f docker-compose.yml -f docker-compose.local.yml up -d
```

For deployment on test server

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml up -d
```