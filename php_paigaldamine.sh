#php paigaldamine
#
# kontrollime, mitu korda php7.0 krral on allalaaditud
# sonad on leitud ja vastus salvestame
# muutuja sisse:
PHP=$(dpkg-query -W -f='${Status}' php7.3 2>/dev/null | grep -c 'ok installed')
# kui PHP muutuja vaartus vordub 0-ga
if [ $PHP -eq 0 ]; then
	# siis ok installed ei ole leitud
	# ja valjastame vastav teade ning
	# paigaldame teenus
	echo "Paigaldame php ja vajalikud lisad"
	apt install php7.3 libapache2-mod-php7.3 php7.3-mysql
	echo "php on paigaldatud"
# kui PHP muutuja vaartus vordub 1-ga
elif [ $PHP -eq 1 ]; then
	# siis on allalaaditud ja on saame vastusena 1
	# ehk True
	echo "php onn juba paigaldatud"
	which php
fi
