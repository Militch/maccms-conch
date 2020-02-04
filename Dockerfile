FROM registry.cn-hangzhou.aliyuncs.com/esiran/maccms:php7.2-fpm

RUN php-ext-sg-install.sh


COPY . template/conch

RUN chown -R www-data:www-data template/conch

COPY docker-maccms-conch-entrypoint.sh /usr/local/bin/docker-maccms-conch-entrypoint.sh

ENTRYPOINT [ "docker-maccms-conch-entrypoint.sh" ]

CMD ["php-fpm"]