FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm ci

CMD ["npm", "run", "build"]

FROM nginx:alpine

WORKDIR /app
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
COPY nginx-default.conf /etc/nginx/conf.d/default.conf




