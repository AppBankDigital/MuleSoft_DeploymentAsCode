echo "=== Deployment has started! ==="

#check input arguments
if [[ $# -eq 0 ]] ; then
    echo "ERROR: Please, pass the filename for deployment descritor as an argument!"
    exit 1
fi

#Parse deployment descriptor config file
echo "=== Parsing deployment descriptor configuration file"
filename="$1"
while read -r line
do
    data="$line"
    echo "Data - $data"
done < "$filename"

#Dowload deployable package from repository
echo "=== Downloading deployable package from repository"
curl -O https://github.com/igor-repka/packages/raw/master/bid-processing-1.0.0-SNAPSHOT.zip

echo '=== Anypoint API is being invoked'
user="$(anypoint-cli --username=$anypoint_username --password=$anypoint_password --output json account user describe)"
echo $user

echo "=== Deployment has finished successfully! ==="