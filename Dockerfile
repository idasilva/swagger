FROM  swaggerapi/swagger-ui:v3.24.3

COPY ./swagger /usr/share/nginx/html/swagger

EXPOSE 8080
