FROM hashicorp/terraform:latest

RUN mkdir /home/demo
ADD ./ /home/demo

WORKDIR /home/demo
