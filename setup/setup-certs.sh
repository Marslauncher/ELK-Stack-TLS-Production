set -e

OUTPUT_DIR1=/secrets/basic_certs
OUTPUT_DIR2=/secrets/certs
OUTPUT_DIR3=/secrets/p12certs


ZIP_FILE_BASIC=$OUTPUT_DIR1/basic_certs.zip
ZIP_FILE_P12=$OUTPUT_DIR3/elastic-stack-ca.p12.zip
ZIP_FILE_FULL=$OUTPUT_DIR2/full_certs.zip

printf "======= Generating Elastic Stack Certificates =======\n"
printf "=====================================================\n"

if ! command -v unzip &>/dev/null; then
    printf "Installing Necessary Tools... \n"
    apt install -y -q -e 0 unzip;
fi

printf "=====================================================\n"
printf "=====================================================\n"
printf "Clearing Old Certificates if exits... \n"
printf "=====================================================\n"
printf "=====================================================\n"
printf "\n"
printf "\n"
printf "\n"

find $OUTPUT_DIR1 -mindepth 1 -type d -exec rm -rf -- {} +
rm -f $OUTPUT_DIR1/*.zip


find $OUTPUT_DIR2 -mindepth 1 -type d -exec rm -rf -- {} +
rm -f $OUTPUT_DIR2/*.zip

find $OUTPUT_DIR3 -mindepth 1 -type d -exec rm -rf -- {} +
rm -f $OUTPUT_DIR3/*.zip

printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Setting security for the elastic stack... \n"
printf "=====================================================\n"
bin/elasticsearch-certutil http
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Generating... \n"
printf "=====================================================\n"
printf "\n"
printf "\n"
printf "\n"
bin/elasticsearch-certutil cert --silent --pem --in /setup/instances.yml -out $ZIP_FILE_FULL &> /dev/null
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Generating CA for the Stack... \n"
printf "=====================================================\n"
printf "\n"
printf "\n"
printf "\n"
bin/elasticsearch-certutil ca  
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Generating Full Stack Certs... \n"
printf "=====================================================\n"
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
bin/elasticsearch-certutil cert --ca elastic-stack-ca.p12 --in /setup/instances.yml
printf "=====================================================\n"
printf "Unzipping Basic Certifications... \n"
printf "=====================================================\n"
printf "\n"
printf "\n"
printf "\n"
unzip -qq /secrets/certs/basic_certs.zip -d $OUTPUT_DIR1;
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Unzipping Full Stack Certifications...               \n"
printf "=====================================================\n"
printf "\n"
printf "\n"
printf "\n"
unzip --qq /secrets/certs/full_certs.zip -d $OUTPUT_DIR2;
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Unzipping CA P12 Certifications... \n"
printf "=====================================================\n"
unzip --qq  /secrets/certs/elastic-stack-ca.p12.zip -d $OUTPUT_DIR3;
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Applying Permissions... \n"
printf "=====================================================\n"
chown -R 1000:0 $OUTPUT_DIR1
chown -R 1000:0 $OUTPUT_DIR2
chown -R 1000:0 $OUTPUT_DIR3
printf "\n"
printf "\n"
printf "\n"
#find $OUTPUT_DIR -type f -exec chmod 655 -- {} +

printf "=====================================================\n"
printf "SSL Certifications generation completed successfully.\n"
printf "=====================================================\n"




