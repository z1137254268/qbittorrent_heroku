FROM benchao/qb:1.3

# Install unzip + rclone (support for remote filesystem)
RUN sudo apt-get update && sudo apt-get install unzip -y
RUN curl https://rclone.org/install.sh | sudo bash


COPY root /

RUN sudo chmod 777 /start.sh
CMD bash start.sh
