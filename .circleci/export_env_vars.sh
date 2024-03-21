#!/bin/bash
# Write environment variables to .env file
cat <<EOF > .env
DATABASE_URL=${DB_URL}
JWT_SECRET=${JWT_SECRET}
NODE_ENV=${NODE_ENV}
EOF

# Append environment variables to .env file
while IFS='=' read -r name value; do
  echo "$name=${value}" >> .env
done < <(env | grep -E "^DATABASE_URL=|^JWT_SECRET=|^NODE_ENV=")