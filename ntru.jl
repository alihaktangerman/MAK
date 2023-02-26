using CommutativeRings
N = 11;
p, q = 3, 32;
Zp, Zq = Int/p, Int/q;
Rp, Rq = Zp[:x], Zq[:x];
xnm1 = zeros(N+1);
xnm1[1] = -1;
xnm1[end] = 1;
Rp /= Rp(xnm1);
Rq /= Rq(xnm1);
function privatekeygen()
    f = rand(-1:1, N)
    try
        fp = Rp(f)^-1;
        fq = Rq(f)^-1;
    catch
        return privatekeygen();
    end
    return f;
end
f = privatekeygen();
fp = Rp(f)^-1;
fq = Rq(f)^-1;
g = rand(-1:1,N);
println(fp)
#public key
h = Zq(p)*fq*Rq(g);
println(h);
#decryption
a = Rq(f)*e;
b = Rp(a.val.coeff .|> Int);
println(a);
println(b);
c = fp*b;
println(c);

println(Rp(m))
  
