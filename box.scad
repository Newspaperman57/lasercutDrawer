use<dotted.scad>

module boxRightLeft(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves) {
    difference() {
        square([drawerD, drawerH]);    
        translate([0, drawerH-materialThickness])
            reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
        reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([materialThickness, 0])
            rotate(90)
                dotted(drawerH, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([drawerD, 0])
            rotate(90)
                dotted(drawerH, materialThickness, fingerLength, dottedMargin, laserRemoves);
    }
}

module boxFrontBack(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves) {
    difference() {
        square([drawerW,drawerH]);    
        reverseDotted(drawerW, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([0, drawerH-materialThickness])
            reverseDotted(drawerW, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([materialThickness, 0])
            rotate(90)
                reverseDotted(drawerH, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([drawerW, 0])
            rotate(90)
                reverseDotted(drawerH, materialThickness, fingerLength, dottedMargin, laserRemoves);
    }
}

module boxTopBottom(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves) {
    difference() {
        square([drawerD,drawerW]);    
        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
        translate([0, drawerW-materialThickness])
            dotted(drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([materialThickness, 0])
            rotate(90)
                dotted(drawerW, materialThickness, fingerLength, dottedMargin, laserRemoves);
        translate([drawerD, 0])
            rotate(90)
                dotted(drawerW, materialThickness, fingerLength, dottedMargin, laserRemoves);
    }
}

module box(drawerW, drawerD, drawerH, materialThickness, fingerLength=-1, dottedMargin=-1, marginBetweenCuts=1, laserRemoves=0, drawText=0) {
    dottedMargin = (dottedMargin==-1?materialThickness*1.2:dottedMargin);
    fingerLength = (fingerLength==-1?materialThickness:fingerLength);
    drawerW = (inside?drawerW+materialThickness*2:drawerW);
    drawerD = (inside?drawerD+materialThickness*2:drawerD);
    drawerH = (inside?drawerH+materialThickness*2:drawerH);
    //bottom top
    difference() {
        boxTopBottom(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
        if(drawText == true)
            translate([10, 10])
                text("Bottom");
    }


    translate([(drawerD+marginBetweenCuts), 0]){
        difference() {
            boxTopBottom(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
            if(drawText == true)
                translate([10, 10])
                    text("Top");
            }
    }

    //right left side
    translate([(drawerD+marginBetweenCuts)*2, 0]){
        difference() {
           boxRightLeft(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
            if(drawText == true)
               translate([10, 10])
                   text("Right");
            }
    }

    translate([(drawerD+marginBetweenCuts)*3, 0]){
        difference() {
            boxRightLeft(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
            if(drawText == true)
                translate([10, 10])
                    text("Left");
            }
    }

    // front back side
    translate([(drawerD+marginBetweenCuts)*4, 0]){
        difference() {
            boxFrontBack(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
            if(drawText == true)
                translate([10, 10])
                    text("Front");
            }
    }

    translate([(drawerD+marginBetweenCuts)*4+marginBetweenCuts+drawerW, 0]) {
        difference() {
            boxFrontBack(drawerW, drawerH, drawerD, materialThickness, fingerLength, dottedMargin, laserRemoves);
            if(drawText == true)
                translate([10, 10])
                    text("Back");
            }
    }
}