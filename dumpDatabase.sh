DUMP_FILE_NAME="backupOn`date +%Y-%m-%d-%H-%M_${PGDATABASE}`.dump"
echo "Creating dump: $DUMP_FILE_NAME"

cd pg_backup

sleep 5m

pg_dump -C -w --format=c --blobs > $DUMP_FILE_NAME

if [ $? -ne 0 ]; then
  rm $DUMP_FILE_NAME
  echo "Back up not created, check db connection settings"
  exit 1
fi

echo 'Successfully Backed Up'
exit 0