using CommutativeRings
using Primes
using Distributions
using Random
using SparseArrays

#parameters
n = 10
delta = n^-4
q = nextprime(n^2)
m = Int(round(n^2*log(q)))
#convention
ZZq = Int/q;
#convention
d = Normal{Float64}(.0,1.)
#key generation
x = [ZZq(rand(Int)) for i=1:n] #constructing n-vector
A = [ZZq(rand(Int)) for i=1:m, j=1:n]; #constructing (mxn)-matrix
e = ZZq.(Int.(round.(rand(d,m))))
y = A*x+e
#encryption
b = ZZq(1)
w = permutedims([ZZq(rand(Bool)) for i=1:m])
c = w*[A y]
c[end] += b*Int(floor(q/2))
#decryption
m = c*[x; ZZq(-1)]
