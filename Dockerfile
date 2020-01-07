FROM debian:buster

ARG USER

COPY --from=ralex/salt:latest / /
COPY --from=ralex/vbox:latest / /

RUN groupadd -r -g 1000 ${USER} \
    && useradd -r -m -u 1000 -g 1000 -G vboxusers -s /bin/bash ${USER}

RUN mkdir -p /var/cache/salt /var/log/salt /var/run/salt \
    && chown -R ${USER}: /etc/salt /var/cache/salt /var/log/salt /var/run/salt

ADD machines/ /srv/machines
RUN chown -R ${USER}: /srv/machines

WORKDIR /home/${USER}
USER ${USER}

ADD entrypoint.sh /usr/local/bin/

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

CMD ["/bin/bash"]
