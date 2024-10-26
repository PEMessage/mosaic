#!/bin/bash

if [ -z "$1" ] ; then
    file="examples/hello.py"
else
    file="$1"
fi

rm -rf  output.json
python3 mosaic.py -c "$file" | tee output.json |  python3 -m vis > output.html
echo "http://localhost:9078/output.html"
python3 -m http.server 9078
