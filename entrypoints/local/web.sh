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

python manage.py runserver 0.0.0.0:8000
