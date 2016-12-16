/*
Open Mating Nuc, released to the Public Domain by Robert Niles
*/

$fn=100;

//translate([0,0,2.9]) {
//rim();
//}
bee_gate();

module bee_gate(){
    
    difference() {
       // gate area
       color("green") {
           cylinder(h=3, r=23);
       }
     
       // create the entrance hole
       translate([12,0,-1]) {
            rotate([0,0,0]) {
                color("blue") {
                cylinder(h=5, r=9);
               }
            }
        }
        
        // draw the vent holes
        vents();
        
        // screw hole
        translate([0,0,-1]) {
            rotate([0,0,0]) {
                color("teal") {
                cylinder(h=5, d=3.2);
               }
            }
        }
        
        // queen excluder
        translate([-5,-5,-.5]) {
            rotate([2,0,220]) {
                color("red") {
                    hull() {
                        cylinder(d=4.3,d=4.3,4);
                        translate([12,0,0]) {
                            cylinder(d=4.3,d=4.3,4);
                        }
                    }
                }
            }
        }
     
  
             
    } // end difference
    
    // handles
    translate([1,3,2]) {   
        rotate([0,0,90]) {
            color("blue") {
                cube([19,2,2]);
            }
        }
    }
    translate([-1,-3,2]) {
        rotate([0,0,270]) {
            color("blue") {
                cube([19,2,2]);
            }
        }
    }
}
     
// vents
module vents() {   
    for (a =[7:3:13]) {
        translate([-a,3,0]) vent_hole();
    }

    for (a =[4:3:16]) {
        translate([-a,6,0]) vent_hole();
    }
    
    for (a =[4:3:16]) {
        translate([-a,9,0]) vent_hole();
    }
    
    for (a =[4:3:16]) {
        translate([-a,12,0]) vent_hole();
    }
    
    for (a =[7:3:13]) {
        translate([-a,15,0]) vent_hole();
    }
}

module vent_hole() {
    color("pink") cylinder(h=5, r=1.25);   
}

// I'm not sure I see a need for this...
module rim() {
    difference() {
       // gate area
       color("violet") {
           cylinder(h=1, r=23);
       }
       translate([0,0,0]) {
      color("blue") {
          cylinder(h=1, r=22);
      }
  }
}

}

