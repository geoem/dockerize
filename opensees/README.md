Lightweight image of latest OpenSEES.

## opensees

The **Open System for Earthquake Engineering Simulation** (OpenSees) is a software framework for simulating the seismic response of structural and geotechnical systems. OpenSees has been developed as the computational platform for research in performance-based earthquake engineering at the Pacific Earthquake Engineering Research Center. OpenSees has advanced capabilities for modeling and analyzing the nonlinear response of systems using a wide range of material models, elements, and solution algorithms. The software is designed for parallel computing to allow scalable simulations on high-end computers or for parameter studies.

For more info visit: http://opensees.berkeley.edu/OpenSees/home/about.php

### Image attributes
- Base image: Ubuntu 18.04
- OpenSEES version: latest
- Additional packages
    - git 
    - nano 
    - make 
    - tcl8.6 
    - tcl8.6-dev 
    - gcc 
    - g++ 
    - gfortran 
    - python3-dev

**NOTE**: To prevent profiling, without generating extra code for debugging information **-pg** switch has been removed from the initial *Makefile.def* in compilation process according to the following command in Dockerfile:
```sh
sed -i 's|-pg||g' Makefile.def
```

##### Build the image

```sh
$ docker build -t opensees .
```

##### Run
To run your own tcl script, mount *examples* folder to the /examples volume by execute the following:

```sh
$ docker run -it --rm -v ${PWD}/examples:/examples opensees bash -c "OpenSees < /examples/truss10.tcl" 
```

If you want to run opensees interactively inside the container, execute the following:
```sh
$ docker run -it --rm opensees 
```

### Author

Manolis Georgioudakis <<geoem@mail.ntua.gr>>