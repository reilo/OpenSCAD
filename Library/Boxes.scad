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

module InnerBlockHelper(height, bottomThickness, xpos, ypos, xlen, ylen, roundedCorners, radius) {

    if (roundedCorners == 0) {
        translate([xpos, ypos, bottomThickness])
            SimpleBlock(xlen, ylen, height - bottomThickness + 0.01);
    }
    if (roundedCorners == 1) {
        translate([xpos, ypos, bottomThickness])
            RoundedBlock(xlen, ylen, height - bottomThickness + 0.01, radius);
    }
    if (roundedCorners == 2) {
        translate([xpos, ypos, bottomThickness])
            DoubleRoundedBlock(xlen, ylen, height - bottomThickness + 0.01, radius);
    }
}

module Box( width = 120, depth = 75, height = 30, bottomThickness = 3, wallThickness = 2, roundedCorners = 2, 
            radius = 5, rows = [60,40], columns = [20,40,40], innerRoundedCorners = 2, innerRadius = 3) {

    xsum = width - wallThickness * (len(columns) + 1);
    ysum = depth - wallThickness * (len(rows) + 1);

    function xoffset(i) = i < 1 ? wallThickness : wallThickness + xsum * columns[i-1] / 100 + xoffset(i-1);
    function yoffset(i) = i < 1 ? wallThickness : wallThickness + ysum * rows[i-1] / 100 + yoffset(i-1);

    xpos = [ for (i = [0 : len(columns) - 1]) xoffset(i) ];
    ypos = [ for (i = [0 : len(rows) - 1]) yoffset(i) ];

    xlen = [ for (i = [0 : len(columns) - 1]) xsum * columns[i] / 100 ];
    ylen = [ for (i = [0 : len(rows) - 1]) ysum * rows[i] / 100 ];

    if (roundedCorners == 0) {

        difference() {

            SimpleBlock(width, depth, height);

            for (i = [0 : len(columns) - 1])
                for (j = [0 : len(rows) - 1])
                    InnerBlockHelper(height, bottomThickness, xpos[i], ypos[j], xlen[i], ylen[j], innerRoundedCorners, 
                        innerRadius);
        }
    }

    if (roundedCorners == 1) {

        difference() {

            RoundedBlock(width, depth, height, radius);

            for (i = [0 : len(columns) - 1])
                for (j = [0 : len(rows) - 1])
                    InnerBlockHelper(height, bottomThickness, xpos[i], ypos[j], xlen[i], ylen[j], innerRoundedCorners, 
                        innerRadius);
        }
    }

    if (roundedCorners == 2) {
        
        difference() {

            DoubleRoundedBlock(width, depth, height, radius);

            for (i = [0 : len(columns) - 1])
                for (j = [0 : len(rows) - 1])
                    InnerBlockHelper(height, bottomThickness, xpos[i], ypos[j], xlen[i], ylen[j], innerRoundedCorners, 
                        innerRadius);
        }
    }
}
