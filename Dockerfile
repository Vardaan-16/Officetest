FROM node:16.15.0-alpine  
WORKDIR /usr/src/app
COPY package*.json ./
COPY tsconfig*.json ./
COPY src ./src
RUN npm install -g npm@8.10.0
RUN npm install
RUN npm run build
# Bundle app source
COPY . .
EXPOSE 3000
CMD ["npm", "run", "start:prod"]
