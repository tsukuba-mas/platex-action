# FROM texlive/texlive:latest
FROM aruneko/texlive:latest

WORKDIR /app

RUN ["echo", "hello.txt", ">", "/app/hello.txt"]

COPY entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh" ]
