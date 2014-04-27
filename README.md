configfiles
========

These are a few of my more important configuration files.

Directions:

1. Add file you want to keep track of into configfiles root directory. I recommend not using any dot names so that
   the file is not hidden.
2. Enter entry into the configlists.txt file. Examples can be found in
   configlists.txt.
3. Run setup.py.

NOTE: You should also be able to keep track of full directories.

I also maintain a seperate repo with my own oh-my-zsh custom changes,
which I try to keep up-to-date with the main oh-my-zsh repo.

How to install my oh-my-zsh:
git clone https://github.com/bradtse/oh-my-zsh ~/.oh-my-zsh

Then either manually create the symlink:
ln -s ~/<path to configfiles dir>/zshrc ~/.zshrc
or using setup.py:
python ~/<path to configfiles dir>/setup.py

Lastly, set zsh as the default shell
chsh -s /bin/zsh

And restart the shell
