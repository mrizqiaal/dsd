function nsbox = sBoxGenerator(sBox, mac)
    sBox = reshape(sBox, 16, 16)'
    tsbox = zeros(16, 16);

    pt1 = [1,    4,   2,   5,...
            2,   5,   3,   6,...
            3,   6,   4,   1,...
            4,   1,   5,   2];
    pt2 = [1, 2, 3, 4, ...
        4, 5, 6, 1, ...
        2, 3, 4, 5, ...
        5, 6, 1, 2];
    
    w1 = size(16);
    w2 = size(16);
    for i = 1:16
        w1(i) = mac(pt1(i));
        w2(i) = mac(pt2(i));
    end
    [sorted1 sorted_index1] = sort(w1, 'ascend');
    [sorted2 sorted_index2] = sort(w2, 'ascend');
    sBox(sorted_index1(1),:)
    for i = 1:16
        tsbox(i,:) = sBox(sorted_index1(i),:);
    end
    nsbox = zeros(16, 16);
    for i = 1:16
        nsbox(:,i) = tsbox(:,sorted_index2(i));
    end
    nsbox
    nsbox = reshape(nsbox', 1, 256);
end