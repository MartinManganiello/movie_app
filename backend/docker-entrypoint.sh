#!/bin/sh
python manage.py flush --no-input
# PGPASSWORD=djangoproject psql --host db --port 5432 --username=code.djangoproject --dbname=code.djangoproject < tracdb/trac.sql
python manage.py migrate
# python manage.py collectstatic --no-input --clear

exec "$@"