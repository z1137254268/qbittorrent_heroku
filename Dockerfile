FROM benchao/qb:1.3
COPY root /

RUN sudo chmod 777 /start.sh
CMD bash start.sh

USER qb

# Use bash shell
ENV SHELL=/bin/bash


# Install unzip + rclone (support for remote filesystem)
RUN sudo apt-get update && sudo apt-get install unzip -y
RUN curl https://rclone.org/install.sh | sudo bash
COPY upload/rclone.conf /home/qb/.config/rclone
COPY upload/ratio_mon.sh /home/qb
COPY upload/qb_auto.sh /home/qb
RUN  sudo chmod 777 /home/qb/ratio_mon.sh
RUN  sudo chmod 777 /home/qb/qb_auto.sh

RUN sudo chown -R qb:qb /home/qb/.local 
