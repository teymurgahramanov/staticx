# StaticX

Minimalistic and secure Nginx image compiled and configured *only for serving static content*.
https://hub.docker.com/r/teymurgahramanov/staticx

## Features
- Minimal footprint ~ 9.5 MB
- Compiled with only necessary modules
- Only GET method is allowed
- Security configurations
  
## Usage
### Docker Run
```
docker run --name instance-name --rm --mount type=bind,source="$(pwd)"/yourDir,target=/etc/nginx/staticx -d -p 80:80/tcp teymurgahramanov/staticx
```

### Docker Compose
```
version: '3'

#Example: Run instance statix1 for public data
services:
  statix1:
    container_name: staticx1
    image: teymurgahramanov/staticx
    ports:
      - "8081:80"
    volumes:
      - ./data/public:/etc/nginx/staticx:ro

#Example: Run instance statix2 for private data with HTTP Basic Auth
  statix2:
    container_name: staticx2
    image: teymurgahramanov/staticx
    ports:
      - "8082:80"
    volumes:
      - ./data/private:/etc/nginx/staticx:ro
      - ./staticx-auth.conf:/etc/nginx/conf.d/staticx.conf:ro

# and etc ...
```
