## mlDonkey Docker
**ENV**:  mlDonkey 3.1.6 (only eDonkey and Kademlia) on Ubuntu 20.04

This repository host the Dockerfile for building mlDonkey Docker image.

**Usage**

To run mldonkey using this image:

$ git clone https://github.com/cloudancer/mldonkey.git && cd mldonkey

$ docker build -t cloudancer-mldonkey .

mlDonkey stores data inside "/var/lib/mldonkey/incoming/files" container directory, so we mount it on local filesystem for easy access. We must remove "<>" and customize its content.

$ docker create --name mldonkey --restart=always -p 4080:4080 -p 4000:4000 -p 4001:4001 -p 20562:20562 -p 20566:20566/udp -p 16965:16965/udp -v "<$HOME/Downloads/mlDonkey>:/var/lib/mldonkey/incoming/files" cloudancer-mldonkey

Open 20562/tcp, 20566/udp and 16965/udp in your router and OS.

$ docker start mldonkey

Then you can access mlDonkey like http://127.0.0.1:4080

- user:admin
- password: Passw0rd- (you can chagne it in Dockerfile when you build the image)

![image](https://github.com/cloudancer/mldonkey/blob/master/d.png)

Incomming directory is owned by "mldonkey" container user (uid=101, gid=101), so we need to change permissions for full access:

$ sudo chmod -R 777 <~/Downloads/mlDonkey>

Your downloaded data will be available under "~/Downloads/mlDonkey" directory in local filesystem.

**Other optional mounts**

-v "</var/lib/mldonkey>:/var/lib/mldonkey", -v "</tmp/mldonkey>:/var/lib/mldonkey/temp", -v "<$HOME/Video/mlDonkey>:/var/lib/mldonkey/shared"
