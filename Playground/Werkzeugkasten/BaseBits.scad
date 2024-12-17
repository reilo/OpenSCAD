$fn=50;
voff1 = 14;
voff2 = 38;
hoff1 = 15;
hoff2 = 16;
height = 12;

difference() {
        minkowski() {
            cube([165,42.5,10]);
            cylinder(h=10, d=10);
        };
        translate([2,2,2])
            minkowski() {
                cube([161,38.5,10]);
                cylinder(h=10, d=10);
            };
}        

