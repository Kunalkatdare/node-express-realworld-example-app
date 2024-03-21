# This file is generated by Nx.
#
# Build the docker image with `npx nx docker-build api`.
# Tip: Modify "docker-build" options in project.json to change docker build args.
#
# Run the container with `docker run -p 3000:3000 -t api`.
FROM docker.io/node:lts-alpine

# ENV HOST=0.0.0.0
# ENV PORT=3000

WORKDIR /app

# # RUN addgroup --system api && \
# #           adduser --system -G api api
COPY package.json package-lock.json ./
RUN npm install && npm install -g prisma
COPY . .
# # Generate Prisma client
COPY src/prisma /app/prisma
COPY src/prisma /src/prisma
# ENV DATABASE_URL=postgresql://kunal:adminkunal@database-1.cmhdb4dvv2lu.us-east-1.rds.amazonaws.com:5432/mydb
# ENV JWT_SECRET=clBFAKBoZ4Zzrb1fRkOGhNS1JSM7gPx/jEoGVW27OFk=
# ENV NODE_ENV=production
RUN npx prisma generate && npx prisma migrate deploy

# # RUN chown -R api:api .

# RUN npm audit fix
# # Generate Prisma client
# # RUN npx prisma db seed

CMD [ "npx", "nx", "serve", "api" ]

# FROM node:lts-alpine3.19 AS build

# WORKDIR /app

# COPY package.json package-lock.json ./
# RUN npm install --production && npm install -g prisma
# COPY . .
# ENV DATABASE_URL=postgresql://kunal:adminkunal@database-1.cmhdb4dvv2lu.us-east-1.rds.amazonaws.com:5432/mydb
# ENV JWT_SECRET=clBFAKBoZ4Zzrb1fRkOGhNS1JSM7gPx/jEoGVW27OFk=
# ENV NODE_ENV=production
# RUN npx prisma generate && npx prisma migrate deploy && npm audit fix

# FROM node:lts-alpine3.19

# WORKDIR /app
# # Install nx globally
# RUN npm install -g nx@18.1.2
# COPY --from=build /app .
# EXPOSE 3000
# CMD [ "npx", "nx", "serve", "api" ]
