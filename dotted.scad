module dotted(length, width, fingerLength=-1, margin=-1, laserRemoves=0) {
    fingerLength = (fingerLength==-1?width:fingerLength);
    margin = (margin==-1?fingerLength*1.2:margin);
    translate([((length-margin*2-fingerLength)%(fingerLength*2))/2+margin, 0]) {
        for(i = [0:fingerLength*2:(length-margin*2)-fingerLength]) {
            translate([i+laserRemoves,0])
                square([fingerLength-laserRemoves*2, width]);
        }
    }
}
module reverseDotted(length, width, fingerLength=-1, margin=-1, laserRemoves=0) {
    difference() {
        square([length, width]);
        dotted(length, width, fingerLength, margin, -laserRemoves);
    }
}
