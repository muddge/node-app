FROM node:13

#Working Directory
WORKDIR /app

#Install app dependencies
COPY package.json ./
RUN npm install

#Bundle app source
COPY . .

#Expose port 3000
EXPOSE 3000

CMD [ "npm", "start" ]
