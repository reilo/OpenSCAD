use <../Library/RoundedBox.scad>
use <../Library/RoundedPlate.scad>

$fn = $preview ? 40 : 100;

RoundedBox(h = 40, w = 165, d = 120, r = 5, wth = 2, bth = 2);

//translate([0, 0, -2])
//    RoundedPlate(h = 2.001, w = 116, d = 71, r = 5);