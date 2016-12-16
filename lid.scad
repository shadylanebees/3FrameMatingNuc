// use the same width and depth as with the bee box

width = 128.1; 
depth = 150;
height = 6;

difference() {
cube([width+24,depth+4,height]);
translate([2,0,2]) cube([width+20,depth+4,height]);
}