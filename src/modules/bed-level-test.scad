module bed_level_test(){
	do_spots = bed_level_test_mode == "spot" || bed_level_test_mode == "both";
	do_lines = bed_level_test_mode == "line" || bed_level_test_mode == "both";
	linewidth = bed_level_line_width*extrusion_width;
	divs = bed_level_divisions-1;
	spot_spacing = [
		(bed_size_x-bed_level_padding*2-bed_level_spot_size[0])/divs,
		(bed_size_y-bed_level_padding*2-bed_level_spot_size[1])/divs
	];
	line_length = do_spots ? [
		bed_size_x-bed_level_padding*2-bed_level_spot_size[0],
		bed_size_y-bed_level_padding*2-bed_level_spot_size[1]
	] : [
		bed_size_x-bed_level_padding*2,
		bed_size_y-bed_level_padding*2
	];
	union() {
		if (do_spots) {
			for (x=[0:divs]){
				for (y=[0:divs]){
					translate([
						spot_spacing[0]*(x-(floor(divs/2))),
						spot_spacing[1]*(y-(floor(divs/2))),
						0
					]){
						cube([bed_level_spot_size[0],bed_level_spot_size[1],layer_height],center=true);
					}
				}
			}
		}
		if (do_lines) {
			for (i=[0:divs]){
				translate([
					0,
					do_spots ? spot_spacing[1]*(i-(floor(divs/2))) : (spot_spacing[1]+(bed_level_spot_size[1]-bed_level_line_width*extrusion_width)/2)*(i-(floor(divs/2))) ,
					0
				]){
					cube([line_length[0],linewidth,layer_height], center=true);
				} 
			}
			for (i=[0:divs]){
				translate([
					do_spots ? spot_spacing[0]*(i-(floor(divs/2))) : (spot_spacing[0]+(bed_level_spot_size[0]-bed_level_line_width*extrusion_width)/2)*(i-(floor(divs/2))),
					0,
					0
				]){
					cube([linewidth,line_length[1],layer_height], center=true);
				} 
			}
		}
	}
}