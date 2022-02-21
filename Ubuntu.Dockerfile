FROM ubuntu:20.04
RUN apt-get update 
RUN apt-get -y install nginx
RUN apt install -y nano
RUN  apt install -y net-tools  

RUN apt-get install -y openssl
RUN openssl req -x509 -nodes -days 3650 -subj "/C=CA/ST=QC/O=Company, Inc./CN=localhost" -addext "subjectAltName=DNS:localhost" \
    -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

ENTRYPOINT nginx && tail -F -n 2 /var/log/nginx/error.log