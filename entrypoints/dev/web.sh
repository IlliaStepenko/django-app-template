#!/bin/sh

set -e

export PYTHONPATH="$(pwd)"

echo "Applying migrations (waiting for the database)..."
until python manage.py migrate --noinput; do
  echo "Database not ready yet, retrying in 2s..."
  sleep 2
done

echo "Collecting static files..."
python manage.py collectstatic --noinput

echo "Starting server..."

gunicorn core.wsgi:application --bind 0.0.0.0:8000
