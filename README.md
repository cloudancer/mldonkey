## mldonkey docker
**ENV**:  mldonkey 3.1.6 on ubuntu 20.04


This repository host the Dockerfile for building mldonkey docker image.

**Usage**

To run mldonkey using this image:

$ docker build -t mldonkey .   # then you docker image tag is mldonkey:latest

$ docker run -d --name donkey -p 4080:4080 -p 6881:6881 -p 6882:6882 -p 6209:6209 -p 16965:16965 -p 20562:20562 -p 20566:20566/udp -p 3617:3617/udp -p 6209:6209/udp mldonkey

mldonkey stores data inside /var/lib/mldonkey/incoming directory

then you can access it like http://127.0.0.1:4080

user:admin

password: Passw0rd

(you can chagne it in Dockerfile when you build ur image)

![image](https://github.com/cloudancer/mldonkey/blob/master/d.png)

mldonkey stores data inside /mnt/mldonkey_completed. You may want to mount the data directory to local filesystem. 

$ docker run -d \
--name donkey \
-p 4000:4000 \
-p 4080:4080 \
-p 6881:6881 \
-p 6882:6882 \
-p 6209:6209 \
-p 20562:20562 \
-p 20566:20566/udp \
-p 3617:3617/udp \
-p 6209:6209/udp \
-p 16965:16965 \
-v "~/data:/mnt/mldonkey_completed" \
mldonkey

Your data will be available under data/incoming directory where you run the docker run command.
