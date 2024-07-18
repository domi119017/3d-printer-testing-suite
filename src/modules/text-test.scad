module text_test_single(size, debug = false) {
	text_width = size*len(str(size, ": ",ts_string))*ts_adv_width_scaling;
	if (debug){
		%cube([text_width, size*ts_adv_height_scaling, ts_depth*layer_height], center=true);
		color(color_scheme[7%len(color_scheme)]) linear_extrude(height=layer_height)
		text(str(size, ": ",ts_string), size=size, font=ts_adv_font, halign="center", valign="center");
	}
	else {
		text(str(size, ": ",ts_string), size=size, font=ts_adv_font, halign="center", valign="center");
	}
}

module text_test() {
	echo("Generating text test");
	text_max_width = ts_end*len(str(ts_end, ": ",ts_string))*ts_adv_width_scaling;
	difference() {
		cube([text_max_width, text_height_sum, ts_depth*layer_height+slice_gap_closing_radius]);
		union(){
			for (i = [0:1:(ts_end-ts_start)/ts_step]) {
				current_size = ts_start+i*ts_step;
				echo(str("Text size ", i+1, ": size: ", current_size));
				text_width = current_size*len(str(current_size, ": ",ts_string))*ts_adv_width_scaling;
				/* 
				* I legit have no clue how this works or if gaussian sum is applicable here 
				* but it does work so don't touch it
				* Also: this breaks if you use the gaussian sum without factor
				* even though the factor is 1 so... something weird is going on
				*/
				translate_y = gauss_with_step_and_factor(ts_start,ts_start+i*ts_step,ts_step,1)*ts_adv_height_scaling*ts_step-ts_adv_height_scaling*i*ts_step;
				echo(str("Translate y: ", translate_y));
				translate([0,
					translate_y+ts_min_dist*i*extrusion_width,
				0]){
					// Move to +x+y quadrant
					translate([
						text_width/2,
						(current_size*ts_adv_height_scaling)/2,
						// workaround for preview glitching
						ts_depth*layer_height-slice_gap_closing_radius/2
					]){
						linear_extrude(height=ts_depth*layer_height*2, center=true){
							text_test_single(current_size);
						}
					}
				}
			}
		}
	}
}


// Text
text_height_sum = gauss_with_step_and_factor(ts_start,ts_end,ts_step,1)*ts_adv_height_scaling*ts_step-ts_adv_height_scaling*((ts_end-ts_start)/ts_step)*ts_step +ts_end*ts_adv_height_scaling+ts_min_dist*((ts_end-ts_start)/ts_step)*extrusion_width;

text_test_size = [
	ts_end*len(str(ts_end, ": ",ts_string))*ts_adv_width_scaling,
	text_height_sum,
	ts_depth*layer_height
];

