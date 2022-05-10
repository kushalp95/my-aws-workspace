S3_BUCKET := $$(cat ../.cf/template.yaml | shyaml get-value Parameters.SourceBucketName.Default)
APP_NAME ?=Sample App

.PHONY: upload package run_docker

upload:
	${INFO} "Uploading to S3 Bucket $(S3_BUCKET)"
	@ aws s3api put-object --bucket $(S3_BUCKET) --key package.zip --body package.zip --no-cli-pager
	@ rm package.zip
	${INFO} "Uploading completed."

package:
	${INFO} "Packaging $(APP_NAME)"
	@ zip -x "app/Dockerfile" -r package.zip app/

run_docker:
	${INFO} "Build Docker Image"
	@ docker build -t app:latest app/.
	${INFO} "Run $(APP_NAME) in docker"
	@ docker run --rm -p 5000:5000 test:latest

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
	printf $(YELLOW); \
	echo "=> $$1"; \
	printf $(NC)' SOME_VALUE
