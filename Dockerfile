# Use Ubuntu 20.04 as the base image
FROM ubuntu:20.04

# Set noninteractive mode for apt-get
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install necessary software
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        apache2 \
        php7.4 \
        libapache2-mod-php7.4 \
        php7.4-mysql \
        php7.4-gd \
        php7.4-xml \
        php7.4-mbstring \
        php7.4-ldap \
        php7.4-curl \
        php7.4-zip \
        php7.4-json \
        php7.4-cli \
        php7.4-fpm \
        php7.4-imagick \
        unzip \
        python3 \
        python3-pip \
    && pip3 install --upgrade pip \
    && pip3 install awscli \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod php7.4 \
    && a2enmod rewrite

# delete default site setting file
# if we will attache efs then not need to delete this file bcoz efs replace all file with in apache2 dir, but make sure efs containe all this file on same path
#RUN  rm /etc/apache2/sites-enabled/000-default.conf \
     #&& rm /etc/apache2/apache2.conf
     
     
# Copy Apache site configuration files & apache config file
# if we attach efs directly to apache2 dir then not need to copy below cmd, efs will replace all file, but make sure that efs contains all this file on same path
#COPY ./domain.conf /etc/apache2/sites-enabled/
#COPY ./subdomain.conf /etc/apache2/sites-enabled/
#COPY ./subdomain1.conf /etc/apache2/sites-enabled/
#COPY ./apache2.conf /etc/apache2/

# Add Entries of ENV in apache2.conf file for dynamic
# not need to run this bcoz we allready copy file with adding this entry in apache2.conf in efs
#RUN echo "SetEnv DataBaseName ${DataBaseName}" >> /etc/apache2/apache2.conf \
    #&& echo "SetEnv AppUserName ${AppUserName}" >> /etc/apache2/apache2.conf \
    #&& echo "SetEnv DataBaseHost ${DataBaseHost}" >> /etc/apache2/apache2.conf \
    #&& echo "SetEnv DataBasePassword ${DataBasePassword}" >> /etc/apache2/apache2.conf

# not need to run those cmd bcoz we allready set int container in deployment.yaml for it
#RUN aws s3 cp s3://....bucket-name....../html.tar.gz . \
 #   && tar -xzf html.tar.gz -C /var/www/ \
  #  && rm html.tar.gz \
   # && chown -R www-data:www-data /var/www/html/ \
    #&& chmod -R 755 /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
