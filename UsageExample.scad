include <shelf.scad>

materialThickness = 3;
fingerLength = 3*3;
drawerWidth = 15;
drawerHeight = 15;
drawerDepth = 30;
drawersWide = 3;
drawersHigh = 3;

drawerTolerance = 0;
dottedMargin = materialThickness;
marginBetweenCuts = 2;
splitUp = 1;

RIGHT = 0;
UP = 1;
offset = (drawerWidth+materialThickness)*drawersWide+materialThickness + marginBetweenCuts;
offset1 = (drawerWidth+materialThickness)*max(drawersWide, drawersHigh)+materialThickness + marginBetweenCuts + offset;
offset2 = (drawerDepth+materialThickness+marginBetweenCuts)*(drawersWide-1) + offset1;
offset3 = ((drawerWidth+materialThickness)*drawersWide+materialThickness)*splitUp + offset2 + marginBetweenCuts*(splitUp-1);

module shelf() {
    shelfBackplate(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, dottedMargin);

    translate([offset, 0]) {
        shelfOuterWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
    }

    translate([offset1, 0]) {
        shelfVerticalWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
    }

    translate([offset2, 0]) {
        shelfHorizontalWalls(materialThickness, fingerLength, drawerWidth, drawerHeight, drawerDepth+materialThickness, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin, splitUp);
    }

    translate([offset3, 0]) {
        shelfDrawers(materialThickness, fingerLength, drawerWidth-drawerTolerance, drawerHeight-drawerTolerance, drawerDepth, drawersWide, drawersHigh, marginBetweenCuts, dottedMargin);
    }
}

// Takes care of all the stuff that needs to be removed
module joinDrawerDiff(drawerFrom, direction) {
    if(direction == RIGHT) {
        // + materialThickness*(drawerFrom.x+1)+((drawerFrom.x)*drawerHeight)
        // materialThickness*(drawerFrom.y+1)+((drawerFrom.y+1)*drawerWidth)
        if(drawerFrom.x == 0 || drawerFrom.y == drawersHigh-1) {
            translate([offset1 + (drawerDepth+materialThickness+marginBetweenCuts)*(drawerFrom.x), materialThickness+(materialThickness+drawerHeight)*drawerFrom.y])
               square([drawerDepth+materialThickness, drawerWidth+materialThickness]);
        } else {
            translate([offset1 + (drawerDepth+materialThickness+marginBetweenCuts)*(drawerFrom.x), materialThickness+(materialThickness+drawerHeight)*drawerFrom.y])
               square([drawerDepth+materialThickness, drawerWidth]);
        }
    }

    if(direction == UP) {
    }
}

// Takes care of all the stuff that needs to be added
module joinDrawer(drawerFrom, direction) {
    if(direction == RIGHT) {
        translate([materialThickness*(drawerFrom.x+1)+((drawerFrom.x+1)*drawerHeight), (drawerFrom.y+1)*materialThickness+(drawerFrom.y*drawerWidth)])
            square([materialThickness,drawerWidth]);
    }
    if(direction == UP) {
        translate([materialThickness*(drawerFrom.x+1)+((drawerFrom.x)*drawerHeight), materialThickness*(drawerFrom.y+1)+((drawerFrom.y+1)*drawerWidth)])
            square([drawerWidth,materialThickness]);
    }

    panelHeight = drawerDepth+marginBetweenCuts+materialThickness;
    // Lowest side
    if(drawerFrom.y == 0 && direction == RIGHT) {
        translate([offset+materialThickness*(drawerFrom.x+1)+drawerWidth*(drawerFrom.x+1), materialThickness]) {
            square([materialThickness, drawerDepth]);
        }
    }

    // 2. Lowest side
    if(drawerFrom.y == drawersHigh-1 && direction == RIGHT) {
        translate([offset+materialThickness*(drawerFrom.x+1)+drawerWidth*(drawerFrom.x+1), panelHeight+materialThickness]) {
            square([materialThickness, drawerDepth]);
        }
    }

    // und so weiter
    if(drawerFrom.x == 0 && direction == UP) {
        translate([offset+materialThickness*(drawerFrom.y+1)+drawerWidth*(drawerFrom.y+1), panelHeight*2+materialThickness]) {
            square([materialThickness, drawerDepth]);
        }
    }
    // und so weiter
    if(drawerFrom.x == drawersWide-1 && direction == UP) {
        translate([offset+materialThickness*(drawerFrom.y+1)+drawerWidth*(drawerFrom.y+1), panelHeight*3+materialThickness]) {
            square([materialThickness, drawerDepth]);
        }
    }
}

// moduel(matrix)
difference() {
    shelf();
    joinDrawerDiff([1,1], RIGHT);
    joinDrawerDiff([1,1], UP);
    // fixJoinDiff([1,1], RIGHT);
    joinDrawerDiff([1,2], RIGHT);
    joinDrawerDiff([2,1], UP);
}
joinDrawer([1,1], RIGHT);
joinDrawer([1,1], UP);
// fixJoin([1,1], RIGHT);
joinDrawer([1,2], RIGHT);
joinDrawer([2,1], UP);
