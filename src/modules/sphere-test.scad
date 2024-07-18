module sphere_test_bowl(size) {
	echo(str("Generating bowl, size: ", size));
	difference(){
		difference(){
			sphere(size/2);
			translate([0,0,-size/2]){
				cube([size, size, size], center=true);
			}
		}
		translate([0,0,size/1.5]){
			sphere(size/2);
		}
	}
}

module sphere_test_sphere(size) {
	echo(str("Generating sphere, size: ", size));
	difference(){
		sphere(size/2);
		translate([0,0,-size/2]){
			cube([size, size, size], center=true);
		}
	}
}

module sphere_test() {
	translate([0,sphere_test_end/2,0])
	for (i = [0:1:(sphere_test_end-sphere_test_start)/sphere_test_step]) {
		current_diameter = sphere_test_start+i*sphere_test_step;
		translate_x=gaussian_sum_with_step(sphere_test_start,sphere_test_start+i*sphere_test_step,sphere_test_step)+sphere_test_gap*i*extrusion_width;

		translate([
			translate_x-sphere_test_start/2,
			0, 
			0
		]) {
			if (sphere_test_mode == "bowl") {
				sphere_test_bowl(current_diameter);
			}
			if (sphere_test_mode == "sphere") {
				sphere_test_sphere(current_diameter);
			}
			if (sphere_test_mode == "both") {
				sphere_test_bowl(current_diameter);
				translate([0,sphere_test_end+sphere_test_gap*extrusion_width*2,0]){
					sphere_test_sphere(current_diameter);
				}
			}
		}
	}
}

// Sphere
_sphere_size_mult = sphere_test_mode == "both" ? 2 : 1;
_sphere_gap = sphere_test_mode == "both" ? sphere_test_gap*extrusion_width*2 : 0;

sphere_test_size = [
	gaussian_sum_with_step(sphere_test_start,sphere_test_end,sphere_test_step)
		+sphere_test_end/2
		-sphere_test_gap*extrusion_width*2
		+sphere_test_gap*(sphere_test_end-sphere_test_start)/sphere_test_step*extrusion_width,
	sphere_test_end*_sphere_size_mult+_sphere_gap,
	sphere_test_end/2
];
