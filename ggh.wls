B = HadamardMatrix[8]*2Sqrt[2]; 
{U,H} = HermiteDecomposition[B]; 
B = Transpose[B]; 
H = Transpose[H]; 
mymessage = H.{1,2,1,3,2,1,2,1} 
encrypted = mymessage + RandomReal[{-1,1},8] 
decrypted = B.Round[LinearSolve[B,encrypted]] 
