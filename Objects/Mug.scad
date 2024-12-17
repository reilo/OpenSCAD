/*
 * Project:     Mug.scad
 * Version:     1.0
 * Author:      Reinhard Loch
 * Copyright:   2024
 * License:     2-clause BSD License
 *              (http://opensource.org/licenses/BSD-2-Clause)
 */

/* [Hidden] */
$fa = 1;
$fs = 0.4;

/* [Mug Dimensions] */

// Height
h = 100; // [10:200]

// Bottom Diameter
db = 40; // [10:100]

// Top Diameter
dt = 60; // [10:200]

/* [Mug Thickness] */

// Bottom Thickness
tb = 3; // [1:10]

// Wall Thickness
tw = 2; // [1:10]


difference() {
    
    cylinder(h = h, r1 = db/2, r2 = dt/2);
    
    translate([0, 0, tb]) 
        cylinder(h = h, r1 = db/2 - tw, r2 = dt/2 - tw);

}