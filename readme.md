
 - gen local ssl: 
  openssl req -x509 -nodes -days 3650 -subj "/C=CA/ST=QC/O=Company, Inc./CN=localhost" -addext "subjectAltName=DNS:localhost" -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt;

 - composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition ./install

 - bin/magento setup:install   --base-url=http://localhost   --db-host=db   --db-name=magento_demo   --db-user=test   --db-password=Abcde123   --admin-firstname=admin --admin-lastname=admin   --admin-email=admin@admin.com   --admin-user=ubuntu-magento   --admin-password=admin123   --language=en_US   --currency=USD   --timezone=Asia/Ho_Chi_Minh   --use-rewrites=1   --elasticsearch-host=elasticsearch   --elasticsearch-port=9200