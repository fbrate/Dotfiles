
#Backup current Sync folder on server.
ssh user@000.000.00.00 /user/backup_script.sh
#Uploa
rsync -a ~/work/* user@000.000.00.00:/$PATH

