from latextool_basic import *
p = Plot()
M = 1; N = 21
m00 = [['Question']]
m10 = [[i] for i in range(M, N)]
m01 = [['Points'],
]
m11 =[[''] for i in range(M, N)]

M = [[m00, m01], [m10, m11]]
N = table3(p, M, 0, 0, width=3, height=0.8)

M = 21; N = 41
m00 = [['Question']]
m10 = [[i] for i in range(M, N)]
m01 = [['Points'],
]
m11 =[[''] for i in range(M, N)]

M = [[m00, m01], [m10, m11]]
N = table3(p, M, 8, 0, width=3, height=0.8)

M = 1; N = 2
m00 = [['TOTAL']]
m10 = [[''] for i in range(M, N)]
m01 = [[''],]
m11 =[[''] for i in range(M, N)]

M = [[m00, m01], [m10, m11]]
N = table3(p, M, 8, -17.5, width=3, height=0.8)

print(p)
