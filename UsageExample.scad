include <shelf.scad>

materialThickness = 3;
fingerLength = 3*3;
drawerWidth = 50;
drawerHeight = 50;
drawerDepth = 100;
drawersWide = 5;
drawersHigh = 10;

drawerTolerance = 0;
dottedMargin = materialThickness;
marginBetweenCuts = 1;
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

module fixJoinDiff(drawerFrom, direction) {
    if(direction == RIGHT) {
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

module fixJoin(drawerFrom, direction) {
    if(direction == RIGHT) {
    }
    if(direction == UP) {
    }
}

module makeBox(matrix, rows, columns) {
    difference() {
        shelf();
        for (y = [0:rows-1]) {
            for (x = [0:columns-1]) {
                if(x < (columns-1) && (matrix[(rows-1)-y][x] == 1 || matrix[(rows-1)-y][x] == 3)) {
                    joinDrawerDiff([x,y], RIGHT);
                    if((x+1) < (columns-1) && (matrix[(rows-1)-y][x+1] == 1 || matrix[(rows-1)-y][x+1] == 3)) {
                        fixJoinDiff([x,y], RIGHT);
                    }
                }
                if(y < (rows-1) && (matrix[(rows-1)-y][x] == 2 || matrix[(rows-1)-y][x] == 3)) {
                    joinDrawerDiff([x,y], UP);
                    if((y+1) < (rows-1) && (matrix[(rows-1)-(y+1)][x] == 2 || matrix[(rows-1)-(y+1)][x] == 3)) {
                        fixJoinDiff([x,y], UP);
                    }
                }
            }
        }
    }
    for (y = [0:rows-1]) {
        for (x = [0:columns-1]) {
            if(x < (columns-1) && (matrix[(rows-1)-y][x] == 1 || matrix[(rows-1)-y][x] == 3)) {
                joinDrawer([x,y], RIGHT);
                if((x+1) < (columns-1) && (matrix[(rows-1)-y][x+1] == 1 || matrix[(rows-1)-y][x+1] == 3)) {
                    fixJoin([1,1], RIGHT);
                }
            }
            if(y < (rows-1) && (matrix[(rows-1)-y][x] == 2 || matrix[(rows-1)-y][x] == 3)) {
                joinDrawer([x,y], UP);
                if((y+1) < (rows-1) && (matrix[(rows-1)-(y+1)][x] == 2 || matrix[(rows-1)-(y+1)][x] == 3)) {
                    fixJoin([x,y], UP);
                }
            }
        }
    }
}
intersection() {
    makeBox([
        [0,0,0],
        [0,0,0],
        [0,0,0]
    ], 3, 3);
    translate([1487, 0])
        square([1220, 610]);
}