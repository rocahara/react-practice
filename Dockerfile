FROM nginx:latest

WORKDIR /app
COPY ./test/ ./
COPY ./default.conf /etc/nginx/conf.d/default.conf

RUN apt update && apt install -y \
    nodejs \
    npm && \
    npm install && \
    npm run build

CMD ["nginx","-g","daemon off;"]