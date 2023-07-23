#!/usr/bin/env python3

"""Script to check the doc paths in Pubs meta files."""

__author__ = ["Loïc Reynier <loic@loicreynier.fr>"]
__version__ = "0.1.0"

import os
import sys
import yaml


def check_docfiles(dir_path: str = "./meta") -> None:
    n_not_found: int = 0
    for file_name in sorted(os.listdir(dir_path)):
        file_path = dir_path + os.sep + file_name
        with open(file_path, "r", encoding="utf-8") as file:
            meta = yaml.load(file, Loader=yaml.CLoader)
            if (docfile := meta["docfile"]) is not None:
                if not os.path.isfile(docfile):
                    print(f"{file_name}: docfile {docfile} not found")
                    n_not_found += 1
    if n_not_found != 0:
        sys.exit(-1)


if __name__ == "__main__":
    os.chdir(os.path.dirname(sys.path[0]))
    # print(os.path.basename(__file__) + ": running in " + os.getcwd())
    check_docfiles()
