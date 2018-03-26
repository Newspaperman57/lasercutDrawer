use<box.scad>

materialThickness = 3;
drawerW = 150+materialThickness;
drawerH = 30+materialThickness;
drawerD = 100+materialThickness;
fingerLength = materialThickness;
marginBetweenCuts = 1;
dottedMargin = materialThickness;

boxNoLid(drawerW, drawerH, drawerD, materialThickness, fingerLength, marginBetweenCuts, dottedMargin);
translate([0, drawerW+marginBetweenCuts]) {
	difference() {
        boxNoLid(drawerW, drawerH, drawerD, materialThickness, fingerLength, marginBetweenCuts, dottedMargin);
        translate([drawerD, 0]) {
            square(9000);
        }
    }
}
translate([0, drawerH+marginBetweenCuts]) {
	difference() {
        boxNoLid(drawerW, drawerH, drawerD, materialThickness, fingerLength, marginBetweenCuts, dottedMargin);
        square([drawerD, 9000]);
    }
}