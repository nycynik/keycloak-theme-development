#!/bin/bash

# create a zip of the theme and upload to S3
# usage: ./zip_and_upload.sh <theme_name> <bucket_name> <aws_profile>

THEME_NAME=$1
BUCKET_NAME=$2
AWS_PROFILE=$3
EXPIRATION=3600  # 1 hour in seconds

if [ -z "$THEME_NAME" ]; then
  echo "Please provide a theme name"
  exit 1
fi

if [ -z "$BUCKET_NAME" ]; then
  echo "Please provide a bucket name"
  exit 1
fi

if [ -z "$AWS_PROFILE" ]; then
  echo "Please provide an AWS profile"
  exit 1
fi

# create a zip of the theme
cd themes
zip -r $THEME_NAME.zip $THEME_NAME

# upload the zip to S3
aws s3 cp $THEME_NAME.zip s3://$BUCKET_NAME/$THEME_NAME.zip --profile $AWS_PROFILE

# Generate presigned URL
PRESIGNED_URL=$(aws s3 presign s3://$BUCKET_NAME/$THEME_NAME.zip --expires-in $EXPIRATION --profile $AWS_PROFILE)

# remove the zip
rm $THEME_NAME.zip

cd ..

echo "File uploaded successfully!"
echo "Share this URL (valid for 1 hour):"
echo $PRESIGNED_URL

