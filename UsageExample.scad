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

shelfBackplate(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);

offset1 = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;
translate([offset1, 0]) {
    shelfVerticalWalls(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);
}

offset2 = (drawerDepth + marginBetweenCuts)*(drawersWide-1) + offset1;
translate([offset2, 0]) {
    shelfHorizontalWalls(materialThickness, materialThickness*2, drawerWidth, drawerHeight, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts, 2);
}

offset3 = ((drawerWidth+materialThickness)*drawersWide+materialThickness)*2 + offset2 + marginBetweenCuts*2;
translate([offset3, 0]) {
    shelfDrawers(materialThickness, materialThickness*2, drawerWidth-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts);
}