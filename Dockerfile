FROM node:slim

ARG PORT
ENV PORT=${PORT}
COPY . /addAPI
WORKDIR /addAPI
RUN npm i
RUN echo "exposed port is ${PORT}"
EXPOSE ${PORT}
CMD ["npm", "run", "start"]
