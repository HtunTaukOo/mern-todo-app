FROM node:alpine

WORKDIR /app

COPY TODO/todo_backend/package*.json ./
RUN npm install

COPY TODO/todo_backend .

RUN mkdir -p static/build

EXPOSE 5000

CMD ["npm", "start"]