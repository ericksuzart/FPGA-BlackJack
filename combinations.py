#! /usr/bin/env python

# Made by: Erick


if __name__ == "__main__":
    RawConb = ["0 1 2 3 4 5",
                "0 1 2 3 4 6",
                "0 1 2 3 4 7",
                "0 1 2 3 4 8",
                "0 1 2 3 4 9",
                "0 1 2 3 4 10",
                "0 1 2 3 4 11",
                "0 1 2 3 5 6",
                "0 1 2 3 5 7",
                "0 1 2 3 5 8",
                "0 1 2 3 5 9",
                "0 1 2 3 5 10",
                "0 1 2 3 5 11",
                "0 1 2 3 6 7",
                "0 1 2 3 6 8",
                "0 1 2 3 6 9",
                "0 1 2 3 6 10",
                "0 1 2 3 6 11",
                "0 1 2 3 7 8",
                "0 1 2 3 7 9",
                "0 1 2 3 7 10",
                "0 1 2 3 7 11",
                "0 1 2 3 8 9",
                "0 1 2 3 8 10",
                "0 1 2 3 8 11",
                "0 1 2 3 9 10",
                "0 1 2 3 9 11",
                "0 1 2 3 10 11",
                "0 1 2 4 5 6",
                "0 1 2 4 5 7",
                "0 1 2 4 5 8",
                "0 1 2 4 5 9",
                "0 1 2 4 5 10",
                "0 1 2 4 5 11",
                "0 1 2 4 6 7",
                "0 1 2 4 6 8",
                "0 1 2 4 6 9",
                "0 1 2 4 6 10",
                "0 1 2 4 6 11",
                "0 1 2 4 7 8",
                "0 1 2 4 7 9",
                "0 1 2 4 7 10",
                "0 1 2 4 7 11",
                "0 1 2 4 8 9",
                "0 1 2 4 8 10",
                "0 1 2 4 8 11",
                "0 1 2 4 9 10",
                "0 1 2 4 9 11",
                "0 1 2 4 10 11",
                "0 1 2 5 6 7",
                "0 1 2 5 6 8",
                "0 1 2 5 6 9",
                "0 1 2 5 6 10",
                "0 1 2 5 6 11",
                "0 1 2 5 7 8",
                "0 1 2 5 7 9",
                "0 1 2 5 7 10",
                "0 1 2 5 7 11",
                "0 1 2 5 8 9",
                "0 1 2 5 8 10",
                "0 1 2 5 8 11",
                "0 1 2 5 9 10",
                "0 1 2 5 9 11",
                "0 1 2 5 10 11",
                "0 1 2 6 7 8",
                "0 1 2 6 7 9",
                "0 1 2 6 7 10",
                "0 1 2 6 7 11",
                "0 1 2 6 8 9",
                "0 1 2 6 8 10",
                "0 1 2 6 8 11",
                "0 1 2 6 9 10",
                "0 1 2 6 9 11",
                "0 1 2 6 10 11",
                "0 1 2 7 8 9",
                "0 1 2 7 8 10",
                "0 1 2 7 8 11",
                "0 1 2 7 9 10",
                "0 1 2 7 9 11",
                "0 1 2 7 10 11",
                "0 1 2 8 9 10",
                "0 1 2 8 9 11",
                "0 1 2 8 10 11",
                "0 1 2 9 10 11",
                "0 1 3 4 5 6",
                "0 1 3 4 5 7",
                "0 1 3 4 5 8",
                "0 1 3 4 5 9",
                "0 1 3 4 5 10",
                "0 1 3 4 5 11",
                "0 1 3 4 6 7",
                "0 1 3 4 6 8",
                "0 1 3 4 6 9",
                "0 1 3 4 6 10",
                "0 1 3 4 6 11",
                "0 1 3 4 7 8",
                "0 1 3 4 7 9",
                "0 1 3 4 7 10",
                "0 1 3 4 7 11",
                "0 1 3 4 8 9",
                "0 1 3 4 8 10",
                "0 1 3 4 8 11",
                "0 1 3 4 9 10",
                "0 1 3 4 9 11",
                "0 1 3 4 10 11",
                "0 1 3 5 6 7",
                "0 1 3 5 6 8",
                "0 1 3 5 6 9",
                "0 1 3 5 6 10",
                "0 1 3 5 6 11",
                "0 1 3 5 7 8",
                "0 1 3 5 7 9",
                "0 1 3 5 7 10",
                "0 1 3 5 7 11",
                "0 1 3 5 8 9",
                "0 1 3 5 8 10",
                "0 1 3 5 8 11",
                "0 1 3 5 9 10",
                "0 1 3 5 9 11",
                "0 1 3 5 10 11",
                "0 1 3 6 7 8",
                "0 1 3 6 7 9",
                "0 1 3 6 7 10",
                "0 1 3 6 7 11",
                "0 1 3 6 8 9",
                "0 1 3 6 8 10",
                "0 1 3 6 8 11",
                "0 1 3 6 9 10",
                "0 1 3 6 9 11",
                "0 1 3 6 10 11",
                "0 1 3 7 8 9",
                "0 1 3 7 8 10",
                "0 1 3 7 8 11",
                "0 1 3 7 9 10",
                "0 1 3 7 9 11",
                "0 1 3 7 10 11",
                "0 1 3 8 9 10",
                "0 1 3 8 9 11",
                "0 1 3 8 10 11",
                "0 1 3 9 10 11",
                "0 1 4 5 6 7",
                "0 1 4 5 6 8",
                "0 1 4 5 6 9",
                "0 1 4 5 6 10",
                "0 1 4 5 6 11",
                "0 1 4 5 7 8",
                "0 1 4 5 7 9",
                "0 1 4 5 7 10",
                "0 1 4 5 7 11",
                "0 1 4 5 8 9",
                "0 1 4 5 8 10",
                "0 1 4 5 8 11",
                "0 1 4 5 9 10",
                "0 1 4 5 9 11",
                "0 1 4 5 10 11",
                "0 1 4 6 7 8",
                "0 1 4 6 7 9",
                "0 1 4 6 7 10",
                "0 1 4 6 7 11",
                "0 1 4 6 8 9",
                "0 1 4 6 8 10",
                "0 1 4 6 8 11",
                "0 1 4 6 9 10",
                "0 1 4 6 9 11",
                "0 1 4 6 10 11",
                "0 1 4 7 8 9",
                "0 1 4 7 8 10",
                "0 1 4 7 8 11",
                "0 1 4 7 9 10",
                "0 1 4 7 9 11",
                "0 1 4 7 10 11",
                "0 1 4 8 9 10",
                "0 1 4 8 9 11",
                "0 1 4 8 10 11",
                "0 1 4 9 10 11",
                "0 1 5 6 7 8",
                "0 1 5 6 7 9",
                "0 1 5 6 7 10",
                "0 1 5 6 7 11",
                "0 1 5 6 8 9",
                "0 1 5 6 8 10",
                "0 1 5 6 8 11",
                "0 1 5 6 9 10",
                "0 1 5 6 9 11",
                "0 1 5 6 10 11",
                "0 1 5 7 8 9",
                "0 1 5 7 8 10",
                "0 1 5 7 8 11",
                "0 1 5 7 9 10",
                "0 1 5 7 9 11",
                "0 1 5 7 10 11",
                "0 1 5 8 9 10",
                "0 1 5 8 9 11",
                "0 1 5 8 10 11",
                "0 1 5 9 10 11",
                "0 1 6 7 8 9",
                "0 1 6 7 8 10",
                "0 1 6 7 8 11",
                "0 1 6 7 9 10",
                "0 1 6 7 9 11",
                "0 1 6 7 10 11",
                "0 1 6 8 9 10",
                "0 1 6 8 9 11",
                "0 1 6 8 10 11",
                "0 1 6 9 10 11",
                "0 1 7 8 9 10",
                "0 1 7 8 9 11",
                "0 1 7 8 10 11",
                "0 1 7 9 10 11",
                "0 1 8 9 10 11",
                "0 2 3 4 5 6",
                "0 2 3 4 5 7",
                "0 2 3 4 5 8",
                "0 2 3 4 5 9",
                "0 2 3 4 5 10",
                "0 2 3 4 5 11",
                "0 2 3 4 6 7",
                "0 2 3 4 6 8",
                "0 2 3 4 6 9",
                "0 2 3 4 6 10",
                "0 2 3 4 6 11",
                "0 2 3 4 7 8",
                "0 2 3 4 7 9",
                "0 2 3 4 7 10",
                "0 2 3 4 7 11",
                "0 2 3 4 8 9",
                "0 2 3 4 8 10",
                "0 2 3 4 8 11",
                "0 2 3 4 9 10",
                "0 2 3 4 9 11",
                "0 2 3 4 10 11",
                "0 2 3 5 6 7",
                "0 2 3 5 6 8",
                "0 2 3 5 6 9",
                "0 2 3 5 6 10",
                "0 2 3 5 6 11",
                "0 2 3 5 7 8",
                "0 2 3 5 7 9",
                "0 2 3 5 7 10",
                "0 2 3 5 7 11",
                "0 2 3 5 8 9",
                "0 2 3 5 8 10",
                "0 2 3 5 8 11",
                "0 2 3 5 9 10",
                "0 2 3 5 9 11",
                "0 2 3 5 10 11",
                "0 2 3 6 7 8",
                "0 2 3 6 7 9",
                "0 2 3 6 7 10",
                "0 2 3 6 7 11",
                "0 2 3 6 8 9",
                "0 2 3 6 8 10",
                "0 2 3 6 8 11",
                "0 2 3 6 9 10",
                "0 2 3 6 9 11",
                "0 2 3 6 10 11",
                "0 2 3 7 8 9",
                "0 2 3 7 8 10",
                "0 2 3 7 8 11",
                "0 2 3 7 9 10",
                "0 2 3 7 9 11",
                "0 2 3 7 10 11",
                "0 2 3 8 9 10",
                "0 2 3 8 9 11",
                "0 2 3 8 10 11",
                "0 2 3 9 10 11",
                "0 2 4 5 6 7",
                "0 2 4 5 6 8",
                "0 2 4 5 6 9",
                "0 2 4 5 6 10",
                "0 2 4 5 6 11",
                "0 2 4 5 7 8",
                "0 2 4 5 7 9",
                "0 2 4 5 7 10",
                "0 2 4 5 7 11",
                "0 2 4 5 8 9",
                "0 2 4 5 8 10",
                "0 2 4 5 8 11",
                "0 2 4 5 9 10",
                "0 2 4 5 9 11",
                "0 2 4 5 10 11",
                "0 2 4 6 7 8",
                "0 2 4 6 7 9",
                "0 2 4 6 7 10",
                "0 2 4 6 7 11",
                "0 2 4 6 8 9",
                "0 2 4 6 8 10",
                "0 2 4 6 8 11",
                "0 2 4 6 9 10",
                "0 2 4 6 9 11",
                "0 2 4 6 10 11",
                "0 2 4 7 8 9",
                "0 2 4 7 8 10",
                "0 2 4 7 8 11",
                "0 2 4 7 9 10",
                "0 2 4 7 9 11",
                "0 2 4 7 10 11",
                "0 2 4 8 9 10",
                "0 2 4 8 9 11",
                "0 2 4 8 10 11",
                "0 2 4 9 10 11",
                "0 2 5 6 7 8",
                "0 2 5 6 7 9",
                "0 2 5 6 7 10",
                "0 2 5 6 7 11",
                "0 2 5 6 8 9",
                "0 2 5 6 8 10",
                "0 2 5 6 8 11",
                "0 2 5 6 9 10",
                "0 2 5 6 9 11",
                "0 2 5 6 10 11",
                "0 2 5 7 8 9",
                "0 2 5 7 8 10",
                "0 2 5 7 8 11",
                "0 2 5 7 9 10",
                "0 2 5 7 9 11",
                "0 2 5 7 10 11",
                "0 2 5 8 9 10",
                "0 2 5 8 9 11",
                "0 2 5 8 10 11",
                "0 2 5 9 10 11",
                "0 2 6 7 8 9",
                "0 2 6 7 8 10",
                "0 2 6 7 8 11",
                "0 2 6 7 9 10",
                "0 2 6 7 9 11",
                "0 2 6 7 10 11",
                "0 2 6 8 9 10",
                "0 2 6 8 9 11",
                "0 2 6 8 10 11",
                "0 2 6 9 10 11",
                "0 2 7 8 9 10",
                "0 2 7 8 9 11",
                "0 2 7 8 10 11",
                "0 2 7 9 10 11",
                "0 2 8 9 10 11",
                "0 3 4 5 6 7",
                "0 3 4 5 6 8",
                "0 3 4 5 6 9",
                "0 3 4 5 6 10",
                "0 3 4 5 6 11",
                "0 3 4 5 7 8",
                "0 3 4 5 7 9",
                "0 3 4 5 7 10",
                "0 3 4 5 7 11",
                "0 3 4 5 8 9",
                "0 3 4 5 8 10",
                "0 3 4 5 8 11",
                "0 3 4 5 9 10",
                "0 3 4 5 9 11",
                "0 3 4 5 10 11",
                "0 3 4 6 7 8",
                "0 3 4 6 7 9",
                "0 3 4 6 7 10",
                "0 3 4 6 7 11",
                "0 3 4 6 8 9",
                "0 3 4 6 8 10",
                "0 3 4 6 8 11",
                "0 3 4 6 9 10",
                "0 3 4 6 9 11",
                "0 3 4 6 10 11",
                "0 3 4 7 8 9",
                "0 3 4 7 8 10",
                "0 3 4 7 8 11",
                "0 3 4 7 9 10",
                "0 3 4 7 9 11",
                "0 3 4 7 10 11",
                "0 3 4 8 9 10",
                "0 3 4 8 9 11",
                "0 3 4 8 10 11",
                "0 3 4 9 10 11",
                "0 3 5 6 7 8",
                "0 3 5 6 7 9",
                "0 3 5 6 7 10",
                "0 3 5 6 7 11",
                "0 3 5 6 8 9",
                "0 3 5 6 8 10",
                "0 3 5 6 8 11",
                "0 3 5 6 9 10",
                "0 3 5 6 9 11",
                "0 3 5 6 10 11",
                "0 3 5 7 8 9",
                "0 3 5 7 8 10",
                "0 3 5 7 8 11",
                "0 3 5 7 9 10",
                "0 3 5 7 9 11",
                "0 3 5 7 10 11",
                "0 3 5 8 9 10",
                "0 3 5 8 9 11",
                "0 3 5 8 10 11",
                "0 3 5 9 10 11",
                "0 3 6 7 8 9",
                "0 3 6 7 8 10",
                "0 3 6 7 8 11",
                "0 3 6 7 9 10",
                "0 3 6 7 9 11",
                "0 3 6 7 10 11",
                "0 3 6 8 9 10",
                "0 3 6 8 9 11",
                "0 3 6 8 10 11",
                "0 3 6 9 10 11",
                "0 3 7 8 9 10",
                "0 3 7 8 9 11",
                "0 3 7 8 10 11",
                "0 3 7 9 10 11",
                "0 3 8 9 10 11",
                "0 4 5 6 7 8",
                "0 4 5 6 7 9",
                "0 4 5 6 7 10",
                "0 4 5 6 7 11",
                "0 4 5 6 8 9",
                "0 4 5 6 8 10",
                "0 4 5 6 8 11",
                "0 4 5 6 9 10",
                "0 4 5 6 9 11",
                "0 4 5 6 10 11",
                "0 4 5 7 8 9",
                "0 4 5 7 8 10",
                "0 4 5 7 8 11",
                "0 4 5 7 9 10",
                "0 4 5 7 9 11",
                "0 4 5 7 10 11",
                "0 4 5 8 9 10",
                "0 4 5 8 9 11",
                "0 4 5 8 10 11",
                "0 4 5 9 10 11",
                "0 4 6 7 8 9",
                "0 4 6 7 8 10",
                "0 4 6 7 8 11",
                "0 4 6 7 9 10",
                "0 4 6 7 9 11",
                "0 4 6 7 10 11",
                "0 4 6 8 9 10",
                "0 4 6 8 9 11",
                "0 4 6 8 10 11",
                "0 4 6 9 10 11",
                "0 4 7 8 9 10",
                "0 4 7 8 9 11",
                "0 4 7 8 10 11",
                "0 4 7 9 10 11",
                "0 4 8 9 10 11",
                "0 5 6 7 8 9",
                "0 5 6 7 8 10",
                "0 5 6 7 8 11",
                "0 5 6 7 9 10",
                "0 5 6 7 9 11",
                "0 5 6 7 10 11",
                "0 5 6 8 9 10",
                "0 5 6 8 9 11",
                "0 5 6 8 10 11",
                "0 5 6 9 10 11",
                "0 5 7 8 9 10",
                "0 5 7 8 9 11",
                "0 5 7 8 10 11",
                "0 5 7 9 10 11",
                "0 5 8 9 10 11",
                "0 6 7 8 9 10",
                "0 6 7 8 9 11",
                "0 6 7 8 10 11",
                "0 6 7 9 10 11",
                "0 6 8 9 10 11",
                "0 7 8 9 10 11",
                "1 2 3 4 5 6",
                "1 2 3 4 5 7",
                "1 2 3 4 5 8",
                "1 2 3 4 5 9",
                "1 2 3 4 5 10",
                "1 2 3 4 5 11",
                "1 2 3 4 6 7",
                "1 2 3 4 6 8",
                "1 2 3 4 6 9",
                "1 2 3 4 6 10",
                "1 2 3 4 6 11",
                "1 2 3 4 7 8",
                "1 2 3 4 7 9",
                "1 2 3 4 7 10",
                "1 2 3 4 7 11",
                "1 2 3 4 8 9",
                "1 2 3 4 8 10",
                "1 2 3 4 8 11",
                "1 2 3 4 9 10",
                "1 2 3 4 9 11",
                "1 2 3 4 10 11",
                "1 2 3 5 6 7",
                "1 2 3 5 6 8",
                "1 2 3 5 6 9",
                "1 2 3 5 6 10",
                "1 2 3 5 6 11",
                "1 2 3 5 7 8",
                "1 2 3 5 7 9",
                "1 2 3 5 7 10",
                "1 2 3 5 7 11",
                "1 2 3 5 8 9",
                "1 2 3 5 8 10",
                "1 2 3 5 8 11",
                "1 2 3 5 9 10",
                "1 2 3 5 9 11",
                "1 2 3 5 10 11",
                "1 2 3 6 7 8",
                "1 2 3 6 7 9",
                "1 2 3 6 7 10",
                "1 2 3 6 7 11",
                "1 2 3 6 8 9",
                "1 2 3 6 8 10",
                "1 2 3 6 8 11",
                "1 2 3 6 9 10",
                "1 2 3 6 9 11",
                "1 2 3 6 10 11",
                "1 2 3 7 8 9",
                "1 2 3 7 8 10",
                "1 2 3 7 8 11",
                "1 2 3 7 9 10",
                "1 2 3 7 9 11",
                "1 2 3 7 10 11",
                "1 2 3 8 9 10",
                "1 2 3 8 9 11",
                "1 2 3 8 10 11",
                "1 2 3 9 10 11",
                "1 2 4 5 6 7",
                "1 2 4 5 6 8",
                "1 2 4 5 6 9",
                "1 2 4 5 6 10",
                "1 2 4 5 6 11",
                "1 2 4 5 7 8",
                "1 2 4 5 7 9",
                "1 2 4 5 7 10",
                "1 2 4 5 7 11",
                "1 2 4 5 8 9",
                "1 2 4 5 8 10",
                "1 2 4 5 8 11",
                "1 2 4 5 9 10",
                "1 2 4 5 9 11",
                "1 2 4 5 10 11",
                "1 2 4 6 7 8",
                "1 2 4 6 7 9",
                "1 2 4 6 7 10",
                "1 2 4 6 7 11",
                "1 2 4 6 8 9",
                "1 2 4 6 8 10",
                "1 2 4 6 8 11",
                "1 2 4 6 9 10",
                "1 2 4 6 9 11",
                "1 2 4 6 10 11",
                "1 2 4 7 8 9",
                "1 2 4 7 8 10",
                "1 2 4 7 8 11",
                "1 2 4 7 9 10",
                "1 2 4 7 9 11",
                "1 2 4 7 10 11",
                "1 2 4 8 9 10",
                "1 2 4 8 9 11",
                "1 2 4 8 10 11",
                "1 2 4 9 10 11",
                "1 2 5 6 7 8",
                "1 2 5 6 7 9",
                "1 2 5 6 7 10",
                "1 2 5 6 7 11",
                "1 2 5 6 8 9",
                "1 2 5 6 8 10",
                "1 2 5 6 8 11",
                "1 2 5 6 9 10",
                "1 2 5 6 9 11",
                "1 2 5 6 10 11",
                "1 2 5 7 8 9",
                "1 2 5 7 8 10",
                "1 2 5 7 8 11",
                "1 2 5 7 9 10",
                "1 2 5 7 9 11",
                "1 2 5 7 10 11",
                "1 2 5 8 9 10",
                "1 2 5 8 9 11",
                "1 2 5 8 10 11",
                "1 2 5 9 10 11",
                "1 2 6 7 8 9",
                "1 2 6 7 8 10",
                "1 2 6 7 8 11",
                "1 2 6 7 9 10",
                "1 2 6 7 9 11",
                "1 2 6 7 10 11",
                "1 2 6 8 9 10",
                "1 2 6 8 9 11",
                "1 2 6 8 10 11",
                "1 2 6 9 10 11",
                "1 2 7 8 9 10",
                "1 2 7 8 9 11",
                "1 2 7 8 10 11",
                "1 2 7 9 10 11",
                "1 2 8 9 10 11",
                "1 3 4 5 6 7",
                "1 3 4 5 6 8",
                "1 3 4 5 6 9",
                "1 3 4 5 6 10",
                "1 3 4 5 6 11",
                "1 3 4 5 7 8",
                "1 3 4 5 7 9",
                "1 3 4 5 7 10",
                "1 3 4 5 7 11",
                "1 3 4 5 8 9",
                "1 3 4 5 8 10",
                "1 3 4 5 8 11",
                "1 3 4 5 9 10",
                "1 3 4 5 9 11",
                "1 3 4 5 10 11",
                "1 3 4 6 7 8",
                "1 3 4 6 7 9",
                "1 3 4 6 7 10",
                "1 3 4 6 7 11",
                "1 3 4 6 8 9",
                "1 3 4 6 8 10",
                "1 3 4 6 8 11",
                "1 3 4 6 9 10",
                "1 3 4 6 9 11",
                "1 3 4 6 10 11",
                "1 3 4 7 8 9",
                "1 3 4 7 8 10",
                "1 3 4 7 8 11",
                "1 3 4 7 9 10",
                "1 3 4 7 9 11",
                "1 3 4 7 10 11",
                "1 3 4 8 9 10",
                "1 3 4 8 9 11",
                "1 3 4 8 10 11",
                "1 3 4 9 10 11",
                "1 3 5 6 7 8",
                "1 3 5 6 7 9",
                "1 3 5 6 7 10",
                "1 3 5 6 7 11",
                "1 3 5 6 8 9",
                "1 3 5 6 8 10",
                "1 3 5 6 8 11",
                "1 3 5 6 9 10",
                "1 3 5 6 9 11",
                "1 3 5 6 10 11",
                "1 3 5 7 8 9",
                "1 3 5 7 8 10",
                "1 3 5 7 8 11",
                "1 3 5 7 9 10",
                "1 3 5 7 9 11",
                "1 3 5 7 10 11",
                "1 3 5 8 9 10",
                "1 3 5 8 9 11",
                "1 3 5 8 10 11",
                "1 3 5 9 10 11",
                "1 3 6 7 8 9",
                "1 3 6 7 8 10",
                "1 3 6 7 8 11",
                "1 3 6 7 9 10",
                "1 3 6 7 9 11",
                "1 3 6 7 10 11",
                "1 3 6 8 9 10",
                "1 3 6 8 9 11",
                "1 3 6 8 10 11",
                "1 3 6 9 10 11",
                "1 3 7 8 9 10",
                "1 3 7 8 9 11",
                "1 3 7 8 10 11",
                "1 3 7 9 10 11",
                "1 3 8 9 10 11",
                "1 4 5 6 7 8",
                "1 4 5 6 7 9",
                "1 4 5 6 7 10",
                "1 4 5 6 7 11",
                "1 4 5 6 8 9",
                "1 4 5 6 8 10",
                "1 4 5 6 8 11",
                "1 4 5 6 9 10",
                "1 4 5 6 9 11",
                "1 4 5 6 10 11",
                "1 4 5 7 8 9",
                "1 4 5 7 8 10",
                "1 4 5 7 8 11",
                "1 4 5 7 9 10",
                "1 4 5 7 9 11",
                "1 4 5 7 10 11",
                "1 4 5 8 9 10",
                "1 4 5 8 9 11",
                "1 4 5 8 10 11",
                "1 4 5 9 10 11",
                "1 4 6 7 8 9",
                "1 4 6 7 8 10",
                "1 4 6 7 8 11",
                "1 4 6 7 9 10",
                "1 4 6 7 9 11",
                "1 4 6 7 10 11",
                "1 4 6 8 9 10",
                "1 4 6 8 9 11",
                "1 4 6 8 10 11",
                "1 4 6 9 10 11",
                "1 4 7 8 9 10",
                "1 4 7 8 9 11",
                "1 4 7 8 10 11",
                "1 4 7 9 10 11",
                "1 4 8 9 10 11",
                "1 5 6 7 8 9",
                "1 5 6 7 8 10",
                "1 5 6 7 8 11",
                "1 5 6 7 9 10",
                "1 5 6 7 9 11",
                "1 5 6 7 10 11",
                "1 5 6 8 9 10",
                "1 5 6 8 9 11",
                "1 5 6 8 10 11",
                "1 5 6 9 10 11",
                "1 5 7 8 9 10",
                "1 5 7 8 9 11",
                "1 5 7 8 10 11",
                "1 5 7 9 10 11",
                "1 5 8 9 10 11",
                "1 6 7 8 9 10",
                "1 6 7 8 9 11",
                "1 6 7 8 10 11",
                "1 6 7 9 10 11",
                "1 6 8 9 10 11",
                "1 7 8 9 10 11",
                "2 3 4 5 6 7",
                "2 3 4 5 6 8",
                "2 3 4 5 6 9",
                "2 3 4 5 6 10",
                "2 3 4 5 6 11",
                "2 3 4 5 7 8",
                "2 3 4 5 7 9",
                "2 3 4 5 7 10",
                "2 3 4 5 7 11",
                "2 3 4 5 8 9",
                "2 3 4 5 8 10",
                "2 3 4 5 8 11",
                "2 3 4 5 9 10",
                "2 3 4 5 9 11",
                "2 3 4 5 10 11",
                "2 3 4 6 7 8",
                "2 3 4 6 7 9",
                "2 3 4 6 7 10",
                "2 3 4 6 7 11",
                "2 3 4 6 8 9",
                "2 3 4 6 8 10",
                "2 3 4 6 8 11",
                "2 3 4 6 9 10",
                "2 3 4 6 9 11",
                "2 3 4 6 10 11",
                "2 3 4 7 8 9",
                "2 3 4 7 8 10",
                "2 3 4 7 8 11",
                "2 3 4 7 9 10",
                "2 3 4 7 9 11",
                "2 3 4 7 10 11",
                "2 3 4 8 9 10",
                "2 3 4 8 9 11",
                "2 3 4 8 10 11",
                "2 3 4 9 10 11",
                "2 3 5 6 7 8",
                "2 3 5 6 7 9",
                "2 3 5 6 7 10",
                "2 3 5 6 7 11",
                "2 3 5 6 8 9",
                "2 3 5 6 8 10",
                "2 3 5 6 8 11",
                "2 3 5 6 9 10",
                "2 3 5 6 9 11",
                "2 3 5 6 10 11",
                "2 3 5 7 8 9",
                "2 3 5 7 8 10",
                "2 3 5 7 8 11",
                "2 3 5 7 9 10",
                "2 3 5 7 9 11",
                "2 3 5 7 10 11",
                "2 3 5 8 9 10",
                "2 3 5 8 9 11",
                "2 3 5 8 10 11",
                "2 3 5 9 10 11",
                "2 3 6 7 8 9",
                "2 3 6 7 8 10",
                "2 3 6 7 8 11",
                "2 3 6 7 9 10",
                "2 3 6 7 9 11",
                "2 3 6 7 10 11",
                "2 3 6 8 9 10",
                "2 3 6 8 9 11",
                "2 3 6 8 10 11",
                "2 3 6 9 10 11",
                "2 3 7 8 9 10",
                "2 3 7 8 9 11",
                "2 3 7 8 10 11",
                "2 3 7 9 10 11",
                "2 3 8 9 10 11",
                "2 4 5 6 7 8",
                "2 4 5 6 7 9",
                "2 4 5 6 7 10",
                "2 4 5 6 7 11",
                "2 4 5 6 8 9",
                "2 4 5 6 8 10",
                "2 4 5 6 8 11",
                "2 4 5 6 9 10",
                "2 4 5 6 9 11",
                "2 4 5 6 10 11",
                "2 4 5 7 8 9",
                "2 4 5 7 8 10",
                "2 4 5 7 8 11",
                "2 4 5 7 9 10",
                "2 4 5 7 9 11",
                "2 4 5 7 10 11",
                "2 4 5 8 9 10",
                "2 4 5 8 9 11",
                "2 4 5 8 10 11",
                "2 4 5 9 10 11",
                "2 4 6 7 8 9",
                "2 4 6 7 8 10",
                "2 4 6 7 8 11",
                "2 4 6 7 9 10",
                "2 4 6 7 9 11",
                "2 4 6 7 10 11",
                "2 4 6 8 9 10",
                "2 4 6 8 9 11",
                "2 4 6 8 10 11",
                "2 4 6 9 10 11",
                "2 4 7 8 9 10",
                "2 4 7 8 9 11",
                "2 4 7 8 10 11",
                "2 4 7 9 10 11",
                "2 4 8 9 10 11",
                "2 5 6 7 8 9",
                "2 5 6 7 8 10",
                "2 5 6 7 8 11",
                "2 5 6 7 9 10",
                "2 5 6 7 9 11",
                "2 5 6 7 10 11",
                "2 5 6 8 9 10",
                "2 5 6 8 9 11",
                "2 5 6 8 10 11",
                "2 5 6 9 10 11",
                "2 5 7 8 9 10",
                "2 5 7 8 9 11",
                "2 5 7 8 10 11",
                "2 5 7 9 10 11",
                "2 5 8 9 10 11",
                "2 6 7 8 9 10",
                "2 6 7 8 9 11",
                "2 6 7 8 10 11",
                "2 6 7 9 10 11",
                "2 6 8 9 10 11",
                "2 7 8 9 10 11",
                "3 4 5 6 7 8",
                "3 4 5 6 7 9",
                "3 4 5 6 7 10",
                "3 4 5 6 7 11",
                "3 4 5 6 8 9",
                "3 4 5 6 8 10",
                "3 4 5 6 8 11",
                "3 4 5 6 9 10",
                "3 4 5 6 9 11",
                "3 4 5 6 10 11",
                "3 4 5 7 8 9",
                "3 4 5 7 8 10",
                "3 4 5 7 8 11",
                "3 4 5 7 9 10",
                "3 4 5 7 9 11",
                "3 4 5 7 10 11",
                "3 4 5 8 9 10",
                "3 4 5 8 9 11",
                "3 4 5 8 10 11",
                "3 4 5 9 10 11",
                "3 4 6 7 8 9",
                "3 4 6 7 8 10",
                "3 4 6 7 8 11",
                "3 4 6 7 9 10",
                "3 4 6 7 9 11",
                "3 4 6 7 10 11",
                "3 4 6 8 9 10",
                "3 4 6 8 9 11",
                "3 4 6 8 10 11",
                "3 4 6 9 10 11",
                "3 4 7 8 9 10",
                "3 4 7 8 9 11",
                "3 4 7 8 10 11",
                "3 4 7 9 10 11",
                "3 4 8 9 10 11",
                "3 5 6 7 8 9",
                "3 5 6 7 8 10",
                "3 5 6 7 8 11",
                "3 5 6 7 9 10",
                "3 5 6 7 9 11",
                "3 5 6 7 10 11",
                "3 5 6 8 9 10",
                "3 5 6 8 9 11",
                "3 5 6 8 10 11",
                "3 5 6 9 10 11",
                "3 5 7 8 9 10",
                "3 5 7 8 9 11",
                "3 5 7 8 10 11",
                "3 5 7 9 10 11",
                "3 5 8 9 10 11",
                "3 6 7 8 9 10",
                "3 6 7 8 9 11",
                "3 6 7 8 10 11",
                "3 6 7 9 10 11",
                "3 6 8 9 10 11",
                "3 7 8 9 10 11",
                "4 5 6 7 8 9",
                "4 5 6 7 8 10",
                "4 5 6 7 8 11",
                "4 5 6 7 9 10",
                "4 5 6 7 9 11",
                "4 5 6 7 10 11",
                "4 5 6 8 9 10",
                "4 5 6 8 9 11",
                "4 5 6 8 10 11",
                "4 5 6 9 10 11",
                "4 5 7 8 9 10",
                "4 5 7 8 9 11",
                "4 5 7 8 10 11",
                "4 5 7 9 10 11",
                "4 5 8 9 10 11",
                "4 6 7 8 9 10",
                "4 6 7 8 9 11",
                "4 6 7 8 10 11",
                "4 6 7 9 10 11",
                "4 6 8 9 10 11",
                "4 7 8 9 10 11",
                "5 6 7 8 9 10",
                "5 6 7 8 9 11",
                "5 6 7 8 10 11",
                "5 6 7 9 10 11",
                "5 6 8 9 10 11",
                "5 7 8 9 10 11",
                "6 7 8 9 10 11"]
    
    nc = [] # Combinações na forma de lista envés de string

    for com in RawConb:
        nc.append(com.split())
    
    cf = [] # combinações finais
    cf.append(nc[0])

    '''
        Comparo a posição inicial da minha lista com as demais posições do vetor
        que contém todas as combinações possíveis. Se elas forem distintas em
        pelo menos 2 bits eu adiciono esse valor a minha lista de combinações
        finais.
    '''
    i = 0
    while i < 51:
        j = 0

        while j <= len(nc) - 1:
            soma = 0

            if cf[i][0] == nc[j][0] or cf[i][0] == nc[j][1] or cf[i][0] == nc[j][2] or cf[i][0] == nc[j][3] or cf[i][0] == nc[j][4] or cf[i][0] == nc[j][5]:
                soma += 1
            if cf[i][1] == nc[j][0] or cf[i][1] == nc[j][1] or cf[i][1] == nc[j][2] or cf[i][1] == nc[j][3] or cf[i][1] == nc[j][4] or cf[i][1] == nc[j][5]:
                soma += 1
            if nc[2][0] == nc[j][0] or nc[2][0] == nc[j][1] or nc[2][0] == nc[j][2] or nc[2][0] == nc[j][3] or nc[2][0] == nc[j][4] or nc[2][0] == nc[j][5]:
                soma += 1
            if cf[i][3] == nc[j][0] or cf[i][3] == nc[j][1] or cf[i][3] == nc[j][2] or cf[i][3] == nc[j][3] or cf[i][3] == nc[j][4] or cf[i][3] == nc[j][5]:
                soma += 1
            if cf[i][4] == nc[j][0] or cf[i][4] == nc[j][1] or cf[i][4] == nc[j][2] or cf[i][4] == nc[j][3] or cf[i][4] == nc[j][4] or cf[i][4] == nc[j][5]:
                soma += 1
            if cf[i][5] == nc[j][0] or cf[i][5] == nc[j][1] or cf[i][5] == nc[j][2] or cf[i][5] == nc[j][3] or cf[i][5] == nc[j][4] or cf[i][5] == nc[j][5]:
                soma += 1
            if (soma <= 1):
                cf.append(nc[j])
                nc.remove(nc[j])
                print("MSG: Posição nº = %d adicionada a combinação nº = %d"%(i + 1, j))
                break
            j += 1
        
        i += 1

    '''
        Retorno o valor da lista para o terminal
    '''
    print("Tamanho da lista resultante = %d"%(len(cf)))
    print("Valores da lista final:")
    for combination in cf:
        print(*combination, sep=" ")