use<dotted.scad>

module shelfBackplate(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, dottedMargin) {
    width = (drawerW+materialThickness)*drawersW+materialThickness;
    height = (drawerH+materialThickness)*drawersH+materialThickness;
    difference() {
        square([width, height]); // bottom
        // fingers for sidewalls
        dotted(width, materialThickness, fingerLength, dottedMargin);
        translate([0, height-materialThickness]) 
            dotted(width, materialThickness, fingerLength, dottedMargin);
        translate([materialThickness, 0]) {
            rotate(90) {
                dotted(height, materialThickness, fingerLength, dottedMargin);
                translate([0, -width+materialThickness])
                    dotted(height, materialThickness, fingerLength, dottedMargin);
            }
        }
        // inside walls
        for(i = [materialThickness:drawerW+materialThickness:width]) {
            translate([i, 0])
                rotate(90)
                    dotted(height, materialThickness, fingerLength, dottedMargin);
        }
        for(i = [0:drawerH+materialThickness:height]) {
            translate([0, i])
                dotted(width, materialThickness, fingerLength, dottedMargin);
        }
    }
}

module shelfOuterWalls(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts, dottedMargin) {
    width = (drawerW+materialThickness)*drawersW+materialThickness;
    height = (drawerH+materialThickness)*drawersH+materialThickness;
    translate([0, (drawerD+marginBetweenCuts)*2]) {
        difference() {
            square([height,drawerD]);
            reverseDotted(height, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
                    translate([0, -height+materialThickness])
                        reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
            // Slots for Horizontal walls
            for(j=[1:drawersH-1]) {
                translate([j*(drawerH+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
        }
    }
    translate([0, (drawerD+marginBetweenCuts)*3]) {
        difference() {
            square([height,drawerD]);
            reverseDotted(height, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
                    translate([0, -height+materialThickness])
                        reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
            // Slots for Horizontal walls
            for(j=[1:drawersH-1]) {
                translate([j*(drawerH+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
        }
    }
    translate([0, (drawerD+marginBetweenCuts)*0]) {
        difference() {
            square([width,drawerD]);
            reverseDotted(width, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                    translate([0, -width+materialThickness])
                        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
            // Slots for Vertical walls
            for(j=[1:drawersW-1]) {
                translate([j*(drawerW+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
        }
    }
    translate([0, (drawerD+marginBetweenCuts)*1]) {
        difference() {
            square([width,drawerD]);
            reverseDotted(width, materialThickness, fingerLength, dottedMargin);
            translate([materialThickness, 0]) {
                rotate(90) {
                    dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                    translate([0, -width+materialThickness])
                        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
            // Slots for Vertical walls
            for(j=[1:drawersW-1]) {
                translate([j*(drawerW+materialThickness)+materialThickness, 0]) {
                    rotate(90)
                        dotted(drawerD, materialThickness, fingerLength, dottedMargin);
                }
            }
        }
    }
}

module shelfVerticalWalls(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts, dottedMargin) {
    width = (drawerW+materialThickness)*drawersW+materialThickness;
    height = (drawerH+materialThickness)*drawersH+materialThickness;
    translate([0, height]) {
        rotate(-90) {
            for(i=[0:drawersW-2]) {
                translate([0,i*(drawerD+marginBetweenCuts)]) {
                    difference() {
                        square([height,drawerD]);
                        reverseDotted(height, materialThickness, fingerLength, dottedMargin);
                        translate([materialThickness, 0]) {
                            rotate(90) {
                                reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
                                translate([0, -height+materialThickness])
                                    reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
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

module shelfHorizontalWalls(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts, dottedMargin, splitUp=1) {
    width = ((drawerW+materialThickness)*drawersW)+materialThickness;
    for(j=[1:splitUp]) {
        translate([marginBetweenCuts*(j-1), ((-(((drawersH-2)/splitUp)*(j-1)))*(drawerD+marginBetweenCuts))]) {
            for(i=[(((drawersH-2)/splitUp)*(j-1)):(((drawersH-1)/splitUp)*j)-1]) {
                translate([(j-1)*width, i*(drawerD+marginBetweenCuts)]) {
                    difference() {
                        square([width,drawerD]);
                        reverseDotted(width, materialThickness, fingerLength, dottedMargin);
                        translate([materialThickness, 0]) {
                            rotate(90) {
                                reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
                                translate([0, -width+materialThickness])
                                    reverseDotted(drawerD, materialThickness, fingerLength, dottedMargin);
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

module shelfDrawers(materialThickness, fingerLength, drawerW, drawerH, drawerD, drawersW, drawersH, marginBetweenCuts, dottedMargin) {
    for(i=[0:drawersW-1]) {
        for(j=[0:drawersH-1]) {
            translate([i*(drawerD*3+drawerW*2+marginBetweenCuts*5)+marginBetweenCuts, j*(max(drawerH, drawerW)+marginBetweenCuts)]) {
                drawer(drawerW, drawerH, drawerD, materialThickness, fingerLength, marginBetweenCuts, dottedMargin);
            }
        }
    }
}

module drawer(drawerW, drawerH, drawerD, materialThickness, fingerLength, marginBetweenCuts, dottedMargin) {
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
            translate([drawerW/2, drawerH-14]) {
                circle(d=14);
            }
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
