#!/usr/bin/env sh
set -e

bundle exec rails db:create db:migrate

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid
rm -f /app/tmp/pids/puma.state

exec "$@"
