# postgres-restore-s3

A docker image to imply copy files from your local/server to an S3 bucket.


## Usage

First off create a .env file with the below variables:

```sh
# .env 

S3_REGION= 
S3_ACCESS_KEY_ID= 
S3_SECRET_ACCESS_KEY= 
S3_BUCKET= 
S3_ENDPOINT= # Not required. In case you're using S3 services other than AWS, e.g. Digitalocean, ...
S3_PREFIX= # Not required. The folder inside your bucket to separate copied files from others. 
SOURCE_DIR= # Directory of the folder that will be copied to S3. This directory should be inside the container that you take volumes from.
```

The run the docker image with the required arguments:
```sh
$ docker run -it --volumes-from container_with_files --env-file .env thevahidal/cp-files-s3:latest
```
