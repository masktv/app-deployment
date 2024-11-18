 #  For below i will have to add credential in jenkins and  pass them through docker build cmd, so can value of this [ ${MYSQL_USER}, ${MYSQL_PASSWORD}, ${MYSQL_USER} ] gives from jenkins env 
    CREATE DATABASE  mydatabase;
    CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION;
    FLUSH PRIVILEGES;

