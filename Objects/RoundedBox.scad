/*
 * Project:     RoundedBox.scad
 * Version:     1.0
 * Author:      Reinhard Loch
 * Copyright:   2024
 * License:     2-clause BSD License
 *              (http://opensource.org/licenses/BSD-2-Clause)
 */


/* [Hidden] */

$fn = $preview ? 40 : 100;


/* [Box Dimensions] */

// Height
h = 50; // [10:200]

// Width
w = 120; // [10:250]

// Depth
d = 80; // [10:250]

// Radius
r = 5; // [1:10]


/* [Thickness] */

// Wall Thickness
wth = 2; // [1:10]

// Bottom Thickness
bth = 3; // [1:10]


module RoundedBox(h = h, w = w, d = d, r = r, wth = wth, bth = bth) {

translate([-w/2 + r, -d/2 + r, 0])

    difference() {
    
        minkowski() {
            cube([w - 2*r, d - 2*r, h/2]);
            cylinder(h = h/2, r = r);
        };
    
        translate([wth, wth, bth])

            minkowski() {
                cube([w - 2*r - 2*wth, d - 2*r - 2*wth, h/2]);
                cylinder(h = h/2, r = r);
            };

    };
    
};

RoundedBox();