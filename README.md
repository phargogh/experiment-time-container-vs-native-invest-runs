# experiment-time-container-vs-native-invest-runs
Is it faster to run InVEST from a container or using native Sherlock libraries?

We see in the [Sherlock docs](https://www.sherlock.stanford.edu/docs/software/using/anaconda/?h=conda#why-anaconda-should-be-avoided-on-sherlock)
that they recommend we avoid using `conda` builds of software packages on Sherlock because `conda` builds often are not optimized for the
specific architectures and features of Sherlock.  Since we offer containers of InVEST that use `conda-forge` builds of our python stack,
I'd like to see how much slower our containers are compared with a bare-metal installation.

For the bare-metal install, I will create a new virtual environment that contains any required python packages.  Wherever possible,
I will use Sherlock's precompiled packages from their software list.

For the container, I'll probably just use `natcap/devstack`.

## Experimental process

First, you would clone this repository on to Sherlock.

Second, you will need to prep the environment for both the baremetal and
container environments.  The scripts `setup-baremetal.sh` and
`setup-container.sh` are for this purpose.  Run both to set them up.  On
Sherlock, I recommend executing these as jobs, such as with the interactive
`sh_dev` command.

Finally, queue up the jobs to be executed.  The script `./submit.sh` will do this.

## Results

### 2025-07-07

For the two jobs submitted on 2025-07-07, we had the same results, where the
baremetal job timed out due to an OOM event and the container job finished
quickly.  In this case, the container job finished in 14s, probably because
taskgraph determined there were no changes to the input data, so nothing
needed to reexecute.

In case the issue here is with copying of environment variables down to the
spawned processes (since we are using spawn and not fork), I'm going to set
n_workers down to `-1` and re-queue the jobs.

### 2025-07-03

Of the two jobs submitted on 2025-07-02, the baremetal job timed out (due to an
out-of-memory event killing a task process, leading to a graph deadlock that
stalled the whole graph) and the container job finished in 7:39:28.  I am
now setting the `GDAL_CACHEMAX=2048` environment variable in both programs and
restarting the jobs.  In case they are running on different CPUs, I am also
going to echo the hostname and `cat /proc/cpuinfo` to the logs.

### 2025-07-02

I executed both jobs, and it turned out that they both ended up executing on
the same computer, `sh04-07n23` in the `serc` partition.  Since both jobs are
executing at the same time, this is probably good for avoiding potential
differences in CPU architectures across different machines, but it also means
that they will be competing for resources like network bandwidth.
