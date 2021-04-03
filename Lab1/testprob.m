p_ind = 0;
for x = 0:9
p_ind = nchoosek(10,x).*((0.2)^(x)).*((0.8)^(10-x));
px(x+1) = p_ind;
end
stem(px);
