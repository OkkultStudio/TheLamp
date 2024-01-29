FROM python:rc-slim-bullseye
RUN apt-get -y update && apt-get -y install cron
RUN pip3 install yeelight
COPY files/* /home/

#RUN chmod 755 /script.sh /entry.sh
RUN /usr/bin/crontab /home/crontab.txt

# Run the command on container startup
RUN touch /var/log/cron.log

CMD cron && tail -f /var/log/cron.log