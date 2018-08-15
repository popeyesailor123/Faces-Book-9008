FROM  node:8
LABEL maintainer=jon@jaggersoft.com
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
ARG REPO_URL
RUN echo "${REPO_URL}" > repo_url.txt
ARG REPO_SHA
RUN echo "${REPO_SHA}" > repo_sha.txt
CMD [ "npm", "start" ]
