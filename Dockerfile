FROM node:alpine3.18
COPY ./ ./
RUN npm install
EXPOSE 8095
CMD ["npm", "start"]
