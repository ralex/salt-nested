FROM debian:buster

ARG USER

COPY --from=ralex/salt:latest / /
COPY --from=ralex/vbox:latest / /

RUN groupadd -r -g 1000 ${USER} \
    && useradd -r -m -u 1000 -g 1000 -G vboxusers -s /bin/bash ${USER}

RUN chown -R ${USER} /etc/salt

WORKDIR /home/${USER}
USER ${USER}
ADD Vagrantfile .
