FROM node:alpine3.18
COPY package*.json ./
RUN npm install
COPY ./ ./
EXPOSE 8095

CMD ["npm", "start"]
