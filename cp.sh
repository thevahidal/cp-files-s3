#! /bin/sh

set -eo pipefail
set -o pipefail

if [ "${S3_ACCESS_KEY_ID}" = "**None**" ]; then
  echo "You need to set the S3_ACCESS_KEY_ID environment variable."
  exit 1
fi

if [ "${S3_SECRET_ACCESS_KEY}" = "**None**" ]; then
  echo "You need to set the S3_SECRET_ACCESS_KEY environment variable."
  exit 1
fi

if [ "${S3_BUCKET}" = "**None**" ]; then
  echo "You need to set the S3_BUCKET environment variable."
  exit 1
fi

if [ "${SOURCE_DIR}" = "**None**" ]; then
  echo "You need to set the SOURCE_DIR environment variable."
  exit 1
fi

if [ "${S3_ENDPOINT}" == "**None**" ]; then
  AWS_ARGS=""
else
  AWS_ARGS="--endpoint-url ${S3_ENDPOINT}"
fi


# env vars needed for aws tools
export AWS_ACCESS_KEY_ID=$S3_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$S3_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$S3_REGION

echo "Finding latest media files"

# LATEST_MEDIA=$(aws $AWS_ARGS s3 ls s3://$S3_BUCKET/$S3_PREFIX/ | sort | tail -n 1 | awk '{ print $4 }')

# echo "Fetching ${LATEST_MEDIA} from S3"

# ls -l $SOURCE_DIR

aws $AWS_ARGS s3 cp --acl public-read --recursive $SOURCE_DIR s3://$S3_BUCKET/$S3_PREFIX/
# gzip -d dump.sql.gz


# echo "Restoring ${LATEST_MEDIA}"

# echo "Restore complete"
