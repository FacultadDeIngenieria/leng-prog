# Instructions

A circular buffer, cyclic buffer or ring buffer is a data structure that
uses a single, fixed-size buffer as if it were connected end-to-end.

A circular buffer first starts empty and of some predefined length. For
example, this is a 7-element buffer:
<!-- prettier-ignore -->
    [ ][ ][ ][ ][ ][ ][ ]

Assume that a 1 is written into the middle of the buffer (exact starting
location does not matter in a circular buffer):
<!-- prettier-ignore -->
    [ ][ ][ ][1][ ][ ][ ]

Then assume that two more elements are added — 2 & 3 — which get
appended after the 1:
<!-- prettier-ignore -->
    [ ][ ][ ][1][2][3][ ]

If two elements are then removed from the buffer, the oldest values
inside the buffer are removed. The two elements removed, in this case,
are 1 & 2, leaving the buffer with just a 3:
<!-- prettier-ignore -->
    [ ][ ][ ][ ][ ][3][ ]

If the buffer has 7 elements then it is completely full:
<!-- prettier-ignore -->
    [5][6][7][8][9][3][4]

When the buffer is full an error will be raised, alerting the client
that further writes are blocked until a slot becomes free.

Finally, if two elements are removed then what would be
returned is 5 & 6 yielding the buffer:
<!-- prettier-ignore -->
    [ ][ ][7][8][9][3][4]


## Hint

To increment an index `n` and wrap-around once you reach `len` you can do:

`n = (n + 1) % len`

To decrement `x` position wrapping around you can do:

`(len + n - x) % len `
