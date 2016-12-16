// use the same width and depth as with the bee box
// this feed tray is better suited for solid foods due to
// the nature of 3D printing

width = 128.1; 
depth = 150;
height = 26;

difference() {
cube([width+18,depth,height]);
        color("blue") translate([9,9,2]) cube([width,39,height]);
        translate([0,4,0]) queen_excluder(width);
translate([9,50,2]) cube([width,(depth-18-39-2),height]);
translate([9,48,18]) cube([width,2,16]); 
}



module queen_excluder(length=128.1) { // using diameter of 4.3mm
    for(i = [10 : 8.8 : 44]) {
        translate([(length-(length-30))/2,i,0])
        hull() {
            cylinder(d=4.3,h=2);
            translate([length-12,0,0]) cylinder(d=4.3,h=2);
        }
    }
}