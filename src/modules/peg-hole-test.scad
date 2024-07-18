module peg_single(size, height=peg_hole_test_height*layer_height) {
	if (size < slice_gap_closing_radius) {
		echo(str("Peg size too small, setting radius to slice_gap_closing_radius: ", slice_gap_closing_radius));
		cylinder(h=height, r=slice_gap_closing_radius);
	}
	else {
		cylinder(h=height, r=size);
	}
}

module peg_hole_test() {
	echo("Generating peg hole test");
	translate([(peg_hole_test_max_mult*extrusion_width+peg_hole_test_min_dist*extrusion_width),(peg_hole_test_max_mult*extrusion_width),0]){
		for (i = [0:peg_hole_test_step_mult:peg_hole_test_max_mult-peg_hole_test_min_mult]) {
			echo(str("Peg ", i+1, ": size: ", (i+peg_hole_test_min_mult)*extrusion_width));
			translate([_peg_offset*i/peg_hole_test_step_mult*2, 0, 0]) {
				peg_single((i+peg_hole_test_min_mult)*extrusion_width);
			}
		}
		translate([0, (peg_hole_test_max_mult)*extrusion_width*2+(peg_hole_test_min_dist*extrusion_width)*2, 0]){
			difference(){
				translate([
					-(peg_hole_test_max_mult*extrusion_width+peg_hole_test_min_dist*extrusion_width),
					-(peg_hole_test_max_mult*extrusion_width+peg_hole_test_min_dist*extrusion_width),
					0
					]){
					cube([
						_peg_offset*(peg_hole_test_max_mult-peg_hole_test_min_mult+peg_hole_test_step_mult-((peg_hole_test_max_mult-peg_hole_test_min_mult)%peg_hole_test_step_mult))/peg_hole_test_step_mult*2,
						(peg_hole_test_max_mult*extrusion_width+peg_hole_test_min_dist*extrusion_width)*2,
						peg_hole_test_height*layer_height-slice_gap_closing_radius
						]);
				}
				for (i = [0:peg_hole_test_step_mult:peg_hole_test_max_mult-peg_hole_test_min_mult]) {
					echo(str("Hole ", i+1, ": size: ", (peg_hole_test_max_mult-i)*extrusion_width));
					translate([
						_peg_offset*i/peg_hole_test_step_mult*2, 
						0, 
						-0.5
						]) {
						peg_single((peg_hole_test_max_mult-i)*extrusion_width, peg_hole_test_height*layer_height+1);
					}
				}
			}
		}
	}
}


// Peg & hole test calculations
_peg_offset = extrusion_width*peg_hole_test_max_mult + peg_hole_test_min_dist*extrusion_width;

peg_hole_test_size = [
	_peg_offset*(peg_hole_test_max_mult-peg_hole_test_min_mult+peg_hole_test_step_mult-((peg_hole_test_max_mult-peg_hole_test_min_mult)%peg_hole_test_step_mult))/peg_hole_test_step_mult*2,
	(peg_hole_test_max_mult*extrusion_width+peg_hole_test_min_dist*extrusion_width)*2*2-peg_hole_test_min_dist*extrusion_width,
	peg_hole_test_height*layer_height
];
