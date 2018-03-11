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
