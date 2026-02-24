FROM node:20-slim

# تثبيت git لأنه مطلوب لتحميل dependency من GitHub
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm ci --omit=dev && npm cache clean --force

COPY . .

ENV PORT=10000
EXPOSE 10000

CMD ["node", "index.js"]
