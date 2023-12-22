FROM node:21-alpine3.18 as builder

COPY . .

RUN npm ci
RUN npm run build

FROM nginx:alpine3.18
COPY --from=builder /build/prod /usr/share/nginx/html