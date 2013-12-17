import sys
pieces = [
    [1],
    [1,2],
    [1,2,3],
    [1,2,6],
    [1,2,6,7],
    [1,2,3,4],
    [1,2,3,4,5],
    [1,2,3,4,6],
    [1,2,3,6],
    [1,2,3,4,8],
    [1,2,3,6,7],
    [1,2,3,6,11],
    [1,2,3,6,8],
    [1,2,3,8,9],
    [1,2,7,8],
    [1,2,3,7,12],
    [1,2,7,12,13],
    [1,2,3,7],
    [2,6,7,8,12],
    [1,2,7,8,12],
    [1,2,7,8,13]
]

for piece in pieces:
    print "PIECE", piece
    for i in range(0, 5):
        for j in range(1, 6):
            if 5 * i + j in piece:
                sys.stdout.write("#")
            else:
                sys.stdout.write(" ")
        sys.stdout.write("\n")
    print "-----------"

print [sum(2**(i-1) for i in piece) for piece in pieces]
