/*
 * Library:     RoundedPlate.scad
 * Version:     1.0
 * Author:      Reinhard Loch
 * Copyright:   2024
 * License:     2-clause BSD License
 *              (http://opensource.org/licenses/BSD-2-Clause)
 */


/* [Plate Dimensions] */

// Height
h = 5; // [10:200]

// Width
w = 120; // [10:250]

// Depth
d = 80; // [10:250]

// Radius
r = 5; // [1:10]


module RoundedPlate(h = h, w = w, d = d, r = r ) {

translate([-w/2 + r, -d/2 + r, 0])

    minkowski() {
        cube([w - 2*r, d - 2*r, h/2]);
        cylinder(h = h/2, r = r);
    };
    
};

RoundedPlate();