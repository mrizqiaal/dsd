function nplain = preprocessing(plain)
    plain = padding(plain);
    n = length(plain)/16;
    nplain = reshape(plain, 16, n)';
end