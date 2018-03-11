include <shelf.scad>

fingerLength = 8;
materialThickness = 4;
drawerWidth = 50;
drawerHeight = 50;
drawerTolerance = 1;
drawerDepth = 100;
drawersWide = 20;
drawersHigh = 10;
dottedMargin = materialThickness*2;
marginBetweenCuts = 2;
splitUp = 1;

shelfBackplate(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);

offset = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;
translate([offset, 0]) {
    shelfOuterWalls(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);
}

offset1 = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts + offset;
translate([offset1, 0]) {
    shelfVerticalWalls(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);
}

offset2 = (drawerDepth + marginBetweenCuts)*(drawersWide-1) + offset1;
translate([offset2, 0]) {
    shelfHorizontalWalls(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts, splitUp);
}

offset3 = ((drawerWidth+materialThickness)*drawersWide+materialThickness)*splitUp + offset2;
translate([offset3, 0]) {
    shelfDrawers(materialThickness, materialThickness*2, drawerWidth-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);
}