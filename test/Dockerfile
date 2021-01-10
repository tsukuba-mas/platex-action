FROM ubuntu:latest

# none
RUN ls

# /
RUN pwd

# /appをカレントディレクトリ
WORKDIR /app

# none
RUN ls

# /app
RUN pwd

# /app/some.txt
COPY some.txt some.txt

# /entrypoint.sh
# ルートに置く
COPY entrypoint.sh /entrypoint.sh

# some.txt
RUN ls

# /app
RUN pwd

ENTRYPOINT [ "/entrypoint.sh" ]

