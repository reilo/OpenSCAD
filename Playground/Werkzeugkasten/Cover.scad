$fn=50;
voff1 = 14;
voff2 = 38;
hoff1 = 15;
hoff2 = 16;
height = 12;

translate([3.2,4.2,-2])
    minkowski() {
        cube([160.6,38.1,2]);
        cylinder(h=2, d=10);
    };

minkowski() {
    cube([167,46.5,1.5]);
    cylinder(h=1.5, d=10);
};

