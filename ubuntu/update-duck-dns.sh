#!/bin/bash

# Ask Duck DNS to update their record of this machine's remote IP.
# Note: The IP is not passed in. Instead they are expected to detect it automatically.

echo url='https://www.duckdns.org/update?domains=m3g5hw3h&token=06bc1302-92e8-4e78-8aa5-abef1c34b0f6' | \
    curl \
        --insecure \
        --output ~/.duckdns/duck.log \
        --config -
