using CommutativeRings
using Primes
using Distributions
using Random

#parameters
n = 10
delta = n^-4
q = nextprime(n^2)
m = Int(round(n^2*log(q)))
#convention
ZZq = Int/q;
#convention
d = Normal(.0,1.)
#key generation
x = rand(ZZq,n) #constructing n-vector
A = rand(ZZq,m,n); #constructing (mxn)-matrix
e = ZZq.(round.(rand(d,m)))
y = A*x+e
#encryption
b = ZZq(1)
w = ZZq.(rand(Bool,1,m))
c = w*[A y]
c[end] += b*ZZq(floor(q/2))
#decryption
m = c*[x; ZZq(-1)]
