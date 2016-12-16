// use the same width and depth as with the bee box

width = 146.575; 
depth = 150;
height = 8;

difference() {
cube([width+18+5,depth+5,height]);
color("green") translate([2.5,2.5,2]) cube([width+18,depth,height]);
}
