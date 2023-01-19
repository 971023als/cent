#!/bin/bash

 

. function.sh

 

BAR

CODE [U-70] expn, vrfy 명령어 제한

cat << EOF >> $result

[양호]: SMTP 서비스 미사용 또는, noexpn, novrfy 옵션이 설정되어 있는 경우

[취약]: SMTP 서비스 사용하고, noexpn, novrfy 옵션이 설정되어 있지 않는 경우

EOF

BAR

TMP1=`SCRIPTNAME`.log

> $TMP1

# Stop the SMTP service
sudo service sendmail stop

# Disable the SMTP service from starting at boot
sudo chkconfig sendmail off


    

cat $result

echo ; echo 
