#!/bin/bash
cat > index.html <<EOF
<h1>Hi</h1>
<a href="https://www.linkedin.com/in/mborsoi/">https://www.linkedin.com/in/mborsoi/</a>"
EOF
nohup busybox httpd -f -p "${server_port}" &
