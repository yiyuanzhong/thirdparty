# thirdparty
Dependency is always a headache for C/C++ applications, nor it's easy for web apps.
You need to find a proper distro and rely on packages it provides, and you need great
efforts to make sure your develop machine has the same environment as the production
machines. It's even worse when you're running multiple applications distributed in
different time on the same production server, the dependencies can conflict.

In short, thirdparty is a distro without toolchain.

### What if
* You're using a Linux distro that has so few packages
* You want to use most recent packages on an old distro
* You'd like to have controlled (and confined) runtime environment for you application

### Why not homebrew
* root privilege
* Need to do it again on production machines
* Globally affected when you update a library

### Why not docker
* You need a docker ready environment
* And do you want to know who made the docker environment and how? (Check LFS)

### What you get
* Up to date common packages widely used in daily development
* No root privilege required, compiling nor running
* Tested on CentOS7, but it should work on any distro with a C++11 capable GNU toolchain (in case you don't, have a look at my another project toolchain)
* Ready to be packaged and distributed to clean client machines (you need flinter to make a relocatable package)

### What you don't
* You still need to run packaged application on the same distro when compiling.
For example glibc will dynamically load system libraries even if you're static linked, and crash.
The only safe way to get a fully controlled environment is to build the toolchain and run your application within a chroot (or docker).
* If you want to dynamic link or be linked with system provided components.
For example you want to write a PAM module, or you want to load system provided GSSAPI libraries.
Other components might depend on different library versions, and crash.

### After all, a distro is not only packages stick together. It's packages stick together harmonically.
