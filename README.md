configfiles
========

Keeping track of your config files makes it extremely easy to replicate your environment on other machines. Here is my most important ones.

####Directions:

1. Add file to keep track of into configfiles root directory. I recommend not using any dot names so that
   the file is not hidden.
2. Enter entry into the configlists.txt file. Examples can be found in
   configlists.txt.
3. Run setup.py, which will generate all of the necessary symlinks.

**NOTE:** You should also be able to keep track of full directories.

-----
I also maintain a seperate repo with my own custom [`oh-my-zsh`](https://github.com/robbyrussell/oh-my-zsh) changes,
which I try my best to keep up-to-date with the main `oh-my-zsh` repo.

###Installing my custom oh-my-zsh:

#####Clone the repository

     git clone https://github.com/bradtse/oh-my-zsh ~/.oh-my-zsh

#####Either manually create the symlink:

      ln -s ~/<path to configfiles dir>/zshrc ~/.zshrc
      
#####Or use setup.py:

      python ~/<path to configfiles dir>/setup.py

#####Set zsh as the default shell

      chsh -s /bin/zsh

#####And restart the shell
