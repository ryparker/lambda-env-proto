# Base lambda image
FROM public.ecr.aws/lambda/nodejs:latest

USER root
RUN mkdir -p /app
WORKDIR /tmp

#
# Copy the handler code
#
RUN mkdir -p /app/handler
COPY /handler /app/handler

#
# Install NPM dependencies
#
WORKDIR /app/handler
RUN npm install

#
# Build and run
#

RUN npm run build

#
# Set proxy env vars
#
ENV no_proxy=www.google.com
ENV http_proxy=https://$PROXY_USERNAME:$PROXY_PASSWORD@${PROXY_ADDRESS}:3128

ENTRYPOINT [ "npm", "run" ]
