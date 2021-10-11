# StaticX

Minimalistic Nginx image compiled and configured for only serving static content.

## Features
- Minimal footprint ~ 9.5 MB
- Compiled with only necessary modules
- Only GET method is allowed
  
## Usage
### Docker Run
```
docker run --name instance-name --rm --mount type=bind,source="$(pwd)"/yourDir,target=/etc/nginx/staticx -d -p 80:80/tcp static:latest
```

### Docker Compose
```
version: '3'

#Example: Run instance statix1 for public data
services:
  statix1:
    container_name: staticx1
    image: staticx:latest
    ports:
    - "8081:80"
    volumes:
    - ./data/public:/etc/nginx/staticx:ro

#Example: Run instance statix2 for private data with HTTP Basic Auth
  statix2:
    container_name: staticx2
    image: staticx:latest
    ports:
      - "8082:80"
    volumes:
      - ./data/private:/etc/nginx/staticx:ro
      - ./staticx-auth.conf:/etc/nginx/conf.d/staticx.conf:ro

# and etc ...
```