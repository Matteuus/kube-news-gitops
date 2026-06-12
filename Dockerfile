FROM node:20-alpine AS deps

WORKDIR /app

COPY src/package*.json ./
RUN npm ci --omit=dev

FROM node:20-alpine AS runtime

WORKDIR /app

ENV NODE_ENV=production

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

COPY --from=deps /app/node_modules ./node_modules
COPY src/ .

RUN chown -R appuser:appgroup /app

USER appuser

EXPOSE 8080

CMD ["npm", "start"]