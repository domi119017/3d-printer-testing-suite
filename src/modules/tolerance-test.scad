module tolerance_single_round(diameter, tolerance) {
	translate([
		(diameter+tolerance_test_gap*extrusion_width*2+tolerance_test_end)/2,
		(diameter+tolerance_test_gap*extrusion_width*2+tolerance_test_end)/2, 
		tolerance_test_height*layer_height/2
	])
	difference(){
		cube([diameter+tolerance_test_end+tolerance_test_gap*2*extrusion_width, 
		diameter+tolerance_test_end+tolerance_test_gap*2*extrusion_width, 
		tolerance_test_height*layer_height], 
		center = true);
		cylinder(h=tolerance_test_height*layer_height+slice_gap_closing_radius, 
		r=diameter/2+tolerance, 
		center=true);
	}
}

module tolerance_single_square(size, tolerance) {
	translate([
		(size+tolerance_test_gap*extrusion_width*2+tolerance_test_end)/2,
		(size+tolerance_test_gap*extrusion_width*2+tolerance_test_end)/2, 
		tolerance_test_height*layer_height/2
	])
	difference(){
		cube([size+tolerance_test_end+tolerance_test_gap*2*extrusion_width, 
		size+tolerance_test_end+tolerance_test_gap*2*extrusion_width, 
		tolerance_test_height*layer_height], 
		center = true);
		cube([size+tolerance*2, size+tolerance*2, tolerance_test_height*layer_height+slice_gap_closing_radius], 
		center=true);
	}
}

module tolerance_test() {
	echo("Generating tolerance test");
	if(tolerance_test_mode == "cylinder" || tolerance_test_mode == "both") {
		for (i = [0:1:(tolerance_test_end-tolerance_test_start)/tolerance_test_step]) {
			echo(str("Hole ", i+1, ": ", tolerance_test_start+i*2*tolerance_test_step+tolerance_test_diameter));
			translate([(tolerance_test_diameter+tolerance_test_end+tolerance_test_gap*2*extrusion_width)*i,0,0]){
				tolerance_single_round(tolerance_test_diameter, i*tolerance_test_step+tolerance_test_start);
				if (tolerance_test_mode == "both") {
					translate([0,tolerance_test_diameter+tolerance_test_gap*extrusion_width*2+tolerance_test_end,0]){
						tolerance_single_square(tolerance_test_diameter, i*tolerance_test_step+tolerance_test_start);
					}
				}
			}
		}

		translate([
			(tolerance_test_diameter+tolerance_test_end+tolerance_test_gap*2*extrusion_width)*(tolerance_test_end-tolerance_test_start+tolerance_test_step)/tolerance_test_step+tolerance_test_gap*extrusion_width,
			0,
			-test_bottom_layers*layer_height
		]){
			translate([
				(tolerance_test_diameter+tolerance_test_end)/2+tolerance_test_gap*extrusion_width,
				(tolerance_test_diameter+tolerance_test_gap*extrusion_width*2+tolerance_test_end)/2, 
				tolerance_test_height*layer_height
			]){
				echo(str("Tolerance test peg: ", tolerance_test_diameter));
				cylinder(h=tolerance_test_height*layer_height*2, 
			r=tolerance_test_diameter/2, 
			center=true);
				if (tolerance_test_mode == "both") {
					translate([
						0,
						tolerance_test_diameter+tolerance_test_gap*extrusion_width*2+tolerance_test_end,
						0
					])
					minkowski() {
						cube([
							tolerance_test_diameter-4,
							tolerance_test_diameter-4,
							tolerance_test_height*layer_height*2/2
							], center=true);
						cylinder(h=tolerance_test_height*layer_height*2/2, r=2,center=true);
					}
				}
			}
		}
	}
	if(tolerance_test_mode == "cube") {
		for (i = [0:1:(tolerance_test_end-tolerance_test_start)/tolerance_test_step]) {
			echo(str("Hole ", i+1, ": ", tolerance_test_start+i*tolerance_test_step+tolerance_test_diameter));
			translate([(tolerance_test_diameter+tolerance_test_end+tolerance_test_gap*2*extrusion_width)*i,0,0]){
				tolerance_single_square(tolerance_test_diameter, i*tolerance_test_step+tolerance_test_start);
				
			}
		}

		translate([
			(tolerance_test_diameter+tolerance_test_end+tolerance_test_gap*2*extrusion_width)*(tolerance_test_end-tolerance_test_start+tolerance_test_step)/tolerance_test_step+tolerance_test_gap*extrusion_width,
			0,
			-test_bottom_layers*layer_height
		]){
			translate([
				(tolerance_test_diameter+tolerance_test_end)/2+tolerance_test_gap*extrusion_width,
				(tolerance_test_diameter+tolerance_test_gap*extrusion_width*2+tolerance_test_end)/2, 
				tolerance_test_height*layer_height
			]){
				echo(str("Tolerance test peg: ", tolerance_test_diameter));
				minkowski() {
					cube([
						tolerance_test_diameter-4,
						tolerance_test_diameter-4,
						tolerance_test_height*layer_height*2/2
						], center=true);
					cylinder(h=tolerance_test_height*layer_height*2/2, r=2,center=true);
				}
			}
		}
	}
}

// Tolerance
_tol_size_mult = tolerance_test_mode == "both" ? 2 : 1;

tolerance_test_size = [
	(tolerance_test_end+tolerance_test_diameter+tolerance_test_gap*2*extrusion_width)*((tolerance_test_end-tolerance_test_start)/tolerance_test_step+2),
	(tolerance_test_end+tolerance_test_diameter+tolerance_test_gap*2*extrusion_width)*_tol_size_mult,
	tolerance_test_height*layer_height
];
