state=$(piactl get connectionstate)

case "$state" in
"Connected")
  echo '{"text":" PIA","class":"connected","tooltip":"PIA Connected"}'
  ;;
"Connecting")
  echo '{"text":" PIA","class":"connecting","tooltip":"PIA Connecting..."}'
  ;;
*)
  echo '{"text":" PIA","class":"disconnected","tooltip":"PIA Disconnected"}'
  ;;
esac
