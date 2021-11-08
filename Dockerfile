FROM node:16.13.0-alpine

# install dependencies
WORKDIR /wallafront
COPY package.json package-lock.json ./
RUN npm ci

# Copy all local files into the image.
COPY . .

RUN npm run build

###
# Only copy over the Node pieces we need
# ~> Saves 35MB
###
FROM node:16.13.0-alpine

WORKDIR /wallafront
COPY --from=0 /wallafront .
COPY . .
EXPOSE 80
RUN npm start