docker run -ti --gpus all -p 8899:8899 -p 8888:8888 -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "$(pwd)"/:/3d_viz 3d_viz