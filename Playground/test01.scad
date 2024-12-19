use <../Library/Boxes.scad>

$fn = $preview ? 40 : 100;

Box(width = 180, depth = 180, height = 45, roundedCorners = 0, innerRoundedCorners = 2, innerRadius = 5, bottomThickness = 2, wallThickness = 2, rows = [50,50], columns = [50,50]);

