$fn=50;

difference() {
        minkowski() {
            cube([165,42.5,20]);
            cylinder(h=10, d=10);
        };
        translate([2,2,2])
            minkowski() {
                cube([161,38.5,20]);
                cylinder(h=10, d=10);
            };
}        

