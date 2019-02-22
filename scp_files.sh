#!/bin/bash
for ip in `cat $1`
do
        {
        /tmp/sshpass-1.06/sshpass -p '1qaz2wsx3edc' scp -p -r -P 22  -o StrictHostKeyChecking=no $2 hadoop@$ip:$3  &>/dev/null
        if [ $? -eq 0 ]; then
                echo $ip OK
        else
                echo $ip FAIL
        fi
        }

done
wait
