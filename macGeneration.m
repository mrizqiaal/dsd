function mac = macGeneration()
    if ismac
        [status,cmd1] = unix('ifconfig en0 | awk ''/ether/{print $2}''');
    elseif ispc
        [status,cmd1] = dos('getmac');
        cmd1 = cmd1(160:176)
    end
        
    temp = [];
    for i = 1:18
        if mod(i,3) ~= 0
            temp = [temp cmd1(i)];
        end
    end
    mac = size(6);
    for i = 1:6
        a = hex2dec(temp((1:2)+(2*(i-1))));
        mac(i) = a;
    end
end