FROM alpine:3.7
LABEL maintainer="Vahid Al <thevahidal@gmail.com>"

ADD install.sh install.sh
RUN sh install.sh && rm install.sh

ENV SOURCE_DIR **None**

ENV S3_ACCESS_KEY_ID **None**
ENV S3_SECRET_ACCESS_KEY **None**
ENV S3_BUCKET **None**
ENV S3_REGION us-west-1
ENV S3_ENDPOINT https://s3.amazonaws.com
ENV S3_PATH 'backup'

ADD cp.sh cp.sh

CMD ["sh", "cp.sh"]
