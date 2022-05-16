# build docker container
docker build -t buildkernel .

# execute build process within 
docker run -it \
  -v $(pwd)/common:/common \
  -v $(pwd)/out:/out \
  -v $(pwd)/../:/src \
  buildkernel \
  /bin/bash -c " \
    /common/scripts/1_build_menuconfig.sh \
  "