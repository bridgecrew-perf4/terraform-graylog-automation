help:
	@echo 'make graylog-dev      - create graylog development stack'
	@echo 'make kill-graylog-dev - destroy graylog development stack'
	@echo 'make tf-init          - calls terraform init default'
	@echo 'make tf-plan          - calls terraform plan default'
	@echo 'make tf-apply         - calls terraform apply default'

graylog-dev:
	docker run --name mongo -d mongo:latest
	docker run --name elasticsearch \
			-e "http.host=0.0.0.0" \
			-e "discovery.type=single-node" \
			-e "ES_JAVA_OPTS=-Xms512m -Xmx512m" \
			-d elasticsearch:7.10.1

	echo 'wait for 5 sec to warm up the services...'

	sleep 5

	docker run --name graylog --link mongo --link elasticsearch \
			--restart on-failure:5 \
			-p 9000:9000 -p 12201:12201 -p 1514:1514 \
			-e GRAYLOG_HTTP_EXTERNAL_URI="http://localhost:9000/" \
			-e GRAYLOG2_REST_ENABLE_CORS=true \
			-d graylog/graylog:4.0.2-2

	echo 'graylog dev stack created'

kill-graylog-dev:
	docker rm -f graylog
	docker rm -f mongo
	docker rm -f elasticsearch

make tf-init:
	terraform init default

make tf-plan:
	terraform plan default

make tf-apply:
	terraform apply default