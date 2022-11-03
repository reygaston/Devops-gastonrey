# !/bin/bash
archivodia=$(ls /var/log/pritunl.log-????????)
echo comprimo archivo
gzip -9 $archivodia
archivodia="$archivodia".gz""
echo "enviando file a s3"
aws s3 cp $archivodia s3://devops-pritunl-logs/pritunl-vpn-asg-1/
mv $archivodia /var/log/archivepri
