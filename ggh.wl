B = HadamardMatrix[8]*2Sqrt[2]; 
{U,H} = HermiteDecomposition[B]; 
B = Transpose[B]; 
H = Transpose[H]; 
mymessage = {1,2,1,3,2,1,2,1};
encrypted = H.mymessage + RandomReal[{-1,1},8];
decrypted = LinearSolve[H,B.Round[LinearSolve[B,encrypted]]]; (*En havalı satır.*)
mymessage == decrypted
