ARG REG_HOSTNAME
ARG REG_FOLDER
FROM ${REG_HOSTNAME}/${REG_FOLDER}/alpine:3.15
MAINTAINER Gerald Wodni <gerald.wodni@gmail.com>

# install packages
RUN apk update && apk add \
    ansible \
    py3-pip \
    python3 \
    tar \
    vim \
    rm -rf /var/cache/apk/*

RUN pip3 install \
    jmespath \
    openshift \
    pyyaml

# ansible user
RUN addgroup -S ansible && adduser -S ansible -G ansible
USER ansible
WORKDIR /home/ansible

# install entry
COPY src/entry.sh /bin/entry.sh
ENTRYPOINT /bin/entry.sh

# install ansible requirements
COPY src/ansible.cfg /etc/ansible/ansible.cfg
COPY src/inventory.yaml /etc/ansible/inventory.yaml
COPY src/requirements.yaml /home/ansible/requirements.yaml
RUN ansible-galaxy install -r requirements.yaml

# copy builtins
COPY builtins builtins/

