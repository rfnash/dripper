  tmux-1.6
  vim-7.3.492

Search should allow filtering:

  $ $TESTDIR/../bin/drip search ruby
  ruby-1.9.3-p0
  ruby-1.9.3-p125
  ruby-1.9.3-p194

Search should allow search by partial name:

  $ $TESTDIR/../bin/drip search t
  ctags-5.8
  git-1.7.10
  mutt-1.5.21
  python-2.7.3
  tmux-1.6

Search should return a message when no definitions found:

  $ rm -rf $TESTDIR/tmp
  $ mkdir -p $TESTDIR/tmp
  $ STOW_DEFINITIONS_PATH=$TESTDIR/tmp $TESTDIR/../bin/drip search
  No definitions found.
  [1]

Search should return an error when STOW_DEFINITIONS_PATH not found:

  $ STOW_DEFINITIONS_PATH=$TESTDIR/unexisting $TESTDIR/../bin/drip search
  Provided STOW_DEFINITIONS_PATH does not exist.
  [1]
