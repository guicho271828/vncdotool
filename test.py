#!/usr/bin/env python3

import argparse
import multiprocessing as mp
import datetime
from vncdotool import api
import numpy as np
import random
import time

def task(host,port,password):
    conn = api.connect(f"{host}::{port}", password)
    for _ in range(10):
        conn.mouseMove(random.randint(0,800),
                       random.randint(0,600))
        time.sleep(1)
        conn.mouseDown(1)
        time.sleep(1)
    conn.captureScreen(datetime.datetime.now().isoformat(timespec='milliseconds')+".png")
    screen = np.asarray(conn.screen)
    return screen

if __name__ == '__main__':

    parser = argparse.ArgumentParser()
    parser.add_argument("mode",
                        choices=["spawn","fork","forkserver"],
                        help="start method.")
    args = parser.parse_args()
    mp.set_start_method(args.mode)
    with mp.Pool(4) as p:
        results = p.starmap(
            task,
            [["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],])
