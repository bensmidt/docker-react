# Build phase
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
CMD ["npm", "run", "build"]

# Run phase
FROM nginx
COPY --from=builder /app/build usr/share/nginx/html
# nginx container will start up everything for us