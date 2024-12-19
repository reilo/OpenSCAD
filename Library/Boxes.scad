/*
 * Library:     Boxes.scad
 * Version:     1.0
 * Author:      Reinhard Loch
 * Copyright:   2024
 * License:     2-clause BSD License
 *              (http://opensource.org/licenses/BSD-2-Clause)
 */

$fn = $preview ? 40 : 100;

module SimpleBlock(width = 120, depth = 75, height = 50) {

    cube([width, depth, height], false);
}

module RoundedBlock(width = 120, depth = 75, height = 50, radius = 5) {

    translate([radius, radius, 0])

        minkowski() {

            cube([width - 2*radius, depth - 2*radius, height/2]);
            cylinder(h = height/2, r = radius);
        };
}

module DoubleRoundedBlock(width = 120, depth = 75, height = 50, radius = 5) {

    hull() {
    
        translate([radius, radius, radius])
            sphere(radius);
        translate([width - radius, radius, radius])
            sphere(radius);
        translate([radius, depth - radius, radius])
            sphere(radius);
        translate([width - radius, depth - radius, radius])
            sphere(radius);
        translate([radius, radius, 2 * radius])
            cylinder(h = height - 2 * radius, r = radius);
        translate([width - radius, radius, 2 * radius])
            cylinder(h = height - 2 * radius, r = radius);
        translate([radius, depth - radius, 2 * radius])
            cylinder(h = height - 2 * radius, r = radius);
        translate([width - radius, depth - radius, 2 * radius])
            cylinder(h = height - 2 * radius, r = radius);
    }
}

module Box( width = 120, depth = 75, height = 30, bottomThickness = 3, wallThickness = 2, roundedCorners = 2, 
            radius = 5, rows = [60,40], columns = [20,40,40], innerRoundedCorners = 2, innerRadius = 3) {

    xsum = width - wallThickness * (len(columns) + 1);
    ysum = depth - wallThickness * (len(rows) + 1);

    function xoffset(i) = wallThickness + (i < 1 ? 0 : xsum * columns[i-1] / 100 + xoffset(i-1));
    function yoffset(i) = wallThickness + (i < 1 ? 0 : ysum * rows[i-1] / 100 + yoffset(i-1));

    xpos = [ for (i = [0 : len(columns) - 1]) xoffset(i) ];
    ypos = [ for (i = [0 : len(rows) - 1]) yoffset(i) ];

    xlen = [ for (i = [0 : len(columns) - 1]) xsum * columns[i] / 100 ];
    ylen = [ for (i = [0 : len(rows) - 1]) ysum * rows[i] / 100 ];

    difference() {
        
        if (roundedCorners == 0)
            SimpleBlock(width, depth, height);
        else if (roundedCorners == 1)
            RoundedBlock(width, depth, height, radius);
        else if  (roundedCorners == 2) 
            DoubleRoundedBlock(width, depth, height, radius);

        for (i = [0 : len(columns) - 1])
            for (j = [0 : len(rows) - 1])
                translate([xpos[i], ypos[j], bottomThickness])
                    if (innerRoundedCorners == 0)
                        SimpleBlock(xlen[i], ylen[j], height - bottomThickness + 0.01);
                    else if (innerRoundedCorners == 1)
                        RoundedBlock(xlen[i], ylen[j], height - bottomThickness + 0.01, innerRadius);
                    else if (innerRoundedCorners == 2)
                        DoubleRoundedBlock(xlen[i], ylen[j], height - bottomThickness + 0.01, innerRadius);
    }
}
