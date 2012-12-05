function [ points ] = negate_intensities(intensity)
    points=intensity;
    
    sz=size(points);
    for i=1:1:sz(1)
        for j=1:1:sz(2)
            points(i,j,3)=1-points(i,j,3);
        end
    end
    
end

