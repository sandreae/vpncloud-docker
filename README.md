# vpncloud docker

[vpncloud](https://vpncloud.ddswd.de/)

Run a [vpncloud](https://github.com/dswd/vpncloud) instance in a docker container.

## Deploy

Build and deploy image using docker. It is important to note that you should overide the default CMD with your own network configurations when starting the container. The image currently runs vpncloud v2.2.0 but you could replace this with the version you want by placing the relevent binary in the `files` folder and updating the Dockerfile. Versions can found [here](https://github.com/dswd/vpncloud/releases).

```sh
# build image
docker build -t vpncloud-img .

# run container, overriding default CMD
docker run \
    --cap-add=NET_ADMIN \
    -p 3210:3210/udp \
    --device /dev/net/tun:/dev/net/tun \
    -it vpncloud-img \
    vpncloud --password MyBetterPassword1234 \
    --ip 10.0.0.1
```
