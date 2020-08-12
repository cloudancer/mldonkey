## mldonkey docker
**ENV**:  mldonkey 3.1.6 on ubuntu 20.04


This repository host the Dockerfile for building mldonkey docker image.

**Usage**

To run mldonkey using this image:

$ docker build -t mldonkey .   # then you docker image tag is mldonkey:latest

$ docker run -d --name donkey -p 4080:4080 -p 6881:6881 -p 6882:6882 mldonkey

mldonkey stores data inside /var/lib/mldonkey/incoming directory

then you can access it like http://127.0.0.1:4080

user:admin

password: Passw0rd

(you can chagne it in Dockerfile when you build ur image)

![alt text](https://github.com/cloudancer/mldonkey/blob/master/d.png)
