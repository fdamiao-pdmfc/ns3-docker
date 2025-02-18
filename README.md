# NS3 - Network Simulator Docker image

This repository creates a docker container for the NS3 network simulator with the added repositories for the satellite simulation.

## How to use it?

Run the *build.sh* script to create the image.

Run the *createContainer.sh* script to create the container based on the previous image and to run the first time.

Run the *ns3.sh* script to use the container for the next uses.

## Quick introduction

The ns3 command will be added to the PATH, but for now just go to */usr/ns3/ns-3.43*:

*cd /usr/ns3/ns-3.43*

## Running an example:

Just copy one of the examples to the scratch directory and build it and run it:

- *cd /usr/ns3/ns-3.43*
- *cp examples/udp-client-server/udp-client-server.cc scratch/*
- *./ns3 run scratch/udp-client-server*

## Another note:

Sometimes during the build process of the image, the g++ compiler fails with segv fault. For now, retrying again is the only solution.
If it still fails, try to build the image without the satellite-ns3 repository. For that a Dockerfile-nosat3 is provided.
