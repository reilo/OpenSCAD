
width = 120;
depth = 75;
height = 30;

thickness = 3;

rows = 2;
columns = 3;

xsize = (width - (columns + 1)* thickness) / columns;
ysize = (depth - (rows + 1) * thickness) / rows;


difference() {
    cube([width, depth, height], false);
    
    for (x = [0:columns-1])
        for (y = [0:rows-1])
            translate([(x+1)*thickness+x*xsize, (y+1)*thickness+y*ysize, thickness])
                cube([xsize, ysize, height]);
};

