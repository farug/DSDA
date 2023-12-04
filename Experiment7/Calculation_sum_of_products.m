clear all;
clc;

X = sym('X%d%d', [5:5]);
Y = sym('Y%d%d', [3:3]);
K = sym('k%d%d', [3:3]);

sym z;

for m=-2:1:2
    for n=-2:1:2     
        for i=-1:1:1
            for j=-1:1:1
                if( (m == 2) || (n == 2) || (m == -2) || (n == -2) )
                    continue;
                end
                z = X(m-i+3,n-j+3)*K(i+2,j+2);
                Y(m+2,n+2) = Y(m+2,n+2) + z;
            end
        end
    end
end


Y(1,1)
Y(1,2)
Y(1,3)
Y(2,1)
Y(2,2)
Y(2,3)
Y(3,1)
Y(3,2)
Y(3,3)