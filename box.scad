/*
Open 4 Frame Mating Nuc, 
released to the Public Domain by Robert Niles
*/
//frame top bar width: 161mm

// these sizes are the best
// doesn't include each 9mm side
// the width allows the use of three frames which can be
// spanned together equaling one full standard langstroth frame
// so you can start them in a regular hive and/or move them
// from the nuc to a regular hive when finished.

width = 146.575; 
// set depth back to 150
depth = 150;
framelength = depth-19;
echo(framelength=framelength);
height = 160;

// front wall
difference() {
fb_wall(width,height);
translate([(width/2)-25,0,8]) entrance_area();    
}    
// back wall
translate([width,depth,0]) rotate([180,180,0]) fb_wall(width,height);

// side 1
color("green") translate([-9,0,0]) cube([9,depth,height]);


// side 2
color("green") translate([width,0,0]) cube([9,depth,height]);


//bottom
cube([width,depth,9]);





module fb_wall(w=128.1,h=185){  
    difference() {
        // basic side
        cube([w,18,h]);
        
        // frame ledge
        translate([w,9,h-8]) rotate([0,0,90]) cube([9.525,w,16.1]);

        // frame divvets
        translate([5,9,h-10]) cube([27,9.525,14]);
        translate([5+27+9.525,9,h-10]) cube([27,9.525,14]);
        translate([5+27+9.525+27+9.525,9,h-10]) cube([27,9.525,14]);
        translate([5+27+9.525+27+9.525+27+9.525,9,h-10]) cube([27,9.525,14]);   
    }
}


module entrance_area() {
        $fn=60;
        // create the entrance hole
        translate([27,20,19]) {
            rotate([90,0,0]) {
                color("green") {
                cylinder(h=21, r=10);
               }
            }
        }
        

        translate([27,35,25]) {
            rotate([90,0,0]) {
                color("blue") {
                cylinder(h=21, r=17);
               }
            }
        }
        
            
        // gate area
        translate([27,5,32]) {
            rotate([90,0,0]) {
                color("green") {
                cylinder(h=6, r=25);
               }
            }
        }
        
        // gate area screw hole
        translate([27,9,32]) {
            rotate([90,0,0]) {
                color("red") {
                cylinder(h=10, r=1.5);
               }
            }
        }        
}
