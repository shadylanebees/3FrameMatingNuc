
linear_extrude(height = 30) {
    difference() {
        // prob better to draw this with polygon ..but....
        square([13,97.05]);
        color("green") translate([3,0,0]) square(26);
        color("green") translate([3,71.05,0]) square(26);
        color("green") translate([-29.05,29,0]) square(39.05);
    }
}