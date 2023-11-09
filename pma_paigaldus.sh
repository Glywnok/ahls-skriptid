#phpmyadmin paigaldusskript
#
# kontrollime, mitu korda phpmyadmin korral  on installed
# sonad on leitud ja vastus salvestame
# muutuja sisse:
PMA=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c 'on installed')
# kui PA muutja vaartus on 0
if [ $PMA -eq 0 ]; then
	echo "Paigaldame phpmyadmin ja vajalikud lisad"
	apt install phpmyadmin
	echo "phpmyadmin on paigaldatud"
elif [ $PMA -eq 1 ]; then
	echo "phpmyadmin on juba paigaldatud"
fi


