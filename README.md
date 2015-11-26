`ELASTICSEARCH WORKSHOP`
======================

Environment Setup
-----------------

### Setup Using Vagrant

- Requirements:
    - Install [Vagrant](https://www.vagrantup.com/downloads.html)
    - Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

- Download the repository:
    - `git clone git@github.com:felipead/elasticsearch-workshop.git`
    - `cd elasticsearch-workshop`

- Initialize Vagrant (this will take a while):
    - `vagrant up`

- Verify everything is working:
    - `vagrant ssh`
    - `curl 'http://localhost:9200/?pretty'`
    - It should print something like:
    
```json
{
  "name" : "Starbolt",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "2.1.0",
    "build_hash" : "72cd1f1a3eee09505e036106146dc1949dc5dc87",
    "build_timestamp" : "2015-11-18T22:40:03Z",
    "build_snapshot" : false,
    "lucene_version" : "5.3.1"
  },
  "tagline" : "You Know, for Search"
}
```

### Manual Setup

- Requirements:
    - Install curl:
        - If you have Homebrew: `brew install curl`
        - Or install Apple Developer Tools
    - Install JDK 7 or 8: https://jdk8.java.net/download.html

- Download [Elasticsearch](https://www.elastic.co/downloads/elasticsearch/) 2.x
- Unzip it to a folder in your machine (ex: `~/elasticsearch-2.1.0`)

- Start Elasticsearch:
    - `${ELASTICSEARCH_HOME}/bin/elasticsearch`

- Verify everything is working:
    - `curl 'http://localhost:9200/?pretty'`
    - It should print something like:
    
```json
{
  "name" : "Starbolt",
  "cluster_name" : "elasticsearch",
  "version" : {
    "number" : "2.1.0",
    "build_hash" : "72cd1f1a3eee09505e036106146dc1949dc5dc87",
    "build_timestamp" : "2015-11-18T22:40:03Z",
    "build_snapshot" : false,
    "lucene_version" : "5.3.1"
  },
  "tagline" : "You Know, for Search"
}
```
