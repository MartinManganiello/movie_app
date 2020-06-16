#!/bin/sh

echo "Waiting for postgres..."

for i in 1 2 3 4 5
do
  sleep 0.1
done

echo "PostgreSQL started"

python manage.py flush --no-input
# PGPASSWORD=djangoproject psql --host db --port 5432 --username=code.djangoproject --dbname=code.djangoproject < tracdb/trac.sql
python manage.py migrate
# python manage.py collectstatic --no-input --clear

exec "$@"