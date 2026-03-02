FROM ubuntu:24.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -qy \
    ffmpeg \
    ghostscript \
    libreoffice-calc \
    libreoffice-draw \
    libreoffice-impress \
    libreoffice-math \
    libreoffice-writer \
    poppler-utils \
    ca-certificates && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# I, Librarian
ENV USER="i-librarian" \
    UID="9060" \
    GROUP="i-librarian" \
    GID="9060" \
    PATH="/opt/i-librarian-pro:$PATH"

# User needs a home dir for LibreOffice.
RUN set -ex; \
  groupadd -r --gid "$GID" "$GROUP"; \
  useradd -r -m --uid "$UID" --gid "$GID" "$USER"

COPY etc /etc/
COPY opt /opt/

RUN mkdir -p /var/www/i-librarian-pro /var/log/i-librarian && \
    chown -R "$UID":"$GID" /var/www/i-librarian-pro /var/log/i-librarian

EXPOSE 9060

USER ${UID}

ENTRYPOINT [ "/opt/i-librarian-pro/i-librarian-pro" ]
CMD [ "start", "-config", "/etc/opt/i-librarian-pro/run.env" ]

STOPSIGNAL SIGINT