##docker
`
docker build  -t digital-aws/swagger:1.0 .
docker run -p 80:8080 -e API_URL=/swagger/api.yml  -t digital-aws/swagger:1.0
`

## Referencies
`
https://github.com/swagger-api
`
