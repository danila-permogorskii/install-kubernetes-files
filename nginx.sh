upstream kube_apiserver {
    server 176.123.176.67:6443; # Master-node-3
    server 212.233.122.31:6443; # Master-node-2
    server 212.233.99.2:6443;   # Master-node-1
    # Add the addresses of all kube-apiserver servers that need to be load-balanced
}

server {
    listen 6443;
    server_name localhost;

    location / {
        proxy_pass http://kube_apiserver;
        # Additional configuration for proxying HTTPS requests to kube-apiserver

        # Load balancing parameters
        proxy_connect_timeout 1s; # Set the timeout for connecting to servers
        proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
        # Select the next server in case of errors
    }
}

# Server block for health checks of kube-apiserver servers
upstream kube_apiserver_check {
    server 176.123.176.67:6443 max_fails=2 fail_timeout=30s;
    server 212.233.122.31:6443 max_fails=2 fail_timeout=30s;
    server 212.233.99.2:6443 max_fails=2 fail_timeout=30s;
    # Add the addresses of all kube-apiserver servers for health checks
    # max_fails - number of errors before marking the server as down
    # fail_timeout - time for which the server is considered down after reaching max_fails
}

# Configuration for monitoring server health, checking every 5 seconds (adjust as needed)
server {
    listen 127.0.0.1:8080;
    location /nginx_status {
        stub_status;
        access_log off;
        allow 127.0.0.1;
        deny all;
    }
}
