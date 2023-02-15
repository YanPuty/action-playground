FROM node:18.13-alpine
ENV NODE_ENV=production

WORKDIR /home/node/app

COPY ["package.json", "package-lock.json*", "./"]

RUN npm install --production

COPY . /home/node/app

EXPOSE 3000

ENV PORT 3000

CMD ["node", "src/index.js"]