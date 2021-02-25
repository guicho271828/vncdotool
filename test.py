#!/usr/bin/env python3

import argparse
import multiprocessing as mp
from vncdotool import api

def task(host,port,password):
    conn = api.connect(f"{host}::{port}", password)
    conn.mouseMove(100,100)
    conn.mouseDown(1)
    conn.mouseMove(200,100)
    conn.mouseDown(1)
    conn.mouseMove(100,200)
    conn.mouseDown(1)
    conn.mouseMove(200,200)
    conn.mouseDown(1)
    conn.refreshScreen()
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
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],
             ["localhost","5901","password1"],
             ["localhost","5902","password1"],
             ["localhost","5903","password1"],
             ["localhost","5904","password1"],])
