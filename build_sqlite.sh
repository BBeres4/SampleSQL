#!/usr/bin/env bash
set -e

rm -f sample.db
sqlite3 sample.db < schema.sql
sqlite3 sample.db < seed.sql

echo "Done. Open it with: sqlite3 sample.db"
echo "Run queries with:  .read queries.sql"
