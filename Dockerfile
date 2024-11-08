FROM mysql:latest


# Expose the MySQL port
EXPOSE 3306

# Use ENTRYPOINT to set the entrypoint script
#if contaner getting restart or dsplay error, run with uncomment below line
#ENTRYPOINT ["docker-entrypoint.sh"]

# Specify CMD to start MySQL server
CMD ["mysqld"]
