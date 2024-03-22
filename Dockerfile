FROM docker.io/node:lts-alpine
RUN addgroup -g 1001 -S appuser && adduser -u 1001 -S -G appuser appuser
WORKDIR /app
COPY package.json package-lock.json ./
RUN chown -R appuser:appuser /app
USER appuser

RUN npm install && npm install -g prisma
COPY . .
RUN npx prisma generate && npx prisma migrate deploy

# # RUN npm audit fix

CMD [ "npx", "nx", "serve", "api" ]


