FROM alpine:3.7

MAINTAINER Bunnyshell <support@bunnyshell.com>

COPY . /app

WORKDIR /app

RUN apk add --no-cache bash git nginx uwsgi uwsgi-python py2-pip \
	&& pip2 install --upgrade pip \
	&& pip2 install -r requirements.txt \
	&& rm -rf /var/cache/apk/*
	
RUN chmod -R 777 /app

EXPOSE 5000

ENTRYPOINT ["python"]

CMD ["app.py"]
