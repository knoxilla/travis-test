#!/bin/sh
set -e

exec java -Dgrails.env=$GRAILS_ENV -jar application.jar $@
