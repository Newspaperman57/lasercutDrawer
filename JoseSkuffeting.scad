module dotted(length, width, fingerLength, margin=0) {
    translate([((length-margin*2-fingerLength)%(fingerLength*2))/2+margin, 0]) {
        for(i = [0:fingerLength*2:(length-margin*2)-fingerLength]) {
            translate([i,0])
                square([fingerLength, width]);
        }
    }
}
module reverseDotted(length, width, fingerLength, margin=0) {
    difference() {
        square([length, width]);
        dotted(length, width, fingerLength, margin);
    }
}

module drawer(drawerSizex, drawerSizey) {
    // Small Drawer
    //bottom
    translate([0, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            dotted(drawerSizex, materialThickness, materialThickness*2, dottedMargin);
            translate([0,drawerSizey-materialThickness])
                dotted(drawerSizex, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
        }
    }
    //right left side
    translate([(drawerSizex+1), 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
        }
    }

    translate([(drawerSizex+1)*2, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
        }
    }

    // front back side
    translate([(drawerSizex+1)*3, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
            translate([drawerSizex/2, drawerSizey/3+drawerSizey/3+5]) {
                circle(d=20);
            }
        }
    }
    translate([(drawerSizex+1)*4, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, materialThickness*2, dottedMargin);
        }
    }
}
fingerLength = 8;
materialThickness = 3*2;
overallWidth=300+materialThickness;
overallHeight=300+materialThickness;
overallDepth=100;
dottedMargin = materialThickness*2;
drawerSize = 100-materialThickness-2;
drawerSizeW = 200-materialThickness-2;
drawerSizeH = 200-materialThickness-2;
translate([0, (overallHeight+1)])
    drawer(drawerSize, drawerSize);
translate([0, (overallHeight+1)+drawerSize+1])
    drawer(drawerSize, drawerSize);
translate([480, (overallHeight+1)]) {
    difference() {
        drawer(drawerSize, drawerSize);
        translate([(drawerSize+1)*2, 0])
        square([900,900]);
    }
}
translate([768, (overallHeight+1)+drawerSize+1]) {
    difference() {
        drawer(drawerSize, drawerSize);
        translate([(drawerSize+1)*4, 0])
        square([900,900]);
        square([(drawerSize+1)*2,900]);
    }
}
translate([768-(drawerSize+1)-76, (overallHeight+1)+drawerSize+1+drawerSize+1]) {
    difference() {
        drawer(drawerSize, drawerSize);
        square([(drawerSize+1)*4,900]);
    }
}
translate([(overallWidth+1)*4-(drawerSize+1)*2, 0]) {
    difference() {
        drawer(drawerSize, drawerSize);
        translate([(drawerSize+1)*5, 0])
        square([900,900]);
        square([(drawerSize+1)*2,900]);
    }
}
translate([(overallWidth+1)*4-(drawerSize+1)*0, drawerSize+1]) {
    difference() {
        drawer(drawerSize, drawerSize);
        translate([(drawerSize+1)*2, 0])
        square([900,900]);
        square([(drawerSize+1)*0,900]);
    }
}
translate([480, (overallHeight+1)+drawerSize+1])
    drawer(drawerSize, drawerSize);

translate([480*0, (overallHeight+1)+(drawerSize+1)*2])
    drawer(drawerSizeW, drawerSize);

translate([overallWidth*3-197, (overallDepth+1)*2])
    drawer(drawerSize, drawerSizeH);

difference() {
    square([overallWidth, overallWidth]); // bottom
    
    // Sides
    dotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
    translate([0, overallHeight-materialThickness])
        dotted(overallHeight, materialThickness, materialThickness*2, dottedMargin);
    translate([materialThickness, 0]) {
        rotate(90) {
            dotted(overallHeight, materialThickness, materialThickness*2, dottedMargin);
            translate([0, -overallWidth+materialThickness])
                dotted(overallHeight, materialThickness, materialThickness*2, dottedMargin);
        }
    }
    // Delevægge
    translate([100, 100])
        dotted(overallWidth-100, materialThickness, materialThickness*2, dottedMargin);
    translate([0, 200])
        dotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
    rotate(90){
        translate([0,-100-materialThickness])
            dotted(overallHeight, materialThickness, materialThickness*2, dottedMargin);
        translate([100,-200-materialThickness])
            dotted(overallHeight-100, materialThickness, materialThickness*2, dottedMargin);
    }
}
translate([100,100])
    square([materialThickness, materialThickness]);
translate([100,200])
    square([materialThickness, materialThickness]);
translate([200,100])
    square([materialThickness, materialThickness]);
translate([200,200])
    square([materialThickness, materialThickness]);

// Top bottom sides
translate([overallWidth+1, 0]) {
    difference() {
        square([overallWidth,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([materialThickness,0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([overallWidth,0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([100+materialThickness, 0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([200+materialThickness, 0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    }
}
translate([overallWidth+1, overallDepth+1]) {
    difference() {
        square([overallWidth,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([materialThickness,0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([overallWidth,0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([100+materialThickness, 0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        // translate([200+materialThickness, 0])
        //     rotate(90)
        //         dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    }
}
// Right Left sides
translate([(overallWidth+1)*3, 0]) {
    difference() {
        square([overallWidth,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([materialThickness,0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([overallWidth,0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([100+materialThickness, 0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([200+materialThickness, 0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    
    }
}
translate([(overallWidth+1)*3, overallDepth+1]) {
    difference() {
        square([overallWidth,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([materialThickness,0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([overallWidth,0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([200+materialThickness, 0])
            rotate(90)
                dotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    
    }
}

// Upper horizontal side
translate([(overallHeight+1)*2, (overallDepth+1)*0]) {
    difference() {
        square([overallHeight,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([100,0])
            square([materialThickness,overallDepth/2]);
        translate([200,0])
            square([materialThickness,overallDepth/2]);
        translate([materialThickness, 0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([overallWidth, 0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    }
}

// Lower horizontal side
translate([(overallHeight+1)*1, (overallDepth+1)*2]) {
    difference() {
        square([overallWidth-100,overallDepth]);
        reverseDotted(overallWidth-100, materialThickness, materialThickness*2, dottedMargin);
        translate([100,0])
            square([materialThickness,overallDepth/2]);
        translate([0,0])
            square([materialThickness,overallDepth/2]);
        translate([overallWidth-100, 0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    }
}

// Left vertical side
translate([(overallHeight+1)*2, (overallDepth+1)]) {
    difference() {
        square([overallHeight,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([100,overallDepth/2])
            square([materialThickness,overallDepth/2]);
        translate([200,overallDepth/2])
            square([materialThickness,overallDepth/2]);
        translate([materialThickness, 0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        translate([overallWidth, 0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    }
}

// Right vertical side
translate([(overallHeight+1)*2-100, (overallDepth+1)*2]) {
    difference() {
        square([overallHeight-100,overallDepth]);
        reverseDotted(overallWidth, materialThickness, materialThickness*2, dottedMargin);
        translate([100,overallDepth/2])
            square([materialThickness,overallDepth/2]);
        translate([200,overallDepth/2])
            square([materialThickness,overallDepth/2]);
        translate([materialThickness, 0])
            rotate(90)
                reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
        // translate([overallWidth-100, 0])
        //     rotate(90)
        //         reverseDotted(overallDepth, materialThickness, materialThickness*2, dottedMargin);
    }
}