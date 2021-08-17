#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /weather-challenge/tmp/pids/server.pid

# Create and update DB
rake db:create
rake db:migrate 
# rake db:test:prepare

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
