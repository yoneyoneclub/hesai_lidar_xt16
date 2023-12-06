#!/bin/bash

# hesai cars
# s1100-1 s1100-2 s1300-2 s712-2 s712-4

CAR=$( $TOOL_DIR/get_map_car.py car )

if grep $CAR $0 >/dev/null; then

  ADDR1=192.168.1.201
  ADDR2=192.168.2.202

  DEV1=$( ip route get $ADDR1 | cut -d ' ' -f3 )
  DEV2=$( ip route get $ADDR2 | cut -d ' ' -f3 )

  DN1=$( ethtool -T $DEV1 | grep "PTP Hardware Clock:" | cut -d ' ' -f4 )
  DN2=$( ethtool -T $DEV2 | grep "PTP Hardware Clock:" | cut -d ' ' -f4 )

  #PASS=XXXX

  CMD="echo $PASS | sudo -S ptp4l -i $DEV1 -p /dev/ptp$DN1 -i $DEV2 -p /dev/ptp$DN2 -m"
  echo $CMD
  sh -c "$CMD"

else

  while true; do
    sleep 3600
  done

fi

# EOF
