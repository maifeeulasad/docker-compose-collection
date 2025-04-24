#!/bin/bash

# Description: Recursively search up to 3 levels deep for docker-compose.yml files
#              and run docker compose down && up -d in each.

# Save the current directory
BASE_DIR=$(pwd)

echo "Working in: $BASE_DIR"

# Find docker-compose.yml files up to 3 directories deep
find . -maxdepth 3 -type f \( -name "compose.yml" -o -name "docker-compose.yml" -o -name "container-compose.yml" -o -name "compose.yaml" -o -name "docker-compose.yaml" -o -name "container-compose.yaml" \) | while read compose_file; do
    dir=$(dirname "$compose_file")
    echo "🔍 Found: $compose_file"
    echo "➡️  Running docker compose in: $dir"
    
    cd "$dir" || continue

    echo "🛑 Stopping existing services..."
    docker compose down

    echo "🚀 Starting services..."
    docker compose up -d

    echo "✅ Done with: $dir"
    echo "-----------------------------"

    # Return to base dir for next iteration
    cd "$BASE_DIR" || exit 1
done
