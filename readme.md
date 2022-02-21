- admin / bantruyenthong

 - gen local ssl: 
  openssl req -x509 -nodes -days 3650 -subj "/C=CA/ST=QC/O=Company, Inc./CN=localhost" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

 