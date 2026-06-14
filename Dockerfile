FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

# Enable gzip for large JS data files
RUN printf 'server {\n\
    listen 80;\n\
    root /usr/share/nginx/html;\n\
    index index.html;\n\
    gzip on;\n\
    gzip_types text/html text/css application/javascript;\n\
    gzip_min_length 1024;\n\
    location / {\n\
        try_files $uri $uri/ =404;\n\
    }\n\
}\n' > /etc/nginx/conf.d/default.conf

COPY . /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
