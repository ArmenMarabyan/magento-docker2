# Magento2 (PHP7.4 + Redis + RabbitMQ + ElasticSearch + PhpMyAdmin + MariaDB + Nginx + Varnish) docker

## Infrastructure overview
* Container 1: php
* Container 2: fpm
* Container 3: composer
* Container 4: nginx
* Container 5: db (MariaDB)
* Container 6: phpmyadmin
* Container 7: elasticsearch
* Container 8: redis
* Container 9: rabbitmq
* Container 10: varnish

### Build and Installation
Step 1: Build
```
docker-compose up --build -d
```
Step 2: In "composer" container install magento2
```
composer create-project --repository=https://repo.magento.com/ magento/project-community-edition .
```
Step 3: Setup magento2
```
php -dmemory_limit=5G bin/magento setup:install \
  --base-url=http://localhost:8080 \
  --db-host=db \
  --db-name=magento \
  --db-user=root \
  --db-password=root \
  --admin-firstname=admin \
  --admin-lastname=admin \
  --admin-email=admin@admin.com \
  --admin-user=admin \
  --admin-password=admin123 \
  --language=en_US \
  --currency=USD \
  --timezone=America/New_York \
  --use-rewrites=1 \
  --elasticsearch-host=elasticsearch \
  --elasticsearch-port=9200
```
#### Other magento commands
```
php bin/magento deploy:mode:set developer
php bin/magento cache:disable
php bin/magento cache:clean
php bin/magento cache:flush
```