#!/bin/bash

. function.sh

BAR

CODE [U-02] 패스워드 복잡성 설정

cat << EOF >> $result

[양호]: 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우

[취약]: 패스워드 최소길이 8자리 이상, 영문·숫자·특수문자 최소 입력 기능이 설정된 경우

EOF

BAR

DEF_FILE="/etc/login.defs"

pass=8

echo "PASS_MIN_LEN $pass" >> "$DEF_FILE"

PAM_FILE="/etc/pam.d/system-auth"
EXPECTED_OPTIONS="password    requisite    pam_cracklib.so try_first_pass restry=3 minlen=8 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1"


if [ -f "$PAM_FILE" ]; then
    if grep -q "$EXPECTED_OPTIONS" "$PAM_FILE" ; then
        OK " "$PAM_FILE" 에 $EXPECTED_OPTIONS 없음  "
    else
        echo ""$EXPECTED_OPTIONS"" >> "$PAM_FILE"
        INFO " "$PAM_FILE" 에 설정되었습니다  "
    fi
else
    INFO " "$PAM_FILE" 못 찾음"

cat $result

echo ; echo