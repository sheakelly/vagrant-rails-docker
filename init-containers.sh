echo 'starting consul'
docker run -d -p 8400:8400 -p 8500:8500 -p 8600:53/udp -h node1 progrium/consul -server -bootstrap -ui-dir /ui

echo 'starting registrator'
docker run -d -v /var/run/docker.sock:/tmp/docker.sock -h $HOSTNAME gliderlabs/registrator consul:

echo 'start nginx-proxy'
docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock jwilder/nginx-proxy

echo 'start rails app'
docker build -t rails-app .
docker run -d -p 3000:3000 -e VIRTUAL_HOST=rails.railrocker.local rails-app
