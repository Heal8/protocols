#!/bin/bash

mode=$1
protocol=$2
environment=$3

auth="Authorization: Basic $HEALEE_STAGE_AUTH"
url=$HEALEE_STAGE_URL

if [ "$environment" = "prod" ]; then
	auth="Authorization: Bearer $HEALEE_PROD_AUTH"
	url=$HEALEE_PROD_URL
fi

if [ "$mode" = "fetch" ]; then
	aws s3 sync --exact-timestamps --profile $protocol --delete s3://protocol-$protocol ./development/$protocol
elif [ "$mode" = "notify" ]; then
	if [ "$environment" = "prod" ]; then
		echo "You can't notify a protocol in production environment."
	else
		curl -w "\n" -H $auth -X POST $url/api/v1/notifyProtocol/$protocol
	fi
elif [ "$mode" = "build" ]; then
	if [ -f "./development/$protocol/info.json" ]; then
		aws s3 sync --exact-timestamps --profile $protocol --delete --exclude ".git/*" --exclude "node_modules/*" --exclude "package-lock.json" ./development/$protocol s3://protocol-$protocol
		curl -w "\n" -H "$auth" -X POST $url/api/v1/buildProtocol/$protocol
	else
		echo "Protocol doesn't exist. Please, call fetch to retrieve the initial version of the protocol."
	fi
else
	echo "Try running: ./protocols.sh fetch|build|notify [protocol name]"
fi
