#!/bin/bash
yum update -y
yum install -y busybox
cat > index.xhtml <<EOF
<h1>${server_text}</h1>
<h1>Hello, World</h1>
<p>DB address: ${db_address}</p>
<p>DB port: ${db_port}</p>
EOF
nohup busybox httpd -f -p ${server_port} &