set -e

OUTPUT_DIR=/secrets/certs

printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "\n"
printf "=====================================================\n"
printf "Configuring Elasticsearch Stack Setup Passwords...   \n"
printf "=====================================================\n"
bin/elasticsearch-setup-passwords interactive
#printf "\n"
#printf "\n"
#printf "\n"
printf "=====================================================\n"
printf "Elasticsearch Usernames and Roles Setup Complete.    \n"
printf "=====================================================\n"


