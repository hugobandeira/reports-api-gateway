USERID=$(shell id -u)

build:
	userid=${USERID} docker-compose build

setup:
	sudo chown root:root .docker/cron

up:
#	date && pwd && whoami && git pull origin master
# 	docker exec reports-api-gateway-app composer install
	userid=${USERID} docker-compose up -d

test:
	docker exec reports-api-gateway-app php artisan optimize:clear --env=testing
	docker exec reports-api-gateway-app ./vendor/bin/phpunit -c phpunit.xml --log-junit report.xml --coverage-clover clover.xml --coverage-html coverage --whitelist app/

deploy:
	docker-compose up -d
	docker exec reports-api-gateway-app chown -R www-data:www-data /var/www
	docker exec reports-api-gateway-app chown -R 0:0 /var/www/.docker/cron
	docker exec reports-api-gateway-app composer install --no-dev
	docker exec reports-api-gateway-app php artisan migrate --force
	docker-compose restart

stop:
	docker-compose stop

install-hooks:
	@for f in githooks/* ; do \
  		file=`echo $$f | cut -d "/" -f2` ; \
  		echo $$file ; \
  		rm -f .git/hooks/$$file ; \
  		ln -s $(PWD)/githooks/$$file .git/hooks/$$file ; \
	done

clear-cache-local:
	docker exec reports-api-gateway-app php artisan optimize:clear --env=local
