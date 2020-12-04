FROM  swaggerapi/swagger-ui:latest

ARG API_URL

WORKDIR app/

COPY api /usr/share/nginx/html/swagger

EXPOSE 8080
























docker run -p 8081:8080 -e SWAGGER_JSON=/foo/swagger.json -v /bar:/foo swaggerapi/swagger-ui
