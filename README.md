Dripper
=======

**Dripper** is a collection of definitions to install software packages
with [stow], the GNU package manager. It's always recommended to use
package manager provided by your system, but sometimes you need a tool
to install alternate packages.

You can see a list of definitions [here][definitions].


Install
-------

### Using Git

Clone the repository and run the install script:

    git clone git://github.com/fesplugas/dripper.git
    cd dripper
    script/install


### Using the installer

    curl -L https://raw.github.com/fesplugas/dripper/master/script/installer | bash


Usage
-----

Common operations:

    drip install redis-2.4.10
    drip uninstall redis-2.4.10
    drip unlink redis-2.4.10
    drip link redis-2.4.10
    drip path redis-2.4.10
    drip update

You can get a list of all available commands by running `drip`.


Commands with custom env file
-----------------------------

Imagine you have different projects with different requirements and
want to load a different `ruby` version for each one. Familiar, right?

Create an `.env` file in the root of your project and append packages
paths:

    drip path ruby-1.9.3-p194 >> .env

Now you can run all commands using `drip`, which will act as a namespace.

    $ ruby --version
    ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-darwin12.2.1]

    $ ./bin/drip ruby --version
    Sourced /Users/fesplugas/Development/dripper/.env
    ruby 1.9.3p392 (2013-02-22 revision 39386) [x86_64-darwin12.2.1]

Notice that you can also set environment variables on that file.


Conventions
-----------

- Sources are downloaded into `/usr/local/src` or `$HOME/.packages/src`.
- Packages are compiled into `/usr/local/stow` or `$HOME/.packages/stow`.


Acknowledgements
----------------

Thanks to [Homebrew], it's an awesome tool. As an [stow] user I
always wanted to do something similar and [Homebrew] has inspired
many of the commands used by **Dripper**.

Thanks to [ruby-build] and [rbenv], project organization has been
heavily inspired by them. Also some "helpers" used in [drip-helper]
have been copied from [rbenv].


[stow]: http://www.gnu.org/s/stow/
[ubuntu]: http://www.ubuntu.com/
[redhat]: http://www.redhat.com/
[Homebrew]: https://github.com/mxcl/homebrew
[ruby-build]: https://github.com/sstephenson/ruby-build
[rbenv]: https://github.com/sstephenson/rbenv
[drip-helper]: https://github.com/fesplugas/dripper/blob/master/libexec/drip-helper
[definitions]: https://github.com/fesplugas/dripper/blob/master/share/dripper/definitions
