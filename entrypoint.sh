#!/bin/sh

if [ ! -f /var/lib/mldonkey/downloads.ini ]; then
    mldonkey &
    echo "Waiting for mldonkey to start..."
    sleep 5
    /usr/lib/mldonkey/mldonkey_command -p "" "set run_as_user mldonkey" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set allowed_ips 0.0.0.0/0" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "share 0 /mnt/mldonkey_completed/files incoming_files" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "share 0 /mnt/mldonkey_completed/directories incoming_directories" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "unshare shared" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "unshare incoming/files" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "unshare incoming/directories" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set enable_overnet true" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set enable_kademlia true" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set enable_bittorrent true" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set ED2K-connect_only_preferred_server true" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set max_hard_upload_rate 100" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set max_hard_download_rate 0" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set temp_directory /mnt/mldonkey_tmp" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set ED2K-max_connected_servers 4" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set ED2K-firewalled-mode false" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set ED2K-port 20562" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set BT-dht_port 3617" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set max_concurrent_downloads 150" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set filenames_utf8 true" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set create_file_mode 664" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set create_dir_mode 775" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "set create_file_sparse true" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "urladd server.met http://ed2k.2x4u.de/v1s4vbaf/min/server.met" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "urladd guarding.p2p http://upd.emule-security.org/ipfilter.zip" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "urladd geoip.dat https://mirrors.download3k.com/token/a4f5830bcd49fec1856557a9204eacb7/GeoIP.dat.gz" "save"
    /usr/lib/mldonkey/mldonkey_command -p "" "urladd hublist http://dchublist.com/hublist.config.bz2" "save"
    if [ -z "$MLDONKEY_ADMIN_PASSWORD" ]; then
        /usr/lib/mldonkey/mldonkey_command -p "" "kill"
    else
        /usr/lib/mldonkey/mldonkey_command -p "" "useradd admin $MLDONKEY_ADMIN_PASSWORD"
        /usr/lib/mldonkey/mldonkey_command -u admin -p "$MLDONKEY_ADMIN_PASSWORD" "kill"
    fi
    # First port 6209 is for overnet, second 16965 for kad, we leave all the same
    sed -i '0,/   port =/s/   port =.*/  port = 6209/' /var/lib/mldonkey/donkey.ini
    sed -i '0,/   port =/s/   port =.*/  port = 16965/' /var/lib/mldonkey/donkey.ini
    sed -i 's/  port =/   port =/' /var/lib/mldonkey/donkey.ini
fi

chown -R mldonkey:mldonkey /var/lib/mldonkey
chown -R mldonkey:mldonkey /mnt/mldonkey_completed
chown -R mldonkey:mldonkey /mnt/mldonkey_tmp

mldonkey 
