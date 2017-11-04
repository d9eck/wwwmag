#!/bin/sh

cd wwwmag
chown -R bitnami:daemon .
find pub/media -type f -exec chmod g+w {} \;
find pub/media -type d -exec chmod g+ws {} \;
cd ..

mv wwwmag/app/design/frontend/Smartwave /bitnami/magento/htdocs/app/design/frontend/
ln -sf /bitnami/magento/htdocs/app/design/frontend/Smartwave /opt/bitnami/magento/htdocs/app/design/frontend/Smartwave
mv wwwmag/app/code /bitnami/magento/htdocs/app/
ln -sf /bitnami/magento/htdocs/app/code /opt/bitnami/magento/htdocs/app/code
mv wwwmag/pub/media/js /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/js /opt/bitnami/magento/htdocs/pub/media/js
mv wwwmag/pub/media/logo /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/logo /opt/bitnami/magento/htdocs/pub/media/logo
mv wwwmag/pub/media/porto /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/porto /opt/bitnami/magento/htdocs/pub/media/porto
mv wwwmag/pub/media/wysiwyg /bitnami/magento/htdocs/pub/media/
ln -sf /bitnami/magento/htdocs/pub/media/wysiwyg /opt/bitnami/magento/htdocs/pub/media/wysiwyg

cd /opt/bitnami/magento/htdocs
sudo -u bitnami php bin/magento setup:upgrade
sudo -u bitnami php bin/magento setup:di:compile
sudo -u bitnami php bin/magento setup:static-content:deploy
sudo -u bitnami php bin/magento cache:clean && php bin/magento cache:flush
