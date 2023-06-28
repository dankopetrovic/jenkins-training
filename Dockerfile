ARG CHROME_VERSION='107.0.5304.121-1'
ARG FIREFOX_VERSION='107.0'
ARG CYPRESS_VERSION='12.15.0'

FROM cypress/factory

COPY . /opt/app
WORKDIR /opt/app
RUN npm install --save-dev cypress

## root user needed to create
## and to set user rights to working directory
USER root

## creates the cypress-docker directory
RUN mkdir /cypress-docker
 
##sets the cypress-docker directory as working directory
WORKDIR /cypress-docker

## gives every user read, write and execute rights in cypress-docker folder
RUN ls -la /cypress-docker
RUN chmod 777 /cypress-docker

## copies the necessary files for npm install and run to the working directory
COPY ./cypress.config.js .
COPY ./package.json .
COPY ./package-lock.json .

 ## runs npm install with parameters necessary to avoid open cypress issues with docker
RUN npm install --unsafe-perm --allow-root
 
## verifies installation
RUN npx cypress verify
 
## defines your entry point can be changed on demand
## for instance if you only want to use a npm run script you can set it to
## ["npm","run","scriptname"]
ENTRYPOINT [ "npx","cypress","run" ]