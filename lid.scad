// use the same width and depth as with the bee box

width = 146.575; 
depth = 179;
height = 8;

// set to 1 if you want a hole to fee with a jar, etc.
jar_hole = 0;


difference() {
    union() {
        lid_with_ribs();
        translate([(width+18+5+4)/2,(depth+5)/2,0]) cylinder(d=68,h=4);
    }
    if (jar_hole) {
        translate([(width+18+5+4)/2,(depth+5)/2,0]) cylinder(d=66,h=5);
    }
}

module lid_with_ribs() { 
   difference() {
        cube([width+18+5+4,depth+7,height]);
        translate([2.5,2.5,4]) cube([width+18+4,depth,height]);
    }
    ribs();
}

module ribs(l=179) {
    for(i = [20 : 20 : l]) {    
        translate([0,i,4]) cube([146.575+18+5+4,1,1]);
    }
}