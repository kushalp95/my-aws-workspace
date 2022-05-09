S3_BUCKET ?=s3://bucket_name
APP_NAME ?=Annotation App

.PHONY: upload build package

upload:
	${INFO} "Zipping $(APP_NAME)"
	@ tar -czvf app.tar.gz src/
	${INFO} "Uploading to S3 Bucket $(S3_BUCKET)"
	@ rm app.tar.gz
	${INFO} "Uploading completed."

build:
	${INFO} "Docker build $(APP_NAME)"
	@ docker build -t app:latest -f src/Dockerfile src/
	${INFO} "Building completed."

package:
	${INFO} "Packaging $(APP_NAME)"
	@ pip install wheel build
	@ python -m build --wheel

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
	printf $(YELLOW); \
	echo "=> $$1"; \
	printf $(NC)' SOME_VALUE

