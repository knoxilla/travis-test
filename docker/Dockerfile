FROM openjdk:8-jre-alpine
MAINTAINER Thomas Knox "knoxilla"

# for testing elasticache reachability
RUN apk update && \
		apk add --no-cache redis curl

EXPOSE 8080

ARG appVersion

# which war to grab
ARG grailsEnv
ENV GRAILS_ENV ${grailsEnv}

# images always use TLS in db connections
ENV DB_USETLS=true

# aren't required - just adding ENV vars so
# we know what's deployed exactly
ARG GIT_COMMIT
ENV GIT_COMMIT ${GIT_COMMIT:-unknown}
ARG GIT_REPOHOST
ENV GIT_REPOHOST ${GIT_REPOHOST:-unknown}
ARG GIT_REPOPATH
ENV GIT_REPOPATH ${GIT_REPOPATH:-unknown}

RUN mkdir -p /app/config
VOLUME ["/app/config"]

WORKDIR /app
COPY application-$appVersion.war application.jar
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh

RUN mkdir -p /var/www/logs \
 && chown -R nobody:nobody /var/www/logs
# && chown -R www-data:www-data /var/www/logs
VOLUME ["/var/www/logs"]

# USER www-data
USER nobody

ENTRYPOINT ["./docker-entrypoint.sh"]
