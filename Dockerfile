FROM ubuntu:14.04
MAINTAINER Thanh Ha <zxiiro@linux.com>

RUN apt-get update && apt-get install -y \
  python-setuptools \
  python-dev \
  libyaml-dev \
  git

RUN easy_install pip
RUN pip install jenkins-job-builder

VOLUME = ["/jjb"]
WORKDIR /jjb
CMD ["/usr/local/bin/jenkins-jobs", "test", "."]

