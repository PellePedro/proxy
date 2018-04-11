# Sample proxy in go with Docker buildfile

# Building Docker Image
```
sudo docker build -t pellepedro/proxy:0.1.0 .
```

# Docker start script 

```
cat << EOF | tee start-proxy.sh
#!/bin/bash

sudo nohup docker run --network=host --restart=always  pellepedro/proxy:0.1.0 proxy -bind FRONT_IP:PORT -backend BACKEND_IP:PORT &
EOF

chmod +x start-proxy.sh

```

# Running the proxy as Docker Image

```
./start-proxy.sh
```
