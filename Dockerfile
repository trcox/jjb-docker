FROM ubuntu:16.04
MAINTAINER Tyler Cox <tyler_cox@dell.com>

RUN apt-get update && apt-get install -y \
  python-setuptools \
  python-dev \
  libyaml-dev \
  git

RUN easy_install pip
# Install directly from github source repository master
RUN pip install git+https://github.com/openstack-infra/jenkins-job-builder.git

VOLUME = ["/jjb"]
WORKDIR /jjb
CMD ["/usr/local/bin/jenkins-jobs", "test", "."]

