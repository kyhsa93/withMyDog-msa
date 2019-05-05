if test -e with-my-dog
  then cd with-my-dog && git pull && cd ..
fi

if [ ! -d with-my-dog ] ;
  then git clone https://github.com/shiincs/with-my-dog.git
fi

if test -e withMyDog-api
  then cd withMyDog-api && git pull && cd ..
fi

if [ ! -d withMyDog-api ] ;
  then git clone https://github.com/kyhsa93/withMyDog-api.git
fi

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
