Fork of <https://github.com/xteve-project/xTeVe> for building a Docker Image.

## Usage

    docker run -d --restart=always --name=xteve \
        --net=host \
        -e PORT=8080 \
        -v /opt/xteve:/config \
        dersimn/xteve

# To Do

- Find solution to run multiple Docker Containers with two individual IPs on the same host
    - Maybe using [ipvlan](https://docs.docker.com/network/ipvlan/)
    - Background: FritzBox DVB-C Tuner offers 4 Slots, but you can't use 2 Slots with one IP, so `10.1.1.50` will only get one Slot, making it impossible for Plex to watch and record two different streams. If there was a possibility to run xTeVe once with `10.1.1.51` and the second time with `10.1.1.52`, both instances will get one Slot and: win.

## Credits

- [xTeVe Project](https://github.com/xteve-project/xTeVe)
- [dmcallejo](https://github.com/dmcallejo/xTeVe)
