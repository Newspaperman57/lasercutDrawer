include <shelf.scad>

materialThickness = 3;
fingerLength = 3*3;
drawerWidth = 15;
drawerHeight = 15;
drawerDepth = 30;
drawersWide = 5;
drawersHigh = 5;

drawerTolerance = 0;
dottedMargin = materialThickness;
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