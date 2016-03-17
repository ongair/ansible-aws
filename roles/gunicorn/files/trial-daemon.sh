  #!/bin/bash
  set -e
  LOGFILE=/var/log/gunicorn/access.log
  LOGDIR=$(dirname $LOGFILE)
  NUM_WORKERS=5
  # user/group to run as
  USER=ubuntu
  GROUP=ubuntu
  cd "/opt/ongair-root/ongair/ongair"  
  
  test -d $LOGDIR || mkdir -p $LOGDIR
  exec ../../env/bin/gunicorn play:app \
     -w $NUM_WORKERS \
    --user=$USER --group=$GROUP --log-level=debug \
    --timeout=100 \
    --log-file=$LOGFILE 2>>$LOGFILE

    

   