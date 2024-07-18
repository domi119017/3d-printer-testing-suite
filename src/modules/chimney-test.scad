// /* [Chimney test settings] */
// // Chimney base height (layers)
// chimney_base_height = 10; // 1
// // Chimney top height (layers)
// chimney_top_height = 5; // 1
// // Chimney base wall thickness (extrusions)
// chimney_base_wall_thickness = 4; // 1
// // Chimney top extra thickness (extrusions)
// chimney_top_extra_thickness = 2; // 1
// // Chimney hole start diameter (mm)
// chimney_hole_start_diameter = 3; // 1
// // Chimney hole end diameter (mm)
// chimney_hole_end_diameter = 12; // 1
// // Chimney hole diameter step (mm)
// chimney_hole_diameter_step = 3; // 1


module chimney_single(diameter) {
	difference(){
		union(){
			cylinder(h=chimney_base_height*layer_height, d=diameter+chimney_base_wall_thickness*extrusion_width*2);
			translate([0,0,chimney_base_height*layer_height]){
				cylinder(h=chimney_top_height*layer_height, d=diameter+(chimney_top_extra_thickness+chimney_base_wall_thickness)*extrusion_width*2);
			}
		}
		translate([0,0,-slice_gap_closing_radius/2])
		cylinder(h=(chimney_top_height+chimney_base_height)*layer_height+slice_gap_closing_radius, d=diameter);
	}
}

module chimney_test(){
	translate([
		(chimney_hole_start_diameter+(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2)/2,
		(chimney_hole_end_diameter+(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2)/2,
		0
	])
	for (i= [0:1:(chimney_hole_end_diameter-chimney_hole_start_diameter)/chimney_hole_diameter_step]){
		translate([
			gaussian_sum_with_step(chimney_hole_start_diameter+chimney_hole_diameter_step, chimney_hole_start_diameter+chimney_hole_diameter_step*i, chimney_hole_diameter_step)
				-(chimney_hole_start_diameter/2)*i
				+i*(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2
				+test_padding*extrusion_width*i
			,0,
			0
		]){
			chimney_single(chimney_hole_start_diameter+chimney_hole_diameter_step*i);
		}
	}
}

_i = (chimney_hole_end_diameter-chimney_hole_start_diameter)/chimney_hole_diameter_step;

_chimney_size_x = (chimney_hole_start_diameter+(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2)/2
	+ gaussian_sum_with_step(chimney_hole_start_diameter+chimney_hole_diameter_step, chimney_hole_start_diameter+chimney_hole_diameter_step*_i, chimney_hole_diameter_step)
				-(chimney_hole_start_diameter/2)*_i
				+_i*(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2
				+test_padding*extrusion_width*_i;

chimney_test_size = [
	_chimney_size_x+(chimney_hole_end_diameter+(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2)/2,
	chimney_hole_end_diameter+(chimney_base_wall_thickness+chimney_top_extra_thickness)*extrusion_width*2,
	1
];