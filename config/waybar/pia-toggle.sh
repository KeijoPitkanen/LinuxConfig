state=$(piactl get connectionstate)

if [ "$state" = "Connected" ]; then
  piactl disconnect
else
  piactl connect
fi
