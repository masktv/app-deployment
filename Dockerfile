FROM mysql:latest


# Expose the MySQL port
EXPOSE 3306

# Copy init.sql script file to allow dbuser on database to connect from any host.
COPY ./init.sql /docker-entrypoint-initdb.d/

# Use ENTRYPOINT to set the entrypoint script
ENTRYPOINT ["docker-entrypoint.sh"]

# Specify CMD to start MySQL server
CMD ["mysqld"]
