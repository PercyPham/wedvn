FROM node:12.8.1-alpine
WORKDIR /wedvn

COPY ./.npmrc ./package*.json ./
RUN npm install

COPY . .
CMD ["npm", "run", "start"]
