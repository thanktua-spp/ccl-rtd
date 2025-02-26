function result = hypgeom(ab, c, z)
a = ab(1); b = ab(2); s = 1; t = 1; n = 0;
result = 1;

while (abs(t) > 1e-13)
 n = n + 1;
 s = s * z/n;
 ap = Pochhammer(a, n);
 bp = Pochhammer(b, n);
 cp = Pochhammer(c, n);
 t  = ap*bp/cp*s;
 result = result + t;
end

function pq = Pochhammer(q, n)
pq = gamma(q+n)/gamma(q);