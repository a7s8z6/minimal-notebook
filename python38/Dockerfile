FROM registry.access.redhat.com/ubi8/python-38:1-104

ENV JUPYTER_ENABLE_LAB="1" \
    ENABLE_PIPENV="1" \
    UPGRADE_PIP_TO_LATEST="1"

USER root

# Copying scripts and source files
COPY scripts /tmp/scripts
COPY src /tmp/src
COPY python38/Pipfile /tmp/src/
COPY python38/Pipfile.lock /tmp/src/

RUN chown -R 1001:0 /tmp/scripts /tmp/src
USER 1001

RUN /tmp/scripts/config
CMD ["/tmp/scripts/run"]
