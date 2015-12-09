#!/bin/bash

export HOST=localhost  # for Vagrant, Docker (Linux) or local installs
# export HOST=192.168.99.100  # for Docker on the Mac

curl -X POST "http://$HOST:9200/example/surprise/_bulk?pretty" -d'
{ "index": { "_id": 1 }}
{ "text": "Surprise me!"}
{ "index": { "_id": 2 }}
{ "text": "That was surprising."}
{ "index": { "_id": 3 }}
{ "text": "I was not surprised."}
'