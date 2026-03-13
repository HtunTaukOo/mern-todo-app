FROM node:alpine

WORKDIR /app

COPY TODO/todo_backend/package*.json ./
RUN npm install

COPY TODO/todo_backend .

WORKDIR /frontend
COPY TODO/todo_frontend/package*.json ./
RUN npm install
COPY TODO/todo_frontend .
RUN npm run build

RUN mkdir -p /app/static
RUN cp -r build /app/static/

WORKDIR /app

EXPOSE 5000

CMD ["npm", "start"]