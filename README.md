# docker-slack-desktop
A Docker image that start a fresh Slack-desktop client. 

[![Circle CI](https://circleci.com/gh/xorilog/docker-slack-desktop.svg?style=shield)](https://circleci.com/gh/xorilog/docker-slack-desktop)  

## Usage
To spawn a new instance of Slack:

```shell
docker run --rm -it --name slack \
       -v /tmp/.X11-unix:/tmp/.X11-unix \
       -e DISPLAY=unix$DISPLAY \
       --device /dev/snd \
       -v ~/.config/Slack:/root/.config/Slack \
       xorilog/slack-desktop
```
## Issues
* You have to log out Slack to close the docker container.  
* Slack app is reloaded multiple time before fixing itself


## FAQ
### Docker <1.8
Before Docker 1.8 you need to replace `--device /dev/snd` by `-v /dev/snd:/dev/snd --privileged`.  


### QXcbConnection: Could not connect to display unix:0
```shell
xhost +
```
do not forget to remove it after start or usage (`xhost -`)  
The previous command is to be run on a linux machine. But Mac users, I have a special surprise for you. You can also do fun hacks with X11. Details are described [here](https://github.com/docker/docker/issues/8710).


Thanks to [Slack](https://slack.com/) for their great app !
