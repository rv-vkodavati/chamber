docker/build:
	docker build . -f Dockerfile.chamber -t mychamber
	docker run -e AWS_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SECURITY_TOKEN -e SERVICE=databricks-staging -e KEY=aws_access_key_id mychamber
myvar?=$(shell docker run -e AWS_REGION -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -e AWS_SECURITY_TOKEN -e SERVICE=databricks-staging -e KEY=aws_access_key_id mychamber)
all: docker/build
	@echo "here"
	@echo $(myvar)

