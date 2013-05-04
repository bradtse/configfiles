#!/usr/bin/env python

# Author: Bradley Tse
# Email: bradleytse@gmail.com
#
# A simple script to set up important config files
#
# To add more configs to keep track of, just add the file to the config folder
# and then add an entry to the configlist file

import sys
import shutil
import argparse
import os
import glob
from pprint import pprint as pp

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
HOME_DIR = os.path.expanduser("~")
CONFIG_DIR = os.path.join(HOME_DIR, ".config")
# These are the two lists of the config files you wish to use. Please make
# sure to use the actual name of the config file.
HOME_CONFIGS = [".ackrc", ".bashrc", ".conkyrc", ".dircolors", ".gitconfig",
                ".vimrc"]


def create_config(configs, args, dot=True):

def main():

    parser = argparse.ArgumentParser(description="Install config files")
    parser.add_argument('-f', '--force',
                        action="store_true",
                        help="Overwrite any pre-existing config files without "
                             "prompting")
    parser.add_argument('-v', '--verbose',
                        action="store_true",
                        help="Print all actions")
    args = parser.parse_args()

    config_list = scan_config_list()
    create_config(HOME_CONFIGS, args)

if __name__ == '__main__':
    sys.exit(main())
