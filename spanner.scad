
linear_extrude(height = 12) {
    difference() {
        // prob better to draw this with polygon ..but....
        square([11,97.05]);
        color("green") translate([3,0,0]) square(26);
        color("green") translate([3,71.05,0]) square(26);
        color("green") translate([-32.05,29,0]) square(39.05);
    }
}