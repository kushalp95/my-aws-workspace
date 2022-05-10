S3_BUCKET := $$(cat ../.cf/template.yaml | shyaml get-value Parameters.SourceBucketName.Default)
APP_NAME ?=Annotation App

.PHONY: upload package

upload:
	${INFO} "Uploading to S3 Bucket $(S3_BUCKET)"
	@ aws s3api put-object --bucket $(S3_BUCKET) --key package.zip --body package.zip --no-cli-pager
	@ rm package.zip
	${INFO} "Uploading completed."

package:
	${INFO} "Packaging $(APP_NAME)"
	@ pip install wheel build
	@ python -m build --wheel
	${INFO} "Zipping $(APP_NAME)"
	@ zip -r package.zip dist/

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
	printf $(YELLOW); \
	echo "=> $$1"; \
	printf $(NC)' SOME_VALUE
