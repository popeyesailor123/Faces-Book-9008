FROM  node:8
LABEL maintainer=jon@jaggersoft.com
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
ARG REPO_URL
RUN echo "${REPO_URL}" > repo.url.txt
ARG REPO_SHA
RUN echo "${REPO_SHA}" > repo.sha.txt
CMD [ "npm", "start" ]
