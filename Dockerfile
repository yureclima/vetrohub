FROM nginx:alpine

# Copy static assets to Nginx html directory
COPY dist /usr/share/nginx/html

# Create subfolder and symlinks to support Vite base path "/vetro/"
RUN mkdir -p /usr/share/nginx/html/vetro && \
    ln -s ../assets /usr/share/nginx/html/vetro/assets && \
    ln -s ../favicon.ico /usr/share/nginx/html/vetro/favicon.ico && \
    ln -s ../logo.webp /usr/share/nginx/html/vetro/logo.webp && \
    ln -s ../placeholder.svg /usr/share/nginx/html/vetro/placeholder.svg && \
    ln -s ../vetro.svg /usr/share/nginx/html/vetro/vetro.svg && \
    ln -s ../index.html /usr/share/nginx/html/vetro/index.html

# Copy Nginx configuration file
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh

# Expose port 80
EXPOSE 80

# Run entrypoint script before starting Nginx
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
