# mldonkey docker
env:  mldonkey 3.1.6 on ubuntu 20.04


This repository host the Dockerfile for building mldonkey docker image.

Usage

To run mldonkey using this image:

$ docker run -d --name donkey -p 4080:4080 -p 6881:6881 -p 6882:6882 hiluo/mldonkey

mldonkey stores data inside /var/lib/mldonkey. You may want to mount the data directory to local filesystem. Doing this will persist the data when you re-create the docker container. It is also easier to get downloaded files this way.

$ docker run -d -p 4080:4080 -p 6881:6881 -p 6882:6882 -v "`pwd`/data:/var/lib/mldonkey" hiluo/mldonkey

Your data will be available under data/incoming directory where you run the docker run command.

then you can access it like http://127.0.0.1:4080
user:admin password: Passw0rd(you can chagne it at Dockerfile when you build ur image)
