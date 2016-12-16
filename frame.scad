x=26;
y=129; // see the box.scad framelength echo line and subtract 2
z=4;


rotate([0,90,0]) union() {
translate([0,0,z]) rotate([0,180,0]) union() {
    quarter_frame(x,y,z);
    translate([x,0,0]) mirror([1,0,0]) quarter_frame(x,y,z);
    translate([0,y,0]) mirror([0,1,0]) quarter_frame(x,y,z);
    translate([0,y,0]) mirror([0,1,0]) translate([x,0,0]) mirror([1,0,0]) quarter_frame(x,y,z);
}

// legs
translate([-26,6,3]) cube([26,2,143.5]);
translate([-26,y-3-6,3]) cube([26,2,143.5]);

// comb bridge
translate([(-26/2-5),6,4]) rotate([135,0,90]) prism(y-0-2-3-8,7,12);
}


module quarter_frame(x,y,z) {
    difference() {
        cube([x/2,y/2,z]);
        translate([-5,2,0])  rotate([0,0,-45]) color("red") cube([10,5,6]);
        translate([0,-1,-4])  rotate([-8,0,0]) color("red") cube([x,10,5]);
    }
}

module prism(l, w, h){
       polyhedron(
               points=[[0,0,0], [l,0,0], [l,w,0], [0,w,0], [0,w,h], [l,w,h]],
               faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
               );
}
