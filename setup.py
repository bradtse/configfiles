#!/usr/bin/env python

###############################################################################
# Author: Bradley Tse
# Email: bradleytse@gmail.com
#
# A simple script that creates a bunch of symlinks to the different config
# files in the configfiles directory. The idea is that you should be able
# to just clone this git repo, and then run "python setup.py".
#
# To add more configs to keep track of, just add the file to the config folder
# and then add an entry to "configlist.txt". You should then either manually
# create a symlink to the newly added config file, or run setup.py. Either way,
# make sure that any changes you make to the config file are to the one in the
# configfiles directory.
#
##############################################################################

import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
CONFIG_FILE = os.path.join(SCRIPT_DIR, "configlist.txt")


def scan_config_list():
    """Scans configlist.txt and returns a dictionary of config names to locations"""
    print("parsing configlist.txt")
    config_dict = {}
    with open(CONFIG_FILE, 'r') as f:
        for line_num, line in enumerate(f):
            line = line.strip().rstrip('\n')

            # Ignore comments
            if line[0] == "#":
                continue

            split = line.split(':')

            # TODO Add more error checking
            if len(split) != 2:
                sys.exit("Incorrect entry at line {0}".format(line_num + 1))

            config_dict[split[0]] = split[1]

    return config_dict


def create_link(config, path):
    """Create a symlink from config to path"""
    config_path = os.path.join(SCRIPT_DIR, config)
    install_path = os.path.expanduser(path)
    if os.path.exists(install_path):
        while True:
            ans = raw_input("overwrite {0}? (y/n) ".format(install_path))
            if ans in ['y', 'Y', 'yes', 'Yes', 'YES']:
                print("creating symlink from {0} to {1}".format(
                      install_path, config_path))
                os.remove(install_path)
                os.symlink(config_path, install_path)
                break
            elif ans in ['n', 'N', 'no', 'No', 'NO']:
                print("skipping")
                return
    else:
        while True:
            ans = raw_input("create symlink for {0}? (y/n) ".format(
                            install_path))
            if ans in ['y', 'Y', 'yes', 'Yes', 'YES']:
                print("creating symlink from {0} to {1}".format(
                    install_path, config_path))
                os.symlink(config_path, install_path)
                return
            elif ans in ['n', 'N', 'no', 'No', 'NO']:
                print("skipping")
                return


def main():
    config_dict = scan_config_list()
    for config, path in config_dict.iteritems():
        create_link(config, path)

    print("script successful")

if __name__ == '__main__':
    sys.exit(main())
