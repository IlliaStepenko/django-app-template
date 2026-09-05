#!/bin/sh

set -e

export PYTHONPATH=$(pwd)

echo "Waiting for migrations to be applied..."
until python manage.py migrate --check; do
  echo "Migrations not applied yet, retrying in 2s..."
  sleep 2
done

echo "Starting Celery Beat..."

exec python -m celery -A celery_app beat \
    --loglevel=INFO \
    --max-interval=30 \
    --scheduler django_celery_beat.schedulers:DatabaseScheduler
