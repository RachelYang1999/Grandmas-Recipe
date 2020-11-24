FROM tiangolo/uwsgi-nginx:python3.6

ENV UWSGI_INI /app/uwsgi-frontend.ini
ENV NGINX_MAX_UPLOAD 50m

WORKDIR /app
COPY application.conf /etc/nginx/conf.d/
VOLUME /app
