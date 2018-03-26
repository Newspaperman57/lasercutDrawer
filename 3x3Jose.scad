include <shelf.scad>

fingerLength = 6;
materialThickness = 6.5;
drawerWidth = 100;
drawerHeight = 100;
drawerDepth = 100;
drawerTolerance = 0;
drawersWide = 3;
drawersHigh = 3;
dottedMargin = fingerLength;
marginBetweenCuts = 2;
splitUp = 1;

module skuffedimmer() {
    shelfBackplate(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, dottedMargin);

    offset = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;
     translate([offset, 0]) {
         difference() {
            shelfOuterWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
             translate([0, (drawerDepth+materialThickness+marginBetweenCuts)*3])
                square([900, 900]);
         }
     }

    offset1 = (drawerWidth+materialThickness)*max(drawersWide, drawersHigh)+materialThickness + marginBetweenCuts + offset;
    translate([offset1, 0]) {
        shelfVerticalWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
    }

    offset2 = (drawerDepth+materialThickness+marginBetweenCuts)*(drawersWide-1) + offset1;
    translate([offset2, 0]) {
        shelfHorizontalWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin, splitUp);
    }

    translate([offset2, (drawerDepth+materialThickness+marginBetweenCuts)*-1]) {
        difference() {
            shelfOuterWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
            square([900, (drawerDepth+materialThickness+marginBetweenCuts)*3]);
        }
    }

    offset3 = ((drawerWidth+materialThickness)*drawersWide+materialThickness)*splitUp + offset2;
    translate([0, offset]) {
        shelfDrawers(materialThickness, fingerLength, drawerWidth-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, 2, 2, marginBetweenCuts, dottedMargin);
    }

    offset3 = ((drawerWidth+materialThickness)*drawersWide+materialThickness)*splitUp + offset2;
    translate([offset3+drawerWidth+marginBetweenCuts, 0]) {
            shelfDrawers(materialThickness, fingerLength, drawerWidth-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, 1, 1, marginBetweenCuts, dottedMargin);

    }
    
    offset4 = (drawerWidth+marginBetweenCuts)*5 + offset3;
    difference() {        
        translate([offset3, 0]) {
            shelfDrawers(materialThickness, fingerLength, (drawerWidth*2)-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, 1, 1, marginBetweenCuts, dottedMargin);
        }
        translate([offset3+drawerWidth+materialThickness, 0])
            square(9000);
    }

    translate([offset3, drawerHeight+marginBetweenCuts]) {
        difference() {
            shelfDrawers(materialThickness, fingerLength, (drawerWidth*2)-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, 1, 1, marginBetweenCuts, dottedMargin);
            square([drawerWidth+materialThickness, drawerHeight*2]);
        }
    }
    offset4 = (drawerWidth+marginBetweenCuts)*5 + drawerWidth + offset3;
    translate([offset4, 0]) {
        shelfDrawers(materialThickness, fingerLength, (drawerWidth)-drawerTolerance, (drawerHeight*2)-drawerTolerance, drawerDepth, 1, 1, marginBetweenCuts, dottedMargin);
    }
        
    translate([materialThickness, materialThickness+drawerHeight])
        square([drawerWidth, materialThickness]);

    translate([(drawerWidth+materialThickness)*2, materialThickness])
        square([materialThickness, drawerHeight]);

    offset = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;
    translate([offset + (drawerWidth+materialThickness)*2, materialThickness])
        square([materialThickness, drawerHeight]);

    translate([offset + (drawerWidth+materialThickness)*2, materialThickness+drawerHeight+marginBetweenCuts])
        square([materialThickness, drawerHeight]);
}

offset = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;

difference() {
    skuffedimmer();
    translate([327, 0])
        square(11940);
    translate([0, 327])
        square(1194);
    offset1 = (drawerWidth+materialThickness)*max(drawersWide, drawersHigh)+materialThickness + marginBetweenCuts + offset;
    translate([offset1 + (drawerWidth+materialThickness+marginBetweenCuts), 0])
        square([drawerHeight+materialThickness+marginBetweenCuts+drawerWidth+materialThickness, drawerHeight+materialThickness]);

}