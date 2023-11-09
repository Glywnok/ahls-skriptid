MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c 'on installed')

if [ $MYSQL -eq 0 ]; then
    echo "Paigaldame mysql ja vajalikud lisad"
    apt install mysql-server
    echo "mysql on paigaldatud"
    touch $HOME/.my.cnf
    echo "[client]" >> $HOME/.my.cnf
    echo "host = localhost" >> $HOME/.my.cnf
    echo "user = root" >> $HOME/.my.cnf
    echo "password = qwerty" >> $HOME/.my.cnf
elif [ $MYSQL -eq 1 ]; then
     echo "Masinal on olemas juba MySQL."
     mysql
fi
