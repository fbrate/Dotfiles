
#Backup current Sync folder on server.
rsync -a $pathto_backup "backup_location.$(date +%Y-%d-%M_cl_%H-%M)"
#Upload
rsync -av --progress user@000.000.00.00:/$SERVER_LOCATION/* ~/$CLIENT_LOCATION


