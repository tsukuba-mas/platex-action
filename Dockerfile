# FROM texlive/texlive:latest
FROM aruneko/texlive:latest
COPY entrypoint.sh /entrypoint.sh
COPY .latexmkrc .latexmkrc22
RUN pwd
RUN ls
RUN ["chmod", "+x", "/entrypoint.sh"]
ENTRYPOINT [ "/entrypoint.sh" ]
