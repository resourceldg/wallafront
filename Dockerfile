FROM node:16.13.0-alpine

# install dependencies
WORKDIR /wallafront
COPY package.json package-lock.json ./
RUN npm ci

# Copy all local files into the image.
COPY . .

EXPOSE 80
CMD ["npm","run", "dev" ,"--hosts" , "0.0.0.0" ,"--port", "80"]