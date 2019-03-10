###########################################################
# Lightweight image of latest OpenSEES.
#
# Build the image: 
#   $ docker build -t opensees . 
# 
# To run your own tcl script, mount examples folder to the 
#   /examples volume and execute the following:
#
#   $ docker run -it --rm -v ${PWD}/examples:/examples opensees bash -c "OpenSees < /examples/truss10.tcl" 
# 
###########################################################

FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update && \
	apt-get -y install git nano make tcl8.6 tcl8.6-dev gcc g++ gfortran python3-dev && \ 
	useradd --create-home opensees && \ 
	cd /home/opensees && \ 
	mkdir bin lib && \
	git clone https://github.com/OpenSees/OpenSees.git && \ 
	cd OpenSees && \ 
	cp MAKES/Makefile.def.EC2-UBUNTU Makefile.def && \ 
	sed -i 's|./usr/local|/usr/local|g' Makefile.def && \
	sed -i 's|./home|/home/opensees|g' Makefile.def && \
	sed -i 's|-pg||g' Makefile.def && \	
	make 
	
ENV PATH $PATH:/home/opensees/bin
WORKDIR /examples