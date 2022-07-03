FROM node:alpine
RUN mkdir /app
WORKDIR /app
COPY package.json ./
COPY package-lock.json ./
COPY ./ ./
EXPOSE 5000
ENTRYPOINT ["npm", "run", "start"]