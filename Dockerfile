FROM python:3.8-slim-buster

ENV PYTHONUNBUFFERED 1

# Install some necessary things.
# cron is installed without recommends because otherwise
# it will install mailing systems and other bullshit that we don't need
RUN apt-get update &&\
    apt-get upgrade -y &&\
    apt-get install -y --no-install-recommends cron &&\
    apt-get install -y libpq-dev python3-dev supervisor nginx swig libssl-dev dpkg-dev netcat \
                        default-libmysqlclient-dev gettext libpcre3 libpcre3-dev &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*
################################################

# install my pip dependencies ##################
WORKDIR /app
COPY requirements.txt ./
RUN pip3 install --no-cache-dir -Ur requirements.txt

RUN pip3 install --no-cache-dir -U pip uwsgi sentry-sdk
################################################

# prevent nginx from starting at boot, and stop it if needed #
RUN update-rc.d -f nginx disable
RUN /etc/init.d/nginx stop
##############################################################

# FIX CONFIG ###################################
COPY conf ./conf/

RUN ln -sf "$(pwd)/conf/nginx.conf" /etc/nginx/sites-enabled/ &&\
    ln -sf "$(pwd)/conf/supervisord.conf" /etc/supervisor/ &&\
    rm /etc/nginx/sites-enabled/default &&\
    echo "daemon off;" >> /etc/nginx/nginx.conf

# not sure why this image is called 3.8 when 2.7 is installed...
RUN ln -sf /usr/local/bin/python /usr/bin/python &&\
    ln -sf /usr/local/bin/pip /usr/bin/pip

# set django settings to production ###############
ENV DJANGO_SETTINGS_MODULE=cookbook.settings
###################################################

##### COPY SOURCE ################################
WORKDIR cookbook
COPY . ./
###################################################

EXPOSE 80/tcp

RUN chmod 755 ../conf/run_project.sh

CMD ../conf/run_project.sh
