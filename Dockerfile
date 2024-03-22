FROM docker.io/node:lts-alpine
WORKDIR /app

# RUN addgroup --system api && adduser --system -G api api
COPY package.json package-lock.json ./
RUN npm install && npm install -g prisma
COPY . .
# # # Generate Prisma client 
# COPY src/prisma /app/prisma
# COPY src/prisma /src/prisma
RUN npx prisma generate && npx prisma migrate deploy

# RUN chown -R api:api .

# # RUN npm audit fix

CMD [ "npx", "nx", "serve", "api" ]


