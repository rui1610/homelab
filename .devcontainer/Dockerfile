FROM python:3-alpine

RUN apk add --update git bash curl unzip zip openssl make

ENV TERRAFORM_VERSION="1.9.5"

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
  rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY requirements.* /tmp/pip-tmp/requirements.*
RUN pip install pip-tools
#RUN pip-compile /tmp/pip-tmp/requirements.in
#RUN pip install -r /tmp/pip-tmp/requirements.txt

ENTRYPOINT ["terraform"]