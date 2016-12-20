x=25;
y=159; // see the box.scad framelength echo line and subtract 2 - this is the distance between the tapered top bar ends
z=4;


frame();

module frame() {
rotate([0,0,0]) union() {
translate([-3.5,0,z]) rotate([0,180,0]) union() {
    quarter_frame(x,y,z);
    translate([x,0,0]) mirror([1,0,0]) quarter_frame(x,y,z);
    translate([0,y,0]) mirror([0,1,0]) quarter_frame(x,y,z);
    translate([0,y,0]) mirror([0,1,0]) translate([x,0,0]) mirror([1,0,0]) quarter_frame(x,y,z);
}

// legs
// medium frames are 158.8mm (rounded down)
translate([-33,18,0]) rotate([90,0,0]) tapered_leg();
translate([-33,y-15,0]) rotate([90,0,0]) tapered_leg();

// old straight legs
//translate([-32,15,3]) cube([32,2,158]);
//translate([-32,y-12,3]) cube([32,2,158]);

// comb bridge
translate([(-32/2-5),16,4]) rotate([135,0,90]) prism(y-6-14-6-8,7,12);
}
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

module tapered_leg() {
linear_extrude(height = 3, convexity = 3) polygon([[0,0],[34,0],[34,55],[26,158.8],[6,158.8],[0,55]],[[0,1,2,3,4,5]]);
}    