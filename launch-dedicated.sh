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
<<<<<<< HEAD
AdvertiseOnline="${AdvertiseOnline:-"False"}"
AllowPortForward="${AllowPortForward:-"False"}"
=======
AdvertiseOnline="${AdvertiseOnline:-"True"}"
>>>>>>> e7e17a0f5ac027916a39ce947b907361a7b664ed
EnableSingleplayer="${EnableSingleplayer:-"False"}"
Password="${Password:-""}"

while true; do
<<<<<<< HEAD
  cd $LPATH && mono --debug OpenRA.Server.exe Game.Mod=$Mod \
      Server.Name="$Name" Server.ListenPort=$ListenPort Server.ExternalPort=$ExternalPort \
      Server.AdvertiseOnline=$AdvertiseOnline Server.AllowPortForward=$AllowPortForward
=======
     mono --debug OpenRA.Server.exe Game.Mod=$Mod \
     Server.Name="$Name" Server.ListenPort=$ListenPort Server.ExternalPort=$ExternalPort \
     Server.AdvertiseOnline=$AdvertiseOnline \
     Server.EnableSingleplayer=$EnableSingleplayer Server.Password=$Password
>>>>>>> 853ab798cb70c33290fe971826561687fa7c3b12
done
