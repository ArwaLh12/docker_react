FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
#container expose port 80
EXPOSE 80
#COPY from the step builder (tagged as builder) 
#the folder build (result of npm run build) into nginx html folder
# by default the folder is /usr/share/nginx/html check dockerhb desc for nginx
# in oder to work remove builder and put 0
COPY --from=0 /app/build /usr/share/nginx/html