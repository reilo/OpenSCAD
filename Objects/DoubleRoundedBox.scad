/*
 * Project:     DoubleRoundedBox.scad
 * Version:     1.0
 * Author:      Reinhard Loch
 * Copyright:   2024
 * License:     2-clause BSD License
 *              (http://opensource.org/licenses/BSD-2-Clause)
 */


/* [Hidden] */

$fn = $preview ? 40 : 100;


/* [Box Dimensions] */

// Width
w = 120; // [10:250]

// Depth
d = 80; // [10:250]

// Height
h = 50; // [10:200]

// Radius
r = 5; // [1:10]

// Wall Thickness
t = 2; // [1:10]


difference() {

    hull() {
        
        translate([0, 0, 0])
            sphere(r);
        translate([w, 0, 0])
            sphere(r);
        translate([0, d, 0])
            sphere(r);
        translate([w, d, 0])
            sphere(r);
        translate([0, 0, r])
            cylinder(h = h - r, r = r);
        translate([w, 0, r])
            cylinder(h = h - r, r = r);
        translate([0, d, r])
            cylinder(h = h - r, r = r);
        translate([w, d, r])
            cylinder(h = h - r, r = r);
    }
    
    hull() {
        
        translate([t, t, t])
            sphere(r);
        translate([w - t, t, t])
            sphere(r);
        translate([t, d - t, t])
            sphere(r);
        translate([w - t, d - t, t])
            sphere(r);
        translate([t, t, r + t])
            cylinder(h = h - r, r = r);
        translate([w - t, t, r + t])
            cylinder(h = h - r, r = r);
        translate([t, d - t, r + t])
            cylinder(h = h - r, r = r);
        translate([w - t, d - t, r + t])
            cylinder(h = h - r, r = r);
    }
}