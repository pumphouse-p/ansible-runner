FROM registry.access.redhat.com/ubi8/python-39:1-18.1634036280

ENV ANSIBLE_VERSION 2.9

USER 0
RUN dnf upgrade -y && \
    pip install --upgrade pip && \
    pip install ansible==${ANSIBLE_VERSION} && \
    pip install jmespath && \
    mkdir -p /playbooks && \
    chown 1001:1001 /playbooks
USER 1001

WORKDIR /playbooks
ENTRYPOINT ["ansible-playbook"]
CMD ["--help"]