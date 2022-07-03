FROM node:18-alpine
RUN mkdir /app
WORKDIR /app
RUN npm run build
COPY ./public /app
EXPOSE 5000
RUN npm i
CMD ["npm", "run", "start"]