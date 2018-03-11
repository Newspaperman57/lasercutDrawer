module dotted(length, width, fingerLength) {
    translate([(length%fingerLength)/2, 0]) {
        for(i = [0:fingerLength*2:length]) {
            translate([i,0])
                square([fingerLength, width]);
        }
    }
}

fingerLength = 8;
materialThickness = 4;
overallWidth=300;
overallHeight=300;
dottedMargin = materialThickness*1.5;

difference() {
    square([overallWidth, overallWidth]); // bottom
    
    translate([dottedMargin, 0])
        dotted(overallWidth-dottedMargin*2, materialThickness, materialThickness*2);
    translate([dottedMargin, overallHeight-materialThickness])
        dotted(overallHeight-dottedMargin*2, materialThickness, materialThickness*2);
    translate([materialThickness, dottedMargin]) {
        rotate(90) {
            dotted(overallHeight-dottedMargin*2, materialThickness, materialThickness*2);
            translate([dottedMargin, -overallWidth+materialThickness])
                dotted(overallHeight-dottedMargin*2, materialThickness, materialThickness*2);
        }
    }
}