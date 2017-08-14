#!/usr/bin/env python
# -*- coding: iso-8859-15 -*-

# Uses python3
# There are two ways of running this program:
# 1. Run
#     python3 APlusB.py
# then enter two numbers and press ctrl-d/ctrl-z
# 2. Save two numbers to a file -- say, dataset.txt.
# Then run
#     python3 APlusB.py < dataset.txt

from cmd import Cmd
from functools import reduce


class APlusB(Cmd):
    def do_aplusb(self, args):
        tokens = args.split()
        tokens = list(map(int, tokens))
        print(reduce((lambda a, b: a + b), tokens))

    def do_quit(self, args):
        print('Quiting!')
        raise SystemExit


if __name__ == "__main__":
    prompt = APlusB()
    prompt.prompt = 'APlusB >> '
    prompt.cmdloop('-------------------------')
