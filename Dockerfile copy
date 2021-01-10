FROM ubuntu:latest

# install packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    curl \
    python3 \
    latexmk \
    lmodern \
    texlive \
    texlive-latex-extra \
    texlive-lang-japanese \
    && rm -rf /var/lib/apt/lists/*

# update tables
RUN mktexlsr && mkdir -p /app
WORKDIR /app

RUN ls
RUN pwd

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh" ]