FROM benchao/qb:1.3
COPY root /

RUN sudo chmod 777 /start.sh
CMD bash start.sh

# Use bash shell
ENV SHELL=/bin/bash

# Install unzip + rclone (support for remote filesystem)
RUN sudo apt-get update && sudo apt-get install unzip -y
RUN curl https://rclone.org/install.sh | sudo bash

COPY upload/rclone.conf /.config/rclone/
COPY upload/ratio_mon.sh /.config/rclone/
COPY upload/qb_auto.sh /.config/rclone/
RUN  sudo chmod 777 /.config/rclone/ratio_mon.sh
RUN  sudo chmod 777 /.config/rclone/qb_auto.sh

