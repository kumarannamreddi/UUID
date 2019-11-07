
#!/usr/bin/bash
# Reading oracleid and customer id
DBNAME=$1
##CUSTID=$2
# Message display
echo -e "You entered $DBNAME"
echo -e "Thank you. Please see the README.md for advanced options and further info"

echo $DBNAME > oraclesid.BAK
##echo $CUSTID > custid.BAK

#echo $CUSTID > customerid.BAK
export DBNAME=$(cat oraclesid.BAK)
#export CUSTID=$(cat custid.BAK)
sed -i -e "1s/^/$DBNAME/" custid.BAK
export COMBINEDNAME=$(cat custid.BAK)
sed -i -e "s/replaceme/$COMBINEDNAME/g" main.tf
sleep 2
echo -e "Provisioning infra"
terraform init
terraform plan
terraform apply -auto-approve
echo -e "Successfully executed"

cd ./ansible
sudo ./get_IPs.sh
sudo ansible-playbook Playbook.yml -vvv
exit
