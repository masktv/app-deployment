 #  For both i will have to add credential in jenkins and  pass them through dpcker build cmd with using env, so can value of this [ ${MYSQL_USER}, ${MYSQL_PASSWORD}, ${MYSQL_USER} ] gives from jenkins env 
    # CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    # CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    # GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
    # FLUSH PRIVILEGES;

