module support_test(size){
	union(){
		difference(){
			union() {
				cube([size,size,support_cube_height/2]);
				translate([0,0,support_cube_height/2])
				cube([size,size,support_cube_height/2]);
			}
			translate([size/2,size/2,-slice_gap_closing_radius/2]){
				cylinder(r=size/6,h=support_cube_height/2+slice_gap_closing_radius);
				cylinder(r=size/3,h=support_cube_height/4+slice_gap_closing_radius);
			}
			translate([-slice_gap_closing_radius/2,-slice_gap_closing_radius/2,support_cube_height/2])
			cube([size+slice_gap_closing_radius,size*2/3+slice_gap_closing_radius,support_cube_height/4]);
		}
	}
}

support_test_size = [
	support_cube_size,
	support_cube_size,
	support_cube_height
];