
module stringing_tower_single() {
	polyhedron_points = [
		[0, 0, 0],
		[0, _stringing_bottom_width, 0],
		[_stringing_bottom_width, _stringing_bottom_width, 0],
		[_stringing_bottom_width, 0, 0],
		[_stringing_top_offset, _stringing_top_offset, stringing_tower_height],
		[_stringing_top_offset, _stringing_bottom_width - _stringing_top_offset, stringing_tower_height],
		[_stringing_bottom_width - _stringing_top_offset, _stringing_bottom_width - _stringing_top_offset, stringing_tower_height],
		[_stringing_bottom_width - _stringing_top_offset, _stringing_top_offset, stringing_tower_height]
	];
	polyhedron_faces = [
		[0,1,2,3],  // bottom
		[4,5,1,0],  // front
		[7,6,5,4],  // top
		[5,6,2,1],  // right
		[6,7,3,2],  // back
		[7,4,0,3] // left
	];
	polyhedron(points=polyhedron_points, faces=polyhedron_faces);
}

module stringing_test() {
	echo("Generating stringing test");
	for (i = [0:stringing_tower_count_x-1]) {
		for (j = [0:stringing_tower_count_y-1]) {
			translate([i*(stringing_tower_min_dist + _stringing_bottom_width), j*(stringing_tower_min_dist + _stringing_bottom_width), 0]) {
				stringing_tower_single();
			}
		}
	}
}

// Stringing test calculations
_stringing_top_width = extrusion_width*stringing_test_top_extrusions;
_stringing_bottom_width = extrusion_width*stringing_test_bottom_extrusions;
_stringing_top_offset = (_stringing_bottom_width - _stringing_top_width)/2;

stringing_test_size = [
	(stringing_tower_count_x-1)*(stringing_tower_min_dist + _stringing_bottom_width)+_stringing_bottom_width,
	(stringing_tower_count_y-1)*(stringing_tower_min_dist + _stringing_bottom_width)+_stringing_bottom_width,
	stringing_tower_height
];