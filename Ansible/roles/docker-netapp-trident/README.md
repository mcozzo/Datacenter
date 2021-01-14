sudo mkdir /mnt/trident/jackett
sudo mkdir /mnt/trident/ombi
sudo mkdir /mnt/trident/plex
sudo mkdir /mnt/trident/radarr
sudo mkdir /mnt/trident/sabnzbd
sudo mkdir /mnt/trident/sonarr
sudo mkdir /mnt/trident/tautulli
sudo mkdir /mnt/trident/transmission
sudo mkdir /mnt/trident/cacti
sudo mkdir /mnt/trident/cacti/config
sudo mkdir /mnt/trident/cacti/backups
sudo mkdir /mnt/trident/cacti/db

sudo mount 10.11.14.10:netappdvp_jackettcozzonet_jackett_cozzo_net_config  /mnt/trident/jackett
sudo mount 10.11.14.10:netappdvp_ombicozzonet_ombi_cozzo_net_config /mnt/trident/ombi
sudo mount 10.11.14.10:netappdvp_plexcozzonet_plex_cozzo_net_config /mnt/trident/plex
sudo mount 10.11.14.10:netappdvp_radarrcozzonet_radarr_cozzo_net_config  /mnt/trident/radarr
sudo mount 10.11.14.10:netappdvp_sabnzbdcozzonet_sabnzbd_cozzo_net_config  /mnt/trident/sabnzbd
sudo mount 10.11.14.10:netappdvp_sonarrcozzonet_sonarr_cozzo_net_config  /mnt/trident/sonarr
sudo mount 10.11.14.10:netappdvp_tautullicozzonet_tautulli_cozzo_net_config  /mnt/trident/tautulli
sudo mount 10.11.14.10:netappdvp_transmissioncozzonet_transmission_cozzo_net_config  /mnt/trident/transmission

sudo mount 10.11.14.10:netappdvp_cacticozzonet_cacti_cozzo_net_config /mnt/trident/cacti/config
sudo mount 10.11.14.10:netappdvp_cacticozzonet_cacti_cozzo_net_backups /mnt/trident/cacti/backups
sudo mount 10.11.14.10:netappdvp_cacticozzonet_cacti_cozzo_net_db /mnt/trident/cacti/db



sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/jackett.cozzo.net/config/*      /mnt/trident/jackett/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/sonarr.cozzo.net/config/*       /mnt/trident/sonarr/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/radarr.cozzo.net/config/*       /mnt/trident/radarr/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/transmission.cozzo.net/config/* /mnt/trident/transmission/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/sabnzbd/config/*                /mnt/trident/sabnzbd/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/ombi.cozzo.net/config/*         /mnt/trident/ombi/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/tautulli.cozzo.net/*            /mnt/trident/tautulli/


sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/booksonic.cozzo.net/config/*    /mnt/trident/booksonic/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/cacti.cozzo.net/data/*          /mnt/trident/cacti/config/
#sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/cacti.cozzo.net/backups/*       /mnt/trident/cacti/backups/
sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/cacti.cozzo.net/db/*            /mnt/trident/cacti/db/

sudo rsync -ah --progress /mnt/docker/.snapshot/Plex-20210103/configs/plex/config/*                   /mnt/trident/plex/
