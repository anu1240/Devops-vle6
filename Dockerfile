FROM nginx:latest

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy your app files into nginx
COPY app/ /usr/share/nginx/html

# Expose port 80
EXPOSE 80