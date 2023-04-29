clear;clc;
img = imread("1.jpg");
rank = [10, 20, 50, 100, 200, 500];
for i=1:1:6
    subplot(2, 3, i);
    img_re=svd_compression(img, rank(1,i));
    imshow(img_re);
    title('rank = ' + string(rank(1,i)));
end

function image = svd_compression(img, rank)
    [height, width, channel] = size(img);
    channel_r = double(img(:, :, 1));
    channel_g = double(img(:, :, 2));
    channel_b = double(img(:, :, 3));
    [ur, sr, vr] = svd(channel_r);
    [ug, sg, vg] = svd(channel_g);
    [ub, sb, vb] = svd(channel_b);
    channel_r_re = zeros(height, width);
    channel_g_re = zeros(height, width);
    channel_b_re = zeros(height, width);
    for i=1:1:rank
        channel_r_re = channel_r_re + sr(i, i) * ur(:, i) * vr(:, i)';
        channel_g_re = channel_g_re + sg(i, i) * ug(:, i) * vg(:, i)';
        channel_b_re = channel_b_re + sb(i, i) * ub(:, i) * vb(:, i)';
    end
    img_re = zeros(height, width, channel);
    img_re(:, :, 1) = channel_r_re;
    img_re(:, :, 2) = channel_g_re;
    img_re(:, :, 3) = channel_b_re;
    image = uint8(img_re);
end
