$fn=50;
voff1 = 14;
voff2 = 38;
hoff1 = 15;
hoff2 = 16;
height = 12;

translate([7.2,7.2,-2])
    minkowski() {
        cube([160.6,38.1,5]);
        cylinder(h=5, d=10);
    };

difference() {
    translate([5,5,0])
        minkowski() {
            cube([165,42.5,10]);
            cylinder(h=10, d=10);
        };
        
    translate([hoff1, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+18, voff1, 10])
        cylinder(h=height, d=11.5);
    translate([hoff1+36, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+54, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+72, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+90, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+108, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+125+3, voff1, 10])
        cylinder(h=height, d=12.5);
    translate([hoff1+142+3, voff1, 10])
        cylinder(h=height, d=12.5);

    translate([hoff2, voff2, 10])
        cylinder(h=height, d=18.5);
    translate([hoff2+23, voff2, 10])
        cylinder(h=height, d=17);
    translate([hoff2+46, voff2, 10])
        cylinder(h=height, d=15.5);
    translate([hoff2+67, voff2, 10])
        cylinder(h=height, d=14.5);
    translate([hoff2+88, voff2, 10])
        cylinder(h=height, d=13);
    translate([hoff2+105+5, voff2, 10])
        cylinder(h=height, d=12.5);
    translate([hoff2+122+5, voff2, 10])
        cylinder(h=height, d=12.5);
    translate([hoff2+139+5, voff2, 10])
        cylinder(h=height, d=12.5);
}        

