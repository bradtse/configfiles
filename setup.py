#!/usr/bin/env python

# Author: Bradley Tse
# Email: bradleytse@gmail.com
#
# A simple script to set up important config files
#
# To add more configs to keep track of, just add the file to the config folder
# and then add an entry to the configlist file

import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.realpath(__file__))
CONFIG_FILE = os.path.join(SCRIPT_DIR, "configlist.txt")

# Scans the configlist.txt file and returns a dictionary of the config name
# and install location
def scan_config_list():
    print("parsing configlist.txt")
    config_dict = {}
    with open(CONFIG_FILE, 'r') as file:
        for linenum, line in enumerate(file):
            line = line.strip().rstrip('\n')

            # Ignore comments
            if line[0] == "#":
                continue

            split = line.split(':')

            # TODO Add more error checking
            if len(split) > 2:
                sys.exit("Incorrect entry at line {0}".format(linenum + 1))

            config_dict[split[0]] = split[1]

    return config_dict


# Create the symbolic links
# config: file name in the configfiles folder
# path: path of symbolic link
def create_link(config, path):
    config_path = os.path.join(SCRIPT_DIR, config)
    install_path = os.path.expanduser(path)
    if os.path.exists(install_path):
        while(True):
            ans = raw_input("overwrite {0}? (y/n) ".format(install_path))
            if ans == "y" or ans == "Y":
                print("creating symlink from {0} to {1}".format(
                      install_path, config_path))
                os.remove(install_path)
                os.symlink(config_path, install_path)
                break
            elif ans == "n" or ans == "N":
                print("skipping")
                return
    else:
        while(True):
            ans = raw_input("create symlink for {0}? (y/n) ".format(
                            install_path))
            if ans == "y" or ans == "Y":
                break
            elif ans == "n" or ans == "N":
                print("skipping")
                return
        print("creating symlink from {0} to {1}".format(
              install_path, config_path))
        os.symlink(config_path, install_path)
        return

def main():

    config_dict = scan_config_list()
    for config, path in config_dict.iteritems():
        create_link(config, path)

    print("script succesful")

if __name__ == '__main__':
    sys.exit(main())
