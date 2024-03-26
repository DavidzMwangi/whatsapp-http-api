FROM node:15

# npm packages
WORKDIR /app
COPY package.json .
COPY package-lock.json .
RUN npm install



# App
WORKDIR /app
ADD . /app
#RUN npm run start:dev
#RUN npm run build
EXPOSE 3000

#CMD npm run start:prod
CMD npm run start:dev
