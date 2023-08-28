FROM ubuntu:22.04
ENV PATH="${PATH}:${HOME}/bin"
RUN apt-get update -y -q && \
    apt-get install -qq -y --no-install-recommends ca-certificates gpg dirmngr gnupg-agent sudo && \
    gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/miktex.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D6BC243565B2087BC3F897C9277A7293F59E4889 && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/miktex.gpg] https://miktex.org/download/ubuntu jammy universe" | sudo tee /etc/apt/sources.list.d/miktex.list && \
    apt-get update -y -q && \
    apt-get install -qq -y --no-install-recommends miktex && \
    apt-get clean
RUN miktexsetup --verbose finish
RUN initexmf --verbose --set-config-value=[MPM]AutoInstall=1
RUN miktex --verbose packages update-package-database
RUN miktex --verbose packages update
RUN miktex --verbose packages update
RUN miktex --verbose packages install cm-super
RUN miktex --verbose fontmaps configure
RUN miktex --verbose fndb refresh
RUN initexmf --verbose --update-fndb
RUN initexmf --verbose --mklinks --force
RUN updmap
