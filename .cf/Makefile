STACK:="codepipeline-app"

.PHONY: create remove update

create:
		${INFO} "Creating ci/cd stack ..."
		@ aws cloudformation create-stack --stack-name $(STACK) --template-body file://template.yaml --capabilities CAPABILITY_IAM
		${INFO} "Creating ci/cd stack complete"

update:
		${INFO} "Updating ci/cd stack ..."
		@ aws cloudformation update-stack --stack-name $(STACK) --template-body file://template.yaml --capabilities CAPABILITY_IAM
		${INFO} "Updating ci/cd stack complete"

remove:
		${INFO} "Removing ci/cd stack ..."
		@ aws cloudformation delete-stack --stack-name $(STACK)
		${INFO} "Removing ci/cd stack complete, please review cloudformation stack"

# Cosmetics
YELLOW := "\e[1;33m"
NC := "\e[0m"

# Shell Functions
INFO := @bash -c '\
  printf $(YELLOW); \
  echo "=> $$1"; \
  printf $(NC)' SOME_VALUE