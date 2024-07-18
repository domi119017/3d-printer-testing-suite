module accuracy_cube(size, text_depth) {
	render()
	difference(){
		cube([size, size, size]);
		union(){
			rotate([90,0,0])
			translate([size/2,size/2,0])
			linear_extrude(height=text_depth*layer_height*2,center=true){
				text("-Y", size=(size/2), font="Liberation Mono:style=Regular", halign="center", valign="center");
			}
			translate([size/2,size,size/2])
			rotate([-90,0,0])
			rotate([0,0,180])
			linear_extrude(height=text_depth*layer_height*2,center=true){
				text("+Y", size=(size/2), font="Liberation Mono:style=Regular", halign="center", valign="center");
			}
			rotate([0,-90,0])
			translate([size/2,size/2,0])
			linear_extrude(height=text_depth*layer_height*2,center=true){
				rotate([0,0,-90])
				text("-X", size=(size/2), font="Liberation Mono:style=Regular", halign="center", valign="center");
			}
			translate([size,size/2,size/2])
			rotate([0,90,0])
			linear_extrude(height=text_depth*layer_height*2,center=true){
				rotate([0,0,90])
				text("+X", size=(size/2), font="Liberation Mono:style=Regular", halign="center", valign="center");
			}
			translate([size/2,size/2,0])
			linear_extrude(height=text_depth*layer_height*2,center=true){
				text("-Z", size=(size/2), font="Liberation Mono:style=Regular", halign="center", valign="center");
			}
			translate([size/2,size/2,size])
			linear_extrude(height=text_depth*layer_height*2,center=true){
				text("+Z", size=(size/2), font="Liberation Mono:style=Regular", halign="center", valign="center");
			}

		}
	}
}

module accuracy_cylinder(size, text_depth) {
	render()
	difference(){
		translate([size/2,size/2,size/2])
		cylinder(h=size, r=size/2, center=true);
		translate([size/2,size/2,size])
		linear_extrude(height=text_depth*layer_height*2, center=true)
		text(str(size), size=(size/2)*0.75, font="Liberation Mono:style=Regular", halign="center", valign="center");
	}
}

module accuracy_test(){
	if (dimensional_accuracy_test_mode == "cube" || dimensional_accuracy_test_mode == "both") {
		for (i = [0:1:(dimensional_accuracy_test_end-dimensional_accuracy_test_start)/dimensional_accuracy_test_step]) {
			current_size = dimensional_accuracy_test_start+i*dimensional_accuracy_test_step;
			translate([i==0?0:gaussian_sum_with_step(dimensional_accuracy_test_start,i*dimensional_accuracy_test_step,dimensional_accuracy_test_step)+test_padding*extrusion_width*i,0,0]){
				accuracy_cube(current_size, dimensional_accuracy_test_text_depth);
				echo(str("Cube ", i+1, ": size: ", current_size));
				if (dimensional_accuracy_test_mode == "both") {
					translate([0,current_size+test_padding*extrusion_width,0])
					accuracy_cylinder(current_size, dimensional_accuracy_test_text_depth);
					echo(str("Cylinder ", i+1, ": size: ", current_size));
				}
			}
		}
	}
	if (dimensional_accuracy_test_mode == "cylinder") {
		for (i = [0:1:(dimensional_accuracy_test_end-dimensional_accuracy_test_start)/dimensional_accuracy_test_step]) {
			current_size = dimensional_accuracy_test_start+i*dimensional_accuracy_test_step;
			translate([i==0?0:gaussian_sum_with_step(dimensional_accuracy_test_start,i*dimensional_accuracy_test_step,dimensional_accuracy_test_step)+test_padding*extrusion_width*i,0,0]){
				accuracy_cylinder(current_size, dimensional_accuracy_test_text_depth);
				echo(str("Cylinder ", i+1, ": size: ", current_size));
			}
		}
	}
}


// Accuracy
_dim_mult = dimensional_accuracy_test_mode == "both" ? 1 : 0;
accuracy_test_size = [
	gaussian_sum_with_step(dimensional_accuracy_test_start,dimensional_accuracy_test_end,dimensional_accuracy_test_step)+test_padding*extrusion_width*(dimensional_accuracy_test_end-dimensional_accuracy_test_start)/dimensional_accuracy_test_step,
	dimensional_accuracy_test_end+(dimensional_accuracy_test_end+test_padding*extrusion_width)*_dim_mult,
	dimensional_accuracy_test_end
];