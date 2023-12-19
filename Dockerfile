FROM node:slim

ARG PORT
ENV PORT=${PORT}
COPY . /addAPI
WORKDIR /addAPI
RUN npm i
EXPOSE ${PORT}
CMD ["npm", "run", "start"]
