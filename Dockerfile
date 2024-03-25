FROM docker.io/node:lts-alpine
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm install && npm install -g prisma
COPY . .
RUN npx prisma generate && npx prisma migrate deploy 

# # RUN npm audit fix

CMD [ "npx", "nx", "serve", "api" ]


