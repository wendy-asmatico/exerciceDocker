FROM node:20-slim
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile
ENV NODE_ENV=production
COPY . .
RUN yarn build
USER nextjs
EXPOSE 3000
CMD ["node", "server.js"]