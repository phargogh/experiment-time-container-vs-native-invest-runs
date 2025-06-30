# experiment-time-container-vs-native-invest-runs
Is it faster to run InVEST from a container or using native Sherlock libraries?

We see in the [Sherlock docs](https://www.sherlock.stanford.edu/docs/software/using/anaconda/?h=conda#why-anaconda-should-be-avoided-on-sherlock)
that they recommend we avoid using `conda` builds of software packages on Sherlock because `conda` builds often are not optimized for the
specific architectures and features of Sherlock.  Since we offer containers of InVEST that use `conda-forge` builds of our python stack,
I'd like to see how much slower our containers are compared with a bare-metal installation.

For the bare-metal install, I will create a new virtual environment that contains any required python packages.  Wherever possible,
I will use Sherlock's precompiled packages from their software list.

For the container, I'll probably just use `natcap/devstack`.
