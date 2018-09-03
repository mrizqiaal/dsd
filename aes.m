%ENKRIPSI
plain = 'aku';
plain = abs(preprocessing(plain));
key = 'kamu';
key = abs(padding(key));

[sBox, polyMat, rcon, leftShift] = getTable();
mac = macGeneration();
sBox = sBoxGenerator(sBox, mac);

roundkey = keyExpand(key, sBox, rcon);

[r, c] = size(plain);

all_plain = [];
all_encrypt = [];
for i = 1:r
    all_plain = [all_plain, cipher2hex(plain(i,:))];
    encrypted = encryption(plain(i,:), roundkey, sBox, leftShift, polyMat);
    encrypted_in_char = char(reshape(encrypted, 1, 16));
    encrypted_in_hex = cipher2hex(encrypted);
    all_encrypt = [all_encrypt, encrypted_in_hex];
end
plain
all_plain
%all_encrypt


%DEKRIPSI
plain = 'aku';
plain = abs(preprocessing(plain));
key = 'kamu';
key = abs(padding(key));

[sBox, polyMat, rcon, leftShift] = getInvTable();
sorted_index = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
sBox = sBoxGenerator(sBox, mac);

roundkey = keyExpand(key, sBox, rcon);

sBox = sBoxInverseGenerator(sBox);

r = length(all_encrypt)/48;
all_result = [];
all_char = [];
for i = 1:r
    cipher = string2cipher(all_encrypt(1+(48*(i - 1)):48+(48*(i-1))));
    decrypted = decryption(cipher, roundkey, sBox, leftShift, polyMat)
    all_char = [all_char, char(reshape(decrypted, 16, 1)')];
    all_result = [all_result, cipher2hex(decrypted)];     
end
%all_result
%all_char