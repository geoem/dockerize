Lightweight image of Octave 4.4.2.

## octave

**GNU Octave** is software featuring a high-level programming language, primarily intended for numerical computations. Octave helps in solving linear and nonlinear problems numerically, and for performing other numerical experiments using a language that is mostly compatible with MATLAB. It may also be used as a batch-oriented language. Since it is part of the GNU Project, it is free software under the terms of the GNU General Public License. 

For more info visit: https://www.gnu.org/software/octave/

### Image attributes
- Base image: Ubuntu 18.10
- Octave version: 4.4.2

##### Build the image

```sh
$ docker build -t octave .
```

##### Run
```sh
$ docker run --rm -it -v ${PWD}/src:/src octave /bin/sh -c "octave /src/example.m" 
```

### Author

Manolis Georgioudakis <<geoem@mail.ntua.gr>>