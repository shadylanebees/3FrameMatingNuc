x=25;
y=159; // see the box.scad framelength echo line and subtract 2
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
// medium frame legs are: 6-5/8" or 168mm (rounded)
translate([-32,15,0]) rotate([90,0,0]) tapered_leg();
translate([-32,y-12,0]) rotate([90,0,0]) tapered_leg();


//translate([-32,6,3]) cube([32,2,137]);
//translate([-32,y-3-6,3]) cube([32,2,137]);

// comb bridge
translate([(-32/2-5),13,4]) rotate([135,0,90]) prism(y-0-14-6-8,7,12);
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
linear_extrude(height = 3, convexity = 3) polygon([[0,0],[32,0],[32,55],[27,138],[5,138],[0,55]],[[0,1,2,3,4,5]]);
}    