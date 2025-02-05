// Applying the Gram-Schmidt OrtoNormalization Process  p305

Load "stdlibcore.ring"
Load "MatrixLib.ring"
    
// Basis  = { V1, V2}
//
//   w1 = v1
//   w2 = v2 -  |v2.w1|  
//             --------- W1
//              |w1.w1|

V1 = [[ 1],[ 1]]
V2 = [[ 0],[ 1]]

//V1 = [[ 1],[ 1],[0]]
//V2 = [[ 0],[ 2],[0]]
//v3 = [[ 0],[ 1],[2]]

MatrixPrint(v1)
MatrixPrint(v2)


W1 = V1


//---------------------------
// OrthoNormalization

W2 = MatrixSub( V2, MatrixProjection(V2,W1))
See "V2 - Matrix Proj(v2,w1) => W2  (-1/2, 1/2)  = " MatrixPrint(W2)

//------------------------
// Normalize Each Vector
// u1 =   w1
//     --------
//      ||w2||


U1 =  ScalarMultiply( (1/VectorNorm(w1)), w1 )
See "Orthogonal-Normalize U1 normalize w1 (0.707, 0.707) = "  MatrixPrint(U1)

U2 =  ScalarMultiply( (1/VectorNorm(w2)), w2 )
See "Orthogonal-Normalize U2 normalize w2 (-0.707, 0.707) = "  MatrixPrint(U2)

U1t = MatrixTranspose(U1)
U2t = MatrixTranspose(U2)

MatrixPrint(u1t)
MatrixPrint(u2t)

u3 = list(len(u1), 2)
for i = 1 to len(U1)
    U3[1][i] = U1t[1][i]
    U3[2][i] = U2t[1][i]
next

See "U3 combo u1,u2  "  MatrixPrint(u3)

//========================
// Library

U4 = MatrixOrthoNormal2(V1,V2)
See "U4 Library Ortho-Normal V1,V2 "  MatrixPrint(U4)


