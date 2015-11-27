FROM elasticsearch
MAINTAINER Rafael Gomes <rgomes@thoughtworks.com>
CMD ["elasticsearch","-Des.network.host=0.0.0.0"]
