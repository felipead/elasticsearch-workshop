Elasticsearch Workshop
======================

A broad and very hands-on Elasticsearch overview in ~4 hours. You're going to learn the core fundamentals of Elasticsearch and also get a glimpse on important *Information Retrieval* and *Distributed Systems* concepts.

You can see the workshop slides at http://speakerdeck.com/felipead/elasticsearch-workshop

What's covered:

- Part 1: Core Concepts 
- Part 2: Search & Analytics 
- Part 3: Dealing with Human Language 
- Part 4: Data Modeling

Environment Setup
-----------------

The first step is to download the repository to your machine. If you have [git](http://git-scm.com):

  - `git clone https://github.com/felipead/elasticsearch-workshop`
  - `cd elasticsearch-workshop`

We have provided Vagrant and Docker environments, as well as manual setup instructions. Choose whatever setup is easier for you.

### Option 1: Using Vagrant

- Requirements:
    - Install [Vagrant](https://www.vagrantup.com/downloads.html)
    - Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

- Initialize Vagrant (this will take a while):
    - `vagrant up`

- Verify everything is working:
    - `vagrant ssh`
    - You might need to wait a few seconds for Elasticsearch to finish booting
    - `curl http://localhost:9200`
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

### Option 2: Using Docker

- Requirements:
    - If you are on Linux:
      - Install [Docker](https://docs.docker.com/engine/installation/)
    - If you are on Windows or Mac:
      - Install the [Docker Toolbox](https://www.docker.com/docker-toolbox)
      - Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

- Run your container:
    - `docker run -p 9200:9200 elasticsearch:2.1 elasticsearch -Des.network.host="0.0.0.0"`

- Verify everything is working:
    - If you use Mac or Windows with Toolbox:
      - `curl http://192.168.99.100:9200`
    - If you use GNU/Linux:
      - `curl http://localhost:9200`
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
### Option 3: *Fedora / CentOS only* 
- Install elasticsearch:
  - `sudo dnf install -y elasticsearch`
- Run it:
  - `sudo systemctl start elasticsearch`

### Option 4: Manual Setup

- Requirements:
    - Install curl:
        - If you have Homebrew: `brew install curl`
        - ...or install Apple Developer Tools
    - Install [JDK](https://jdk8.java.net/download.html) 7 or 8

- Download [Elasticsearch](https://www.elastic.co/downloads/elasticsearch/) 2.x
- Unzip it to a folder in your machine (ex: `~/elasticsearch-2.1.0`)

- Start Elasticsearch:
    - `${ELASTICSEARCH_HOME}/bin/elasticsearch`
    - You might need to wait a few seconds for Elasticsearch to finish booting

- Verify everything is working:
    - `curl http://localhost:9200`
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
