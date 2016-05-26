#!/bin/bash

LPATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for i in "$@"; do
  case $i in
    -m=*|--mod=*)
      Mod="${i#*=}"
      #shift
    ;;
    -n=*|--name=*)
      Name="${i#*=}"
      #shift
    ;;
    -p=*|--port=*)
      ListenPort="${i#*=}"
      #shift
    ;;
    -l=*|--lock=*)
      ServerPassword="${i#*=}"
      #shift
    ;;
    -a|--advertise)
      AdvertiseOnline=True
      #shift
    ;;
  esac
done

Name="${Name:-"Dedicated Server"}"
Mod="${Mod:-"ra"}"
ListenPort="${ListenPort:-"1234"}"
ExternalPort="${ExternalPort:-"1234"}"
AdvertiseOnline="${AdvertiseOnline:-"False"}"
AllowPortForward="${AllowPortForward:-"False"}"

while true; do
  cd $LPATH && mono --debug OpenRA.Server.exe Game.Mod=$Mod \
      Server.Name="$Name" Server.ListenPort=$ListenPort Server.ExternalPort=$ExternalPort \
      Server.AdvertiseOnline=$AdvertiseOnline Server.AllowPortForward=$AllowPortForward
done
