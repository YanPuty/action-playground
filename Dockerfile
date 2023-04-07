ARG NODE_VERSION=node:18.13-alpine
ARG WORKDIR=/home/node/app

# Install Dependencies
FROM ${NODE_VERSION} AS dependency
RUN apk add --no-cache libc6-compat
ENV NODE_ENV=production
WORKDIR ${WORKDIR}
COPY ["package.json", "package-lock.json*", "./"]
RUN npm install --production


FROM ${NODE_VERSION} AS builder
WORKDIR ${WORKDIR}
COPY . .
RUN npm run build

FROM ${NODE_VERSION} AS runner
WORKDIR ${WORKDIR}
COPY --from=builder --chown=bloguser:bloggroup /app ./

EXPOSE 3000
ENV PORT 3000

CMD ["npm", "start"]