#!/bin/bash
set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

echo "Waiting for database..."
until PGPASSWORD=$POSTGRES_PASSWORD psql -h "$POSTGRES_HOST" -U "$POSTGRES_USER" -d "$POSTGRES_DB" -c '\q' 2>/dev/null; do
  echo "Postgres is unavailable - sleeping"
  sleep 1
done

echo "PostgreSQL is up - executing command"

echo "Running db:prepare..."
bundle exec rails db:prepare

exec "$@"
