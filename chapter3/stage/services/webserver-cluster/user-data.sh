#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p>${db_address}</p>
<p>${db_port}</p>
EOF