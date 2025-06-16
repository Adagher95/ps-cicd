 #!/bin/sh
    RETRIES=30
    until mysql -h my-release-progressoft-app-mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -e "SELECT 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
      echo "Waiting for MySQL... $((RETRIES--))"
      sleep 5
    done

    if [ $RETRIES -eq 0 ]; then
      echo "MySQL not ready after 30 tries"
      exit 1
    fi
    echo "MySQL is up"
