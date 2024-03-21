#!/bin/bash
# Write environment variables to .env file
cat <<EOF > .env
DB_URL=${DB_URL}
JWT_SECRET=${JWT_SECRET}
NODE_ENV=${NODE_ENV}
EOF

# Append environment variables to .env file
while IFS='=' read -r name value; do
  echo "$name=${value}" >> .env
done < <(env | grep -E "^DB_URL=|^JWT_SECRET=|^NODE_ENV=")