git clone https://github.com/shiincs/with-my-dog.git

git clone https://github.com/kyhsa93/withMyDog-api.git

echo "insert mysql password: "\\c
read mysqlPassword

export MYSQL_ROOT_PASSWORD=$mysqlPassword

docker-compose up -d --build
if [ $? -eq 1 ];then
  sudo docker-compose up -d --build
  if [ $? -eq 1 ];then
    echo "\033[31m"can not compose up. please try again."\033[0m"
    exit 1
  fi
fi
