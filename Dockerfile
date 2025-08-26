FROM cirrusci/flutter:3.8.0-10.1.pre AS builder

WORKDIR /app
COPY . .
RUN flutter build web

# Serve bằng Nginx
FROM nginx:alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
