use<dotted.scad>

module shelfBackplate(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH) {
    dottedMargin=materialThickness*2;
    width = (drawerW+materialThickness)*drawersW+materialThickness;
    height = (drawerH+materialThickness)*drawersH+materialThickness;
    difference() {
        square([width, height]); // bottom
        // fingers for sidewalls
        dotted(width, materialThickness, materialThickness*2, dottedMargin);
        translate([0, height-materialThickness]) 
            dotted(width, materialThickness, materialThickness*2, dottedMargin);
        translate([materialThickness, 0]) {
            rotate(90) {
                dotted(height, materialThickness, materialThickness*2, dottedMargin);
                translate([0, -width+materialThickness])
                    dotted(height, materialThickness, materialThickness*2, dottedMargin);
            }
        }
        // inside walls
        for(i = [materialThickness:drawerW+materialThickness:width]) {
            translate([i, 0])
                rotate(90)
                    dotted(height, materialThickness, materialThickness*2, dottedMargin);
        }
        for(i = [0:drawerH+materialThickness:height]) {
            translate([0, i])
                dotted(width, materialThickness, materialThickness*2, dottedMargin);
        }
    }
}

module shelfOuterWalls(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts) {
    dottedMargin=materialThickness*2;
    width = (drawerW+materialThickness)*drawersW+materialThickness;
    height = (drawerH+materialThickness)*drawersH+materialThickness;
    translate([0, (drawerD+marginBetweenCuts)*2]) {
        difference() {
            square([height,drawerD]);
            reverseDotted(height, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                    translate([0, -height+materialThickness])
                        reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
            // Slots for Horizontal walls
            for(j=[1:drawersH-1]) {
                translate([j*(drawerH+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
        }
    }
    translate([0, (drawerD+marginBetweenCuts)*3]) {
        difference() {
            square([height,drawerD]);
            reverseDotted(height, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                    translate([0, -height+materialThickness])
                        reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
            // Slots for Horizontal walls
            for(j=[1:drawersH-1]) {
                translate([j*(drawerH+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
        }
    }
    translate([0, (drawerD+marginBetweenCuts)*0]) {
        difference() {
            square([width,drawerD]);
            reverseDotted(width, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                    translate([0, -width+materialThickness])
                        dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
            // Slots for Vertical walls
            for(j=[1:drawersW-1]) {
                translate([j*(drawerW+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
        }
    }
    translate([0, (drawerD+marginBetweenCuts)*1]) {
        difference() {
            square([width,drawerD]);
            reverseDotted(width, materialThickness, materialThickness*2, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                    translate([0, -width+materialThickness])
                        dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
            // Slots for Vertical walls
            for(j=[1:drawersW-1]) {
                translate([j*(drawerW+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                }
            }
        }
    }
}

module shelfVerticalWalls(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts) {
    dottedMargin=materialThickness*2;
    width = (drawerW+materialThickness)*drawersW+materialThickness;
    height = (drawerH+materialThickness)*drawersH+materialThickness;
    translate([0, height]) {
        rotate(-90) {
            for(i=[0:drawersW-2]) {
                translate([0,i*(drawerD+marginBetweenCuts)]) {
                    difference() {
                        square([height,drawerD]);
                        reverseDotted(height, materialThickness, materialThickness*2, dottedMargin);
                        translate([materialThickness, 0]) {
                            rotate(90) {
                                reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                                translate([0, -height+materialThickness])
                                    reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                            }
                        }
                        // Slots for Horizontal walls
                        for(j=[1:drawersH-1]) {
                            translate([j*(drawerH+materialThickness), drawerD/2]) {
                                square([materialThickness, drawerD/2]);
                            }
                        }
                    }
                }
            }
        }
    }
}

module shelfHorizontalWalls(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts, splitUp=1) {
    dottedMargin=materialThickness*2;
    width = ((drawerW+materialThickness)*drawersW)+materialThickness;
    for(j=[1:splitUp]) {
        translate([marginBetweenCuts*(j-1), ((-(((drawersH-2)/splitUp)*(j-1)))*(drawerD+marginBetweenCuts))]) {
            for(i=[(((drawersH-2)/splitUp)*(j-1)):(((drawersH-1)/splitUp)*j)-1]) {
                translate([(j-1)*width, i*(drawerD+marginBetweenCuts)]) {
                    difference() {
                        square([width,drawerD]);
                        reverseDotted(width, materialThickness, materialThickness*2, dottedMargin);
                        translate([materialThickness, 0]) {
                            rotate(90) {
                                reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                                translate([0, -width+materialThickness])
                                    reverseDotted(drawerD, materialThickness, materialThickness*2, dottedMargin);
                            }
                        }
                        // Slots for Vertical walls
                        for(j=[1:drawersW-1]) {
                            translate([j*(drawerW+materialThickness), 0]) {
                                square([materialThickness, drawerD/2]);
                            }
                        }
                    }
                }
            }
        }
    }
}

module shelfDrawers(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts, splitUp=1) {
    for(i=[0:drawersW-1]) {
        for(j=[0:drawersH-1]) {
            translate([i*((drawerW+marginBetweenCuts)*5)+marginBetweenCuts, j*((drawerH)+marginBetweenCuts)]) {
                drawer(drawerW, drawerH, materialThickness, fingerLength);
            }
        }
    }
}

module drawer(drawerSizex, drawerSizey, materialThickness, fingerLength, marginBetweenCuts=2, dottedMargin=materialThickness*2) {
    //bottom
    difference() {
        square([drawerSizex,drawerSizex]);    
        dotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
        translate([0,drawerSizex-materialThickness])
            dotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
        translate([materialThickness, 0])
            rotate(90)
                dotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
        translate([drawerSizex, 0])
            rotate(90)
                dotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
    }
    //right left side
    translate([drawerSizex+marginBetweenCuts, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
        }
    }

    translate([(drawerSizex+marginBetweenCuts)*2, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    dotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
        }
    }

    // front back side
    translate([(drawerSizex+marginBetweenCuts)*3, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
            translate([drawerSizex/2, drawerSizey/3+drawerSizey/3]) {
                circle(d=12);
            }
        }
    }
    translate([(drawerSizex+marginBetweenCuts)*4, 0]) {
        difference() {
            square([drawerSizex,drawerSizey]);    
            reverseDotted(drawerSizex, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
            translate([drawerSizex, 0])
                rotate(90)
                    reverseDotted(drawerSizey, materialThickness, fingerLength, dottedMargin);
        }
    }
}
