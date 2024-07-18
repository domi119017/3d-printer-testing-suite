module overhang_single(angle) {
	polyhedron_points = [
		[1, 0, 0], // 0
		[1, overhang_test_length, 0], // 1
		[0, overhang_test_length, 0], // 2
		[0, 0, 0], // 3
		[1+tan(angle)*(overhang_test_height*layer_height), 0, (overhang_test_height*layer_height)], // 04
		[1+tan(angle)*(overhang_test_height*layer_height), overhang_test_length, (overhang_test_height*layer_height)], // 5
		[0, overhang_test_length, (overhang_test_height*layer_height)], // 6
		[0, 0, (overhang_test_height*layer_height)], // 7
	];
	polyhedron_faces = [
		[0,1,2,3],  // bottom
		[4,5,1,0],  // front
		[7,6,5,4],  // top
		[5,6,2,1],  // right
		[6,7,3,2],  // back
		[7,4,0,3] // left
	];
	union(){
		polyhedron(points=polyhedron_points, faces=polyhedron_faces);
		translate([0,0,(overhang_test_height*layer_height)])
		cube([
			1+tan(angle)*(overhang_test_height*layer_height), 
			overhang_test_length, 
			(overhang_test_extra_layers*layer_height)]);
	}
}

module overhang_test() {
	echo("Generating overhang test");
	for (i = [0:1:(overhang_test_end_angle-overhang_test_start_angle)/overhang_test_angle_step]) {
		translate([0, 0, (overhang_test_height*layer_height+(overhang_test_extra_layers*layer_height))*i]) {
			echo(str("Overhang ", i+1, ": angle: ", overhang_test_end_angle - i*overhang_test_angle_step));
			overhang_single(overhang_test_end_angle - i*overhang_test_angle_step);
		}
	}
}

overhang_test_size = [
	1+tan(max(overhang_test_start_angle, overhang_test_end_angle))*(overhang_test_height*layer_height),
	overhang_test_length,
	(overhang_test_height*layer_height)*((overhang_test_end_angle-overhang_test_start_angle)/overhang_test_angle_step+1)+overhang_test_extra_layers*layer_height*((overhang_test_end_angle-overhang_test_start_angle)/overhang_test_angle_step+1)
];