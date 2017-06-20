MAINSOURCE="/media/sf_Muellberg"
USER="root"
SERVER="172.21.4.30"
PATHONSERVER="/volume1/public/neKisteMitSicherungen/rsync"
FOLDERS=( "Daten" "music" "documents" "alteSicherungCDs" "Software" "VirtualBox" )
FOLDERS=( "Daten" "music" "documents")
for FOLDER in "${FOLDERS[@]}"
do
  echo "****************************************************"
  echo sync $MAINSOURCE/$FOLDER
  echo "****************************************************"
  rsync --times --whole-file --recursive --numeric-ids --delete-after --chmod=Fa-w -v -e ssh $MAINSOURCE/$FOLDER $USER@$SERVER:$PATHONSERVER
  echo "*** done $MAINSOURCE/$FOLDER ***"
done
