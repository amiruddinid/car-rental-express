FROM node:lts as runner
WORKDIR /api

ENV NODE_ENV production

ARG COMMIT_ID
ENV COMMIT_ID=${COMMIT_ID}

COPY . .

RUN npm install
RUN npx prisma generate
RUN npx prisma migrate deploy
RUN npm run seed

EXPOSE 3000

CMD ["node", "index.js"]
