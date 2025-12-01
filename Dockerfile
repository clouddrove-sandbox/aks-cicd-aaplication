FROM node:18-alpine

WORKDIR /app

# Copy only package files first → this ensures dependencies install properly
COPY app/package*.json ./

RUN npm install --omit=dev

# Copy rest of app
COPY app/ .

ENV PORT=80

EXPOSE 80

CMD ["npm", "start"]