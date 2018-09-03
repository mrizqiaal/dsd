function hash = sha256(message)
    hash = [];
    h0 = hex2dec('6a09e667');
    h1 = hex2dec('bb67ae85');
    h2 = hex2dec('3c6ef372');
    h3 = hex2dec('a54ff53a');
    h4 = hex2dec('510e527f');
    h5 = hex2dec('9b05688c');
    h6 = hex2dec('1f83d9ab');
    h7 = hex2dec('5be0cd19');
    
    k = {'428a2f98', '71374491', 'b5c0fbcf', 'e9b5dba5', '3956c25b', '59f111f1', '923f82a4', 'ab1c5ed5', ...
       'd807aa98', '12835b01', '243185be', '550c7dc3', '72be5d74', '80deb1fe', '9bdc06a7', 'c19bf174', ...
       'e49b69c1', 'efbe4786', '0fc19dc6', '240ca1cc', '2de92c6f', '4a7484aa', '5cb0a9dc', '76f988da', ...
       '983e5152', 'a831c66d', 'b00327c8', 'bf597fc7', 'c6e00bf3', 'd5a79147', '06ca6351', '14292967', ...
       '27b70a85', '2e1b2138', '4d2c6dfc', '53380d13', '650a7354', '766a0abb', '81c2c92e', '92722c85', ...
       'a2bfe8a1', 'a81a664b', 'c24b8b70', 'c76c51a3', 'd192e819', 'd6990624', 'f40e3585', '106aa070', ...
       '19a4c116', '1e376c08', '2748774c', '34b0bcb5', '391c0cb3', '4ed8aa4a', '5b9cca4f', '682e6ff3', ...
       '748f82ee', '78a5636f', '84c87814', '8cc70208', '90befffa', 'a4506ceb', 'bef9a3f7', 'c67178f2'}; 
   
	blocks = padding_function(message);
    [row, col] = size(blocks);
    for i=1:row
        keys = gen_keys(blocks(i,1:512));
        a = h0; b = h1; c = h2; d = h3; e = h4; f = h5; g = h6; h = h7;
        for i=1:64
            e1 = Eta1(e);
            chr = Ch(e, f, g);
            e0 = Eta0(a);
            maj = Ma(a, b, c);
            
            temp1 = mod(h+e1, 2^32);
            temp1 = mod(temp1+chr, 2^32);
            temp1 = mod(temp1+hex2dec(k(i)), 2^32);
            temp1 = mod(temp1+keys(i), 2^32);
            temp2 = mod(e0+maj, 2^32);
            
            h = g;
            g = f;
            f = e;
            e = mod(d+temp1, 2^32);
            d = c;
            c = b;
            b = a;
            a = mod(temp1+temp2, 2^32);
        end
        h0 = mod(h0+a, 2^32);
        h1 = mod(h1+b, 2^32);
        h2 = mod(h2+c, 2^32);
        h3 = mod(h3+d, 2^32);
        h4 = mod(h4+e, 2^32);
        h5 = mod(h5+f, 2^32);
        h6 = mod(h6+g, 2^32);
        h7 = mod(h7+h, 2^32);
    end
    h0 = reshape(dec2bin(h0, 32).'-'0',1,[]);
    h1 = reshape(dec2bin(h1, 32).'-'0',1,[]);
    h2 = reshape(dec2bin(h2, 32).'-'0',1,[]);
    h3 = reshape(dec2bin(h3, 32).'-'0',1,[]);
    h4 = reshape(dec2bin(h4, 32).'-'0',1,[]);
    h5 = reshape(dec2bin(h5, 32).'-'0',1,[]);
    h6 = reshape(dec2bin(h6, 32).'-'0',1,[]);
    h7 = reshape(dec2bin(h7, 32).'-'0',1,[]);
    
    hash = [h0, h1, h2, h3, h4, h5, h6, h7];
    hash = binaryVectorToHex(hash);
end

function blocks = padding_function(message)
    %convert pesan menjadi biner
    %panjang karakter * 8
    binary_message = reshape(dec2bin(message, 8).'-'0',1,[])
    message_length = length(binary_message);
    
    %padding
    p = binary_message;
    p(message_length+1) = 1;
    
    while mod(length(p), 512) ~= 448
        p(length(p)+1) = 0;
    end

    binlen = reshape(dec2bin(message_length).'-'0',1,[]);
    zfill = [zeros(1, 64-length(binlen)), binlen];
    p = [p, zfill];
    
    block_no = length(p)/512;
    
    blocks = [];
    start = 1;
    for i=1:block_no
        blocks = [blocks; p(start:512*i)];
        start = start + 512;
    end
end

function keys = gen_keys(block)
    keys = [];
    start = 1;
    for i=1:16
        keys = [keys, bi2de(block(start:32*i), 'left-msb')];
        start = start + 32;
    end
    for l=17:64
        S0 = Sigma0(keys(l-15));
        S1 = Sigma1(keys(l-2));
        w = mod(keys(l-16) + S0, 2^32);
        w = mod(w + keys(l-7), 2^32);
        w = mod(w + S1, 2^32);
        keys = [keys, w];
    end
end

function sigma_0 = Sigma0(x)
    %rotate right & right shift
    ror1 = reshape((bin(bitror(fi(x,0,32,0),7))).'-'0',1,[]);
    ror2 = reshape((bin(bitror(fi(x,0,32,0),18))).'-'0',1,[]);
    sigma_0 = bitxor(bitxor(bi2de(ror1, 'left-msb'),  bi2de(ror2, 'left-msb')), floor(bitsra(x,3)));
end

function sigma_1 = Sigma1(x)
    ror1 = reshape((bin(bitror(fi(x,0,32,0),17))).'-'0',1,[]);
    ror2 = reshape((bin(bitror(fi(x,0,32,0),19))).'-'0',1,[]);
    sigma_1 = bitxor(bitxor(bi2de(ror1, 'left-msb'),  bi2de(ror2, 'left-msb')), floor(bitsra(x,10)));
end

function eta_0 = Eta0(x)
    ror1 = reshape((bin(bitror(fi(x,0,32,0),2))).'-'0',1,[]);
    ror2 = reshape((bin(bitror(fi(x,0,32,0),13))).'-'0',1,[]);
    ror3 = reshape((bin(bitror(fi(x,0,32,0),22))).'-'0',1,[]);
    eta_0 = bitxor(bitxor(bi2de(ror1, 'left-msb'),  bi2de(ror2, 'left-msb')), bi2de(ror3, 'left-msb'));
end

function eta_1 = Eta1(x)
    ror1 = reshape((bin(bitror(fi(x,0,32,0),6))).'-'0',1,[]);
    ror2 = reshape((bin(bitror(fi(x,0,32,0),11))).'-'0',1,[]);
    ror3 = reshape((bin(bitror(fi(x,0,32,0),25))).'-'0',1,[]);
    eta_1 = bitxor(bitxor(bi2de(ror1, 'left-msb'),  bi2de(ror2, 'left-msb')), bi2de(ror3, 'left-msb'));
end

function chr = Ch(e, f, g)
    NOT(1:32) = 1;
    chr = bitxor(bitand(e, f),bitand(bitxor(e, bi2de(NOT)), g));
end

function maj = Ma(a, b, c)
    maj = bitxor(bitxor(bitand(a, b),bitand(a, c)), bitand(b, c));
end