FROM alpine:3.14

COPY repositories /etc/apk/repositories

RUN apk add --no-cache openssh-server openssh-sftp-server \
  && ssh-keygen -A

# Use port 3022 instead of 22
RUN sed -i 's/#Port 22/Port 3022/' /etc/ssh/sshd_config

# Add optional tools for cli users
RUN apk add --no-cache rsync less vim zip

EXPOSE 3022

CMD ["/usr/sbin/sshd", "-D", "-e"]
