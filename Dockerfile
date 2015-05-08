FROM ubuntu:14.04
MAINTAINER Thanh Ha <thanh.ha@alumni.carleton.ca>

RUN apt-get update && apt-get install -y \
  python-setuptools \
  python-dev \
  libyaml-dev \
  git

RUN easy_install pip
RUN pip install PyYAML
RUN pip install pbr

RUN git clone https://github.com/openstack-infra/jenkins-job-builder.git
RUN cd jenkins-job-builder && python setup.py install

VOLUME = ["/jjb"]
WORKDIR /jjb
CMD ["/usr/local/bin/jenkins-jobs", "test", "."]

