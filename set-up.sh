#!/bin/sh

mkdir /bitnami/magento/htdocs/app/design
mkdir /bitnami/magento/htdocs/app/design/frontend

chown -R bitnami:daemon ./
find pub/media -type f -exec chmod g+w {} \;
find pub/media -type d -exec chmod g+ws {} \;
 
mv app/design/frontend/Smartwave /bitnami/magento/htdocs/app/design/frontend/
ln -sf /bitnami/magento/htdocs/app/design/frontend/Smartwave /opt/bitnami/magento/htdocs/app/design/frontend/Smartwave
mv app/code /bitnami/magento/htdocs/app/
ln -sf /bitnami/magento/htdocs/app/code /opt/bitnami/magento/htdocs/app/code
mv pub/media/js /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/js /opt/bitnami/magento/htdocs/pub/media/js
mv pub/media/logo /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/logo /opt/bitnami/magento/htdocs/pub/media/logo
mv pub/media/porto /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/porto /opt/bitnami/magento/htdocs/pub/media/porto
mv pub/media/wysiwyg /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/wysiwyg /opt/bitnami/magento/htdocs/pub/media/wysiwyg

cd /opt/bitnami/magento/htdocs
php bin/magento setup:upgrade
php bin/magento setup:di:compile
php bin/magento setup:static-content:deploy
php bin/magento cache:clean && php bin/magento cache:flush
