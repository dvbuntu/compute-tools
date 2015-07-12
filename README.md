# compute-tools
Support tools for the [Interactive Computing Workflow](http://githbu.io/dvbuntu/compute).

This includes an Arch Linux PKGBUILD file and a more comprehensive installation script:

* `ww.pkgbuild` - This is the core interactive workflow package.  Really, it is only dependencies on the base tools needed by the workflow.  As it has dependencies in the AUR itself, you'll need an AUR helper like `yaourt` to install this.  N.B. At this time, I haven't found an AUR helper that both handles dependencies in the AUR, and will build a custom PKGBUILD such as this one.  Until then, please use:

* `ww.install.sh` - Non-AUR version of the PKGBUILD.  A placeholder until the build system can be worked out.

* `init.sh` - This is a simple desktop environment that includes all the workflow tools.  It also installs some sane defaults into your `.tmux.conf`, `.vimrc`, etc.  Once your basic ARch system is installed, just run this to get a decent setup installed.  At the `yaourt` prompts (probably fancy colors), just enter `1` to install the package.
