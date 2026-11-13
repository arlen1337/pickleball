# Serves the app with nginx. Railway sets PORT; elsewhere it defaults to 8080.
FROM nginx:1.27-alpine
ENV PORT=8080
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
COPY index.html sw.js manifest.webmanifest /usr/share/nginx/html/
COPY icons /usr/share/nginx/html/icons
COPY fonts /usr/share/nginx/html/fonts
EXPOSE 8080
