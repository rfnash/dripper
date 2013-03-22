Dripper
=======

**Dripper** is a collection of definitions to install software packages
with [stow], the GNU package manager. It's always recommended to use
package manager provided by your system, but sometimes you need a tool
to install alternate packages.

You can see a list of definitions [here][definitions].


Install
-------

Clone the repository and run the install script:

    git clone git://github.com/fesplugas/dripper.git ~/.dripper

To enable `dripper` run:

    ~/.dripper/bin/drip init

And follow the instructions.


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

Thanks to [sub], *a delicious way to organize programs*.

[stow]: http://www.gnu.org/s/stow/
[Homebrew]: https://github.com/mxcl/homebrew
[sub]: https://github.com/37signals/sub
