FROM node:12.8.1-alpine
WORKDIR /wedvn-server

COPY ./.npmrc ./package*.json ./
RUN npm install

COPY . .
CMD ["npm", "start"]

EXPOSE 5000
