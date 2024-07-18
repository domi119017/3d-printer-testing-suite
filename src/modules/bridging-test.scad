module bridge_single(length) {
	cube([bridging_test_bridge_width*extrusion_width, bridging_test_bridge_width*extrusion_width, bridging_test_tower_height*layer_height ]);
	translate([length+extrusion_width*bridging_test_bridge_width,0,0]){
		cube([bridging_test_bridge_width*extrusion_width, bridging_test_bridge_width*extrusion_width, bridging_test_tower_height*layer_height ]);
	}
	translate([0,0,bridging_test_tower_height*layer_height]){
		cube([length+bridging_test_bridge_width*extrusion_width*2, bridging_test_bridge_width*extrusion_width, bridging_test_bridge_height*layer_height ]);
	}
}

module bridging_test(){
	echo("Generating bridging test");
	for (i = [0:1:(bridging_test_end-bridging_test_start)/bridging_test_step]) {
		echo(str("Bridge ", i+1, ": length: ", bridging_test_start+ i*bridging_test_step));
		translate([0, (bridging_test_gap*extrusion_width+bridging_test_bridge_width*extrusion_width)*i, 0]) {
			bridge_single(bridging_test_start+ i*bridging_test_step);
		}
	}
}

bridging_test_size = [
	bridging_test_bridge_width*2*extrusion_width+bridging_test_end-((bridging_test_end-bridging_test_start)%bridging_test_step),
	(bridging_test_gap*extrusion_width+bridging_test_bridge_width*extrusion_width)*((bridging_test_end-bridging_test_start)/bridging_test_step)+bridging_test_bridge_width*extrusion_width,
	bridging_test_tower_height*layer_height + bridging_test_bridge_height*layer_height
];