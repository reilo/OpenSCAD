/*
 * Project:     MyBox.scad
 * Version:     1.0
 * Author:      Reinhard Loch
 * Copyright:   2024
 * License:     2-clause BSD License
 *              (http://opensource.org/licenses/BSD-2-Clause)
 */

use <../Library/Boxes.scad>


/* [Hidden] */

$fn = $preview ? 40 : 100;


/* [Box Dimensions / Abmessungen] */

// Height / Höhe
height = 50; // [5:5:200]

// Width / Breite
width = 120; // [10:5:250]

// Depth / Tiefe
depth = 80; // [10:5:250]

// Wall Thickness / Wanddicke
wallThickness = 2; // [1:0.5:5]

// Bottom Thickness / Bodendicke
bottomThickness = 2; // [1:0.5:5]


/* [Box Corners / Kanten] */

// Rounding Type of Outer Corners / Äußere Kanten
roundingType = 1; // [0:None / Keine, 1:Walls / nur Seiten, 2:Bottom and Walls / Boden und Seiten]

// Rounding Radius of Outer Corners / Radius der äußeren Kantem
radius = 5; // [1:10]

// Rounding Type of Inner Corners / Innere Kanten
innerRoundingType = 2; // [0:None / Keine, 1:Walls / nur Seiten, 2:Bottom and Walls / Boden und Seiten]

// Rounding Radius of Inner Corners / Radius der inneren Kanten
innerRadius = 3; // [1:10]


/* [Box Subdivision / Fächer] */

// Row Dimensions (in percentage) / Größe der Zeilen (in Prozent) - max 100
rows = [40, 60, 0, 0];

// Column Dimensions (in percentage) / Größe der Spalten (in Prozent) - max 100
cols = [30, 40, 30, 0];


/* [Box Stacking / Stapeln] */

// Stacking Height / Stapelhöhe
stackingHeight = 2; // [0:0.5:5]

// Stacking Tolerance / Stapeltoleranz
stackingTolerance = 0.00; // [0:0.05:1]


/* [Hidden] */

rowsEffective = [for (i = [0 : len(rows)-1]) if (rows[i] > 0) rows[i]];

colsEffective = [for (i = [0 : len(cols)-1]) if (cols[i] > 0) cols[i]];


Box(
    width = width,
    depth = depth,
    height = height,
    wallThickness = wallThickness,
    bottomThickness = bottomThickness,
    roundedCorners = roundingType,
    radius = radius,
    innerRoundedCorners = innerRoundingType,
    innerRadius = innerRadius,
    rows = rowsEffective, 
    columns = colsEffective,
    stackingHeight = stackingHeight,
    stackingTolerance = stackingTolerance
);