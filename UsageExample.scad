include <shelf.scad>

materialThickness = 6;
fingerLength = materialThickness*2;
drawerWidth = 50;
drawerHeight = 50;
drawerDepth = 100;
drawerTolerance = 0;
drawersWide = 20;
drawersHigh = 10;
dottedMargin = fingerLength;
marginBetweenCuts = 2;
splitUp = 2;

shelfBackplate(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, dottedMargin);

offset = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;
 translate([offset, 0]) {
    shelfOuterWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
}

offset1 = (drawerWidth+materialThickness)*max(drawersWide, drawersHigh)+materialThickness + marginBetweenCuts + offset;
translate([offset1, 0]) {
    shelfVerticalWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
}

offset2 = (drawerDepth+materialThickness+marginBetweenCuts)*(drawersWide-1) + offset1;
translate([offset2, 0]) {
    shelfHorizontalWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin, splitUp);
}

offset3 = ((drawerWidth+materialThickness)*drawersWide+materialThickness)*splitUp + offset2 + marginBetweenCuts*(splitUp-1);
translate([offset3, 0]) {
    shelfDrawers(materialThickness, fingerLength, drawerWidth-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
}