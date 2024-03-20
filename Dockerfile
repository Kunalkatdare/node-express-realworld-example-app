# This file is generated by Nx.
#
# Build the docker image with `npx nx docker-build api`.
# Tip: Modify "docker-build" options in project.json to change docker build args.
#
# Run the container with `docker run -p 3000:3000 -t api`.
FROM docker.io/node:lts-alpine

ENV HOST=0.0.0.0
ENV PORT=3000

WORKDIR /app

# RUN addgroup --system api && \
#           adduser --system -G api api
COPY package.json package-lock.json ./
RUN npm install && npm install -g prisma
COPY . .
# Generate Prisma client
COPY src/prisma /app/prisma
COPY src/prisma /src/prisma
RUN npx prisma generate && \
    npx prisma migrate deploy
# RUN chown -R api:api .

RUN npm audit fix
# Generate Prisma client
# RUN npx prisma db seed

CMD [ "npx", "nx", "serve", "api" ]
