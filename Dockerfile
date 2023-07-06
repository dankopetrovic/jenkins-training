ARG CHROME_VERSION='114.0.5735.198-1'
ARG FIREFOX_VERSION='114.0.2'
ARG CYPRESS_VERSION='12.15.0'

FROM cypress/factory

## moves the node cache folder out from the root folder
RUN mv /root/.cache /home/node/.cache

## sets the Cypress cache folder
ENV CYPRESS_CACHE_FOLDER=/home/node/.cache/Cypress

## copies the necessary files for npm install and run to the working directory
COPY --chown=node:node ./package.json ./package-lock.json ./cypress.config.js /opt/app/
WORKDIR /opt/app

## installs all packages
RUN npm ci

## changes the user to node
USER node
 
## defines your entry point can be changed on demand
## for instance if you only want to use a npm run script you can set it to
## ["npm","run","scriptname"]
ENTRYPOINT [ "npx","cypress","run" ]