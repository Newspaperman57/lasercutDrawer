use<dotted.scad>

module boxNoLid(drawerW, drawerH, drawerD, materialThickness, fingerLength, marginBetweenCuts, dottedMargin) {
    //bottom
    difference() {
        square([drawerD,drawerW]);    
        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
        translate([0,drawerW-materialThickness])
            dotted(drawerD, materialThickness, fingerLength, dottedMargin);
        translate([materialThickness, 0])
            rotate(90)
                dotted(drawerW, materialThickness, fingerLength, dottedMargin);
        translate([drawerD, 0])
            rotate(90)
                dotted(drawerW, materialThickness, fingerLength, dottedMargin);
    }
    //right left side
    translate([drawerD+marginBetweenCuts, 0]) {
        difference() {
            square([drawerD,drawerH]);    
            reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerH, materialThickness, fingerLength, dottedMargin);
            translate([drawerD, 0])
                rotate(90)
                    dotted(drawerH, materialThickness, fingerLength, dottedMargin);
        }
    }

    translate([drawerD*2+marginBetweenCuts*2, 0]) {
        difference() {
            square([drawerD,drawerH]);    
            reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerH, materialThickness, fingerLength, dottedMargin);
            translate([drawerD, 0])
                rotate(90)
                    dotted(drawerH, materialThickness, fingerLength, dottedMargin);
        }
    }

    // front back side
    translate([drawerD*3+marginBetweenCuts*3, 0]) {
        difference() {
            square([drawerW,drawerH]);    
            reverseDotted(drawerW, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    reverseDotted(drawerH, materialThickness, fingerLength, dottedMargin);
            translate([drawerW, 0])
                rotate(90)
                    reverseDotted(drawerH, materialThickness, fingerLength, dottedMargin);
        }
    }
    translate([drawerD*3+drawerW+marginBetweenCuts*4, 0]) {
        difference() {
            square([drawerW,drawerH]);    
            reverseDotted(drawerW, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    reverseDotted(drawerH, materialThickness, fingerLength, dottedMargin);
            translate([drawerW, 0])
                rotate(90)
                    reverseDotted(drawerH, materialThickness, fingerLength, dottedMargin);
        }
    }
}
