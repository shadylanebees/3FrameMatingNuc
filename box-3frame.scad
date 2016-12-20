/*
Open 4 Frame Mating Nuc, 3 frame version
released to the Public Domain by Robert Niles
*/


// these sizes are the best
// doesn't include each 9mm side
// the width allows the use of three frames which can be
// spanned together equaling one full standard langstroth frame
// so you can start them in a regular hive and/or move them
// from the nuc to a regular hive when finished.

width = 110.05; // x axis 
depth = 179; // y axis
framelength = depth-18; // y axis: minus 9mm from each side
echo(framelength=framelength);
height = 185.8; // z axis : 158.8 frame height + 9mm above + 9mm below + the 9mm bottom

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


module fb_wall(w=146.575,h=185.8){  
    difference() {
        // basic side
        cube([w,18,h]);
        
        // frame ledge
        translate([w,9,h-11]) rotate([0,0,90]) cube([9.525,w,16.1]);

        // frame grooves
        translate([5,9,h-13]) cube([27,9.525,14]);
        translate([5+27+9.525,9,h-13]) cube([27,9.525,14]);
        translate([5+27+9.525+27+9.525,9,h-13]) cube([27,9.525,14]);
        //translate([5+27+9.525+27+9.525+27+9.525,9,h-13]) cube([27,9.525,14]);   
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
                cylinder(h=21, r=22);
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
