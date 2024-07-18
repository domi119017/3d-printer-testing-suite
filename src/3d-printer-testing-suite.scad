/* [Slicer settings] */
// Layer height (mm)
layer_height = 0.2; // 0.01
// Extrusion width (mm)
extrusion_width = 0.42; // 0.01
// Slice gap closing radius (mm)
slice_gap_closing_radius = 0.049; // 0.001

/* [General settings] */
// Number of bottom layers
test_bottom_layers = 3; // 1
// Test padding (extrusions)
test_padding = 6; // 1
// Arc segments (higher = smoother curves)
detail_level=64; // 5
// Preview mode (Reduces arc segments to 16 for faster rendering. TURN OFF BEFORE EXPORTING)
preview_mode = false;
// Test type
test_type = "common"; // [common, stringing, overhang, peg_hole, bridging, tolerance, sphere, accuracy, text, chimney, bed_level]
// Color scheme, see en.wikibooks.org/wiki/OpenSCAD_User_Manual/Transformations#color for available colors
color_scheme = ["red", "green", "blue", "cyan", "magenta", "yellow", "darkorange", "lime", "steelblue"];

/* [Packing settings] */
// Enable object packing (Useful if you only want to run some of the tests, overwrites any other selection in general.)
pack_objects = false;
// Object rotation (useful if objects are not getting densely packed)
pack_rotation = 0; // [0, 1, 2, 3]
// Sorting method for packing
pack_sorting = "ascending"; // [ascending, descending, off]
// Enable stringing
pack_stringing = true;
// Enable overhang
pack_overhang = true;
// Enable peg hole
pack_peg_hole = true;
// Enable bridging
pack_bridging = true;
// Enable tolerance
pack_tolerance = true;
// Enable sphere
pack_sphere = true;
// Enable dimensional accuracy
pack_accuracy = true;
// Enable text size 
pack_text = true;
// Enable chimney
pack_chimney = true;

/* [Stringing test settings] */
// Number of towers in X
stringing_tower_count_x = 3; // 1
// Number of towers in Y
stringing_tower_count_y = 3; // 1
// Minimum distance between towers (mm)
stringing_tower_min_dist = 7.5; // 0.5
// Number of extrusions at the top of the tower
stringing_test_top_extrusions = 2; // 1
// Number of extrusions at the bottom of the tower
stringing_test_bottom_extrusions = 3; // 1
// Height of the towers (mm)
stringing_tower_height = 10; // 2.5


/* [Overhang test settings] */
// Test start angle (degrees)
overhang_test_start_angle = 45; // 5
// Test end angle (degrees)
overhang_test_end_angle = 70; // 5
// Test angle step (degrees)
overhang_test_angle_step = 5; // 2.5
// Test height (layers)
overhang_test_height = 10; // 1
// Extra layers on top
overhang_test_extra_layers = 2; // 1
// Test length (mm)
overhang_test_length = 10; // 0.5


/* [Peg/Hole test settings] */
// Minimum peg size (extrusions)
peg_hole_test_min_mult = 1; // 1
// Maximum peg size (extrusions)
peg_hole_test_max_mult = 4; // 1
// Peg size step (extrusions)
peg_hole_test_step_mult = 1; // 1
// Test height (layers)
peg_hole_test_height = 6; // 1
// Minimum distance between pegs (extrusions)
peg_hole_test_min_dist = 2; // 1


/* [Bridging test settings] */
// start (mm)
bridging_test_start = 10; // 5
// end (mm)
bridging_test_end = 50; // 5
// step (mm)
bridging_test_step = 10; // 5
// tower height (layers)
bridging_test_tower_height = 12; // 1
// bridge height (layers)
bridging_test_bridge_height = 2; // 1
// bridge width (extrusions)
bridging_test_bridge_width = 2; // 1
// gap (extrusions)
bridging_test_gap = 3; // 1


/* [Tolerance test settings] */
// Tolerance test mode
tolerance_test_mode = "both"; // [both, cube, cylinder]
// Start tolerance (mm)
tolerance_test_start = 0.1; // 0.05
// End tolerance (mm)
tolerance_test_end = 0.5; // 0.05
// Step tolerance (mm)
tolerance_test_step = 0.1; // 0.05
// Gap size (extrusions)
tolerance_test_gap = 3; // 1
// Test hole diameter without tolerance (mm)
tolerance_test_diameter = 10; // 2.5
// Test height (layers)
tolerance_test_height = 20; // 1


/* [Sphere test settings] */
// Sphere test mode
sphere_test_mode = "both"; // [both, bowl, sphere]
// Sphere test start size (mm)
sphere_test_start = 5; // 1
// Sphere test end size (mm)
sphere_test_end = 15; // 1
// Sphere test step size (mm)
sphere_test_step = 5; // 1
// Sphere test gap size (extrusions)
sphere_test_gap = 3; // 1


/* [Dimensional accuracy test settings] */
// Dimensional accuracy test mode
dimensional_accuracy_test_mode = "both"; // [both, cube, cylinder]
// Start size (mm)
dimensional_accuracy_test_start = 10; //10
// End size (mm) 
dimensional_accuracy_test_end = 30; // 10
// Step size (mm)
dimensional_accuracy_test_step = 10; // 5
// Gap size (extrusions)
dimensional_accuracy_test_gap = 3; // 1
// Text depth (layers)
dimensional_accuracy_test_text_depth = 3; // 1


/* [Text size test settings] */
// Test string
ts_string = "Lorem ipsum";
// Mode
// ts_mode = "both"; // [both, flat, vertical]
// Text size start (mm)
ts_start = 5; // 0.5
// Text size end (mm)
ts_end = 10; // 0.5
// Text size step (mm)
ts_step = 2.5; // 0.5
// Text depth (layers)
ts_depth = 3; // 1
// Minimum distance between text (extrusions)
ts_min_dist = 3; // 1
/* [Text size test advanced settings] */
// // Minimum wall thickness (extrusions) (vertical mode)
// ts_adv_min_wall_thickness = 5; // 1
// Scaling factor view (Enable to adjust scaling factor)
ts_adv_scaling_factor_view = false;
// Font (If you change this, you will need to adjust the width scaling factor using the scaling factor view until the box has equal spacing around the text)
ts_adv_font = "Liberation Mono:style=Regular";
// Text width scaling factor (Default value works for Liberation Mono Regular)
ts_adv_width_scaling = 0.835; //0.005
// Height scaling factor (You should not need to change this, afaik actual text height is always 1.5 times the size)
ts_adv_height_scaling = 1.5; //0.005

/* [Chimney test settings] */
// Chimney base height (layers)
chimney_base_height = 10; // 1
// Chimney top height (layers)
chimney_top_height = 5; // 1
// Chimney base wall thickness (extrusions)
chimney_base_wall_thickness = 4; // 1
// Chimney top extra thickness (extrusions)
chimney_top_extra_thickness = 2; // 1
// Chimney hole start diameter (mm)
chimney_hole_start_diameter = 1; // 1
// Chimney hole end diameter (mm)
chimney_hole_end_diameter = 5; // 1
// Chimney hole diameter step (mm)
chimney_hole_diameter_step = 1; // 1


/* [Bed level test settings] */
// Bed size x (mm)
bed_size_x = 255; 
// Bed size y (mm)
bed_size_y = 255;
// Test pattern
bed_level_test_mode = "both"; // [spot, line, both]
// Spot size (mm)
bed_level_spot_size = [10,10];
// Line width (extrusions)
bed_level_line_width = 3; // 1
// Padding to edge of bed (mm)
bed_level_padding = 15; // 1
// Number of spots&lines
bed_level_divisions = 5; // 1


/* [Hidden] */


include <modules/stringing-test.scad>
include <modules/overhang-test.scad>
include <modules/peg-hole-test.scad>
include <modules/bridging-test.scad>
include <modules/tolerance-test.scad>
include <modules/sphere-test.scad>
include <modules/accuracy-test.scad>
include <modules/text-test.scad>
include <modules/chimney-test.scad>
include <modules/bed-level-test.scad>


// ========== Helper Functions ==========
function largest_in_blocker_array_x(arr) = max([for (i = [0:len(arr)-1]) arr[i][1][0]]);
function smallest_in_blocker_array_x(arr) = min([for (i = [0:len(arr)-1]) arr[i][0][0]]);
function largest_in_blocker_array_y(arr) = max([for (i = [0:len(arr)-1]) arr[i][1][1]]);
function smallest_in_blocker_array_y(arr) = min([for (i = [0:len(arr)-1]) arr[i][0][1]]);

/* 
	* Adjusted gaussian sum:
	* 	works if:
	* 		start,end,step whole numbers
	* 		start,end multiple of step
	* 		start divisible by step
*/
function gauss_1_to_n(n) = (n*(n+1))/2;
function gauss_n_to_m(n,m) = gauss_1_to_n(m) - gauss_1_to_n(n-1);
function gaussian_sum_with_step(a,b,step) = gauss_n_to_m(a/step,b/step)*step;
function gauss_with_step_and_factor(a,b,step,factor) = (
	((b/step*factor)*(b/step*factor)+(b/step*factor))/2-((a/step*factor)*(a/step*factor)+(a/step*factor))/2
);

/* 
 * Sorting 
 * input : list of numbers
 * output : sorted list of numbers
 * https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/List_Comprehensions#Sorting_a_vector
 *
 * function quicksort(arr) = !(len(arr)>0) ? [] : let(
 *     pivot   = arr[floor(len(arr)/2)],
 *     lesser  = [ for (y = arr) if (y  < pivot) y ],
 *     equal   = [ for (y = arr) if (y == pivot) y ],
 *     greater = [ for (y = arr) if (y  > pivot) y ]
 * ) concat(
 *     quicksort(lesser), equal, quicksort(greater)
 * );
 *
 */

// [object_list, object_sizes, mask]
function quicksort_objs_by_size_ascending(objects_combined) = !(len(objects_combined)>0) ? [] : let(
    pivot   = abs(objects_combined[floor(len(objects_combined)/2)][1][0])*abs(objects_combined[floor(len(objects_combined)/2)][1][1]),
    lesser  = [ for (y = objects_combined) if (abs(y[1][0])*abs(y[1][1])  < pivot) y ],
	equal   = [ for (y = objects_combined) if (abs(y[1][0])*abs(y[1][1]) == pivot) y ],
	greater = [ for (y = objects_combined) if (abs(y[1][0])*abs(y[1][1])  > pivot) y ]
) concat(
    quicksort_objs_by_size_ascending(lesser), equal, quicksort_objs_by_size_ascending(greater)
);

function quicksort_objs_by_size_descending(objects_combined) = !(len(objects_combined)>0) ? [] : let(
	pivot   = abs(objects_combined[floor(len(objects_combined)/2)][1][0])*abs(objects_combined[floor(len(objects_combined)/2)][1][1]),
	lesser  = [ for (y = objects_combined) if (abs(y[1][0])*abs(y[1][1])  > pivot) y ],
	equal   = [ for (y = objects_combined) if (abs(y[1][0])*abs(y[1][1]) == pivot) y ],
	greater = [ for (y = objects_combined) if (abs(y[1][0])*abs(y[1][1])  < pivot) y ]
) concat(
	quicksort_objs_by_size_descending(lesser), equal, quicksort_objs_by_size_descending(greater)
);

function _split_back_into_list_of_3(arr) = ([[for (i = [0:len(arr)-1]) arr[i][0]], [for (i = [0:len(arr)-1]) arr[i][1]], [for (i = [0:len(arr)-1]) arr[i][2]]]);

function sort_objects_ascending(object_list, object_sizes, mask) = _split_back_into_list_of_3(quicksort_objs_by_size_ascending([for (i = [0:len(object_list)-1]) [object_list[i], object_sizes[i], mask[i]]]));

function sort_objects_descending(object_list, object_sizes, mask) = _split_back_into_list_of_3(quicksort_objs_by_size_descending([for (i = [0:len(object_list)-1]) [object_list[i], object_sizes[i], mask[i]]]));


// Packing
object_list = ["stringing", "overhang", "peg_hole", "bridging", "tolerance", "sphere", "accuracy", "text", "chimney"];
object_sizes = [stringing_test_size, overhang_test_size, peg_hole_test_size, bridging_test_size, tolerance_test_size, sphere_test_size, accuracy_test_size, text_test_size, chimney_test_size];
mask = [pack_stringing == true ? 1:0, pack_overhang == true ? 1:0, pack_peg_hole == true ? 1:0, pack_bridging == true ? 1:0, pack_tolerance == true ? 1:0, pack_sphere == true ? 1:0, pack_accuracy == true ? 1:0, pack_text == true ? 1:0, pack_chimney == true ? 1:0];

module place_debug(test_type){
	if (test_type == "stringing"){
		color(color_scheme[0%len(color_scheme)]) stringing_test();
		%cube([stringing_test_size[0], stringing_test_size[1], stringing_test_size[2]]);
	}
	if (test_type == "overhang"){
		color(color_scheme[1%len(color_scheme)]) overhang_test();
		%cube([overhang_test_size[0], overhang_test_size[1], overhang_test_size[2]]);
	}
	if (test_type == "peg_hole"){
		color(color_scheme[2%len(color_scheme)]) peg_hole_test();
		%cube([peg_hole_test_size[0], peg_hole_test_size[1], peg_hole_test_size[2]]);
	}
	if (test_type == "bridging"){
		color(color_scheme[3%len(color_scheme)]) bridging_test();
		%cube([bridging_test_size[0], bridging_test_size[1], bridging_test_size[2]]);
	}
	if (test_type == "tolerance"){
		color(color_scheme[4%len(color_scheme)]) tolerance_test();
		%cube([tolerance_test_size[0], tolerance_test_size[1], tolerance_test_size[2]]);
	}
	if (test_type == "sphere"){
		color(color_scheme[5%len(color_scheme)]) sphere_test();
		%cube([sphere_test_size[0], sphere_test_size[1], sphere_test_size[2]]);
	}
	if (test_type == "accuracy") {
		color(color_scheme[6%len(color_scheme)]) accuracy_test();
		%cube([accuracy_test_size[0], accuracy_test_size[1], accuracy_test_size[2]]);
	}
	if (test_type == "text") {
		color(color_scheme[7%len(color_scheme)]) text_test();
		%cube([text_test_size[0], text_test_size[1], text_test_size[2]]);
	}
	if (test_type == "chimney") {
		color(color_scheme[8%len(color_scheme)]) chimney_test();
		%cube([chimney_test_size[0], chimney_test_size[1], chimney_test_size[2]]);
	}
}

module debug_blocker(blocker, object_size){
	if (test_type == "debug"){
		translate([blocker[0][0],blocker[0][1],0]){
			%cube([blocker[1][0]-blocker[0][0],blocker[1][1]-blocker[0][1],object_size[2]+test_bottom_layers*layer_height]);
		}
		translate([blocker[0][0]-test_padding*extrusion_width/4,blocker[0][1]-test_padding*extrusion_width/4,-0.5]){
			%cube([blocker[1][0]-blocker[0][0]+test_padding*extrusion_width/2,blocker[1][1]-blocker[0][1]+test_padding*extrusion_width/2,test_bottom_layers*layer_height]);
		}
	}
}

module pack_objects(object_list, object_sizes, blockers, masks){
	object = object_list[0];
	object_size = object_sizes[0];
	mask = masks[0];
	// Remove first element from lists
	object_list_new = len(object_list) > 1 ? [for (i=[1:len(object_list)-1]) object_list[i]] : [];
	object_sizes_new = len(object_sizes) > 1 ? [for (i=[1:len(object_sizes)-1]) object_sizes[i]] : [];
	masks_new = len(masks) > 1 ? [for (i=[1:len(masks)-1]) masks[i]] : [];

	if (mask == 0) {
		// echo("Object is not to be placed");
		if (is_list(object_list_new) && len(object_list_new) > 0) {
			pack_objects(object_list_new, object_sizes_new, blockers, masks_new);
		}
	}
	else {
		// echo(str("Placing Object: ", object, "; Size: ", object_size, "; Mask: ", mask));
		if (len(blockers) == 0 || is_undef(blockers)) {
			// echo("No blockers, placing object in center");
			object_blockers = [
				[-object_size[0]/2-test_padding*extrusion_width/2,-object_size[1]/2-test_padding*extrusion_width/2],
				[object_size[0]/2+test_padding*extrusion_width/2,object_size[1]/2+test_padding*extrusion_width/2]
			];
			blockers_new = [object_blockers];
			// Center object on xy plane
			object_center = [-object_size[0]/2, -object_size[1]/2, 0];
			translate(object_center){
				// Place object
				place_with_bottom(object);
			}

			debug_blocker(object_blockers, object_size);
			if (is_list(object_list_new) && len(object_list_new) > 0) {
				pack_objects(object_list_new, object_sizes_new, blockers_new, masks_new);
			}
		}
		else {
			// Pack object as close to middle as possible without intersecting blockers
			direction = (pack_rotation+len(object_list)) % 4;

			largest_x = largest_in_blocker_array_x(blockers);
			smallest_x = smallest_in_blocker_array_x(blockers);
			largest_y = largest_in_blocker_array_y(blockers);
			smallest_y = smallest_in_blocker_array_y(blockers);

			if (direction == 0) {
				// +X
				// echo("Packing: direction +X");
				// echo(str("Largest X: ", largest_x));
				object_blockers = [
					[
						largest_x+test_padding*extrusion_width/2,
						-object_size[1]/2-test_padding*extrusion_width/2
					],
					[
						largest_x+object_size[0]+test_padding*extrusion_width*1.5,
						object_size[1]/2+test_padding*extrusion_width/2
						]
					];
				blockers_new = concat(blockers, [object_blockers]);
				debug_blocker(object_blockers, object_size);
				translate([largest_x+test_padding*extrusion_width+object_size[0]/2,0,0]){
					// Center object on xy plane
					object_center = [-object_size[0]/2, -object_size[1]/2, 0];
					translate(object_center)
					// Place object
					place_with_bottom(object);
				}
				if (is_list(object_list_new) && len(object_list_new) > 0) {
					pack_objects(object_list_new, object_sizes_new, blockers_new, masks_new);
				}
			}
			if (direction == 1) {
				// +Y
				// echo("Packing: direction +Y");
				// echo(str("Largest Y: ", largest_y));
				object_blockers = [
					[
						-object_size[0]/2-test_padding*extrusion_width/2,
						largest_y+test_padding*extrusion_width/2
					],
					[
						object_size[0]/2+test_padding*extrusion_width/2,
						largest_y+test_padding*extrusion_width*1.5+object_size[1]
					]
				];
				blockers_new = concat(blockers, [object_blockers]);
				debug_blocker(object_blockers, object_size);
				translate([0,largest_y+test_padding*extrusion_width+object_size[1]/2,0]){
					
					// Center object on xy plane
					object_center = [-object_size[0]/2, -object_size[1]/2, 0];
					translate(object_center)
					// Place object
					place_with_bottom(object);
				}

				if (is_list(object_list_new) && len(object_list_new) > 0) {
					pack_objects(object_list_new, object_sizes_new, blockers_new, masks_new);
				}
			}
			if (direction == 2) {
				// -X
				// echo("Packing: direction -X");
				// echo(str("Smallest X: ", smallest_x));
				object_blockers = [
					[
						smallest_x-object_size[0]-test_padding*extrusion_width*1.5,
						-object_size[1]/2-test_padding*extrusion_width/2
					],
					[
						smallest_x-test_padding*extrusion_width/2,
						object_size[1]/2+test_padding*extrusion_width/2
					]
				];
				blockers_new = concat(blockers, [object_blockers]);
				debug_blocker(object_blockers, object_size);
				translate([smallest_x-test_padding*extrusion_width-object_size[0]/2,0,0]){
					// Center object on xy plane
					object_center = [-object_size[0]/2, -object_size[1]/2, 0];
					translate(object_center)
					// Place object
					place_with_bottom(object);
				}

				if (is_list(object_list_new) && len(object_list_new) > 0) {
					pack_objects(object_list_new, object_sizes_new, blockers_new, masks_new);
				}
			}
			if (direction == 3) {
				// -Y
				// echo("Packing: direction -Y");
				// echo(str("Smallest Y: ", smallest_y));
				object_blockers = [
					[
						-object_size[0]/2-test_padding*extrusion_width/2,
						smallest_y-object_size[1]-test_padding*extrusion_width*1.5
					],
					[
						object_size[0]/2+test_padding*extrusion_width/2,
						smallest_y-test_padding*extrusion_width/2
					]
				];
				blockers_new = concat(blockers, [object_blockers]);
				debug_blocker(object_blockers, object_size);
				translate([0,smallest_y-test_padding*extrusion_width-object_size[1]/2,0]){

					// Center object on xy plane
					object_center = [-object_size[0]/2, -object_size[1]/2, 0];
					translate(object_center)
					// Place object
					place_with_bottom(object);
				}

				if (is_list(object_list_new) && len(object_list_new) > 0) {
					pack_objects(object_list_new, object_sizes_new, blockers_new, masks_new);
				}
			}
		}
	}
}

module place_with_bottom(test_type) {
	echo(str("============ Object: ", test_type, " ============"));
	if (test_type == "stringing"){
		c = color_scheme[0%len(color_scheme)];
		color(c) translate([0,0, test_bottom_layers*layer_height]) stringing_test();
		color(c) translate([-test_padding/2*extrusion_width,-test_padding/2*extrusion_width,0]) cube([stringing_test_size[0]+test_padding*extrusion_width, stringing_test_size[1]+test_padding*extrusion_width, test_bottom_layers*layer_height]);
	}
	if (test_type == "overhang"){
		c = color_scheme[1%len(color_scheme)];
		color(c) translate([0,0,test_bottom_layers*layer_height]) overhang_test();
		color(c) translate([-test_padding/2*extrusion_width,-test_padding/2*extrusion_width,0]) cube([overhang_test_size[0]+test_padding*extrusion_width, overhang_test_size[1]+test_padding*extrusion_width, test_bottom_layers*layer_height]);
	}
	if (test_type == "peg_hole"){
		c = color_scheme[2%len(color_scheme)];
		color(c) translate([0,0,test_bottom_layers*layer_height]) peg_hole_test();
		color(c) translate([-test_padding/2*extrusion_width,-test_padding/2*extrusion_width,0]) cube([peg_hole_test_size[0]+test_padding*extrusion_width, peg_hole_test_size[1]+test_padding*extrusion_width, test_bottom_layers*layer_height]);
	}
	if (test_type == "bridging"){
		c = color_scheme[3%len(color_scheme)];
		color(c) translate([0,0,test_bottom_layers*layer_height]) bridging_test();
		color(c) translate([-test_padding/2*extrusion_width,-test_padding/2*extrusion_width,0]) cube([bridging_test_size[0]+test_padding*extrusion_width, bridging_test_size[1]+test_padding*extrusion_width, test_bottom_layers*layer_height]);
	}
	if (test_type == "tolerance"){
		c = color_scheme[4%len(color_scheme)];
		color(c) translate([0,0,test_bottom_layers*layer_height]) tolerance_test();
		color(c) translate([-test_padding/2*extrusion_width,-test_padding/2*extrusion_width,0]) cube([
			tolerance_test_size[0]+test_padding*extrusion_width-(tolerance_test_end+tolerance_test_diameter+tolerance_test_gap*2*extrusion_width), 
			tolerance_test_size[1]+test_padding*extrusion_width, 
			test_bottom_layers*layer_height]);
	}
	if (test_type == "sphere"){
		c = color_scheme[5%len(color_scheme)];
		color(c) translate([0,0,test_bottom_layers*layer_height]) sphere_test();
		color(c) 
		translate([
			-(test_padding*extrusion_width)/2,
			-(test_padding*extrusion_width)/2,
			0
		]) 
		cube([
			sphere_test_size[0]+test_padding*extrusion_width,
			sphere_test_size[1]+test_padding*extrusion_width,
			test_bottom_layers*layer_height]);
	}
	if (test_type == "accuracy") {
		c = color_scheme[6%len(color_scheme)];
		color(c) accuracy_test();
	}
	if (test_type == "text") {
		c = color_scheme[7%len(color_scheme)];
		color(c) 
		translate([0,0,test_bottom_layers*layer_height]) 
		text_test();
		color(c) 
		translate([
			-test_padding/2*extrusion_width,
			-test_padding/2*extrusion_width,
			0
		]) 
		cube([
			text_test_size[0]+test_padding*extrusion_width, 
			text_test_size[1]+test_padding*extrusion_width, 
			test_bottom_layers*layer_height
		]);

	}
	if (test_type == "chimney") {
		c = color_scheme[8%len(color_scheme)];
		color(c)
		translate([0,0,test_bottom_layers*layer_height])
		chimney_test();
		color(c)
		translate([
			-test_padding/2*extrusion_width,
			-test_padding/2*extrusion_width,
			0
		])
		cube([
			chimney_test_size[0]+test_padding*extrusion_width,
			chimney_test_size[1]+test_padding*extrusion_width,
			test_bottom_layers*layer_height
		]);
	}
	if (test_type == "common") {
		place_with_bottom("stringing");
		translate([stringing_test_size[0]+test_padding*extrusion_width,bridging_test_size[1]+test_padding*extrusion_width,0]) place_with_bottom("overhang");
		translate([peg_hole_test_size[1],stringing_test_size[1]+test_padding*extrusion_width,0]) rotate([0,0,90]) place_with_bottom("peg_hole");
		translate([stringing_test_size[0]+test_padding*extrusion_width,0,0]) place_with_bottom("bridging");
		translate([peg_hole_test_size[1]+test_padding*extrusion_width,max(stringing_test_size[1], 
		(overhang_test_size[1]+bridging_test_size[1]+extrusion_width*test_padding))+test_padding*extrusion_width,
		0]) place_with_bottom("tolerance");
		// translate([sphere_test_gap*extrusion_width/2+peg_hole_test_size[1]+test_padding*extrusion_width,
		// max((stringing_test_size[1]+tolerance_test_size[1]+test_padding*extrusion_width*2),(bridging_test_size[1]+overhang_test_size[1]+tolerance_test_size[1]+test_padding*extrusion_width*2.5))+sphere_test_gap*extrusion_width*1.5
		// ,0]) place_with_bottom("sphere");
		// translate([-accuracy_test_size[0]-test_padding*extrusion_width,-accuracy_test_size[1]-test_padding*extrusion_width,0]) place_with_bottom("accuracy");
	}
	if (test_type == "debug") {

		sizes_x = [ for (i = [0:len(object_list)-1]) object_sizes[i][0]];
		sizes_y = [ for (i = [0:len(object_list)-1]) object_sizes[i][1]];

		debug_spacing_x = max(sizes_x)+test_padding*extrusion_width*2;
		debug_spacing_y = max(sizes_y)+test_padding*extrusion_width*2;

		for (i = [0:len(object_list)-1]){
			translate([0,debug_spacing_y*i,0]){
				place_debug(object_list[i]);
			}
		}

		translate([debug_spacing_x,0,0]){
			for (i = [0:len(object_list)-1]){
				translate([0,debug_spacing_y*i,0]){
					place_with_bottom(object_list[i]);
				}
			}
		}

		echo(str("Sizes x: ", sizes_x));
		echo(str("Sizes y: ", sizes_y));
		echo(str("Debug spacing x: ", debug_spacing_x));
		echo(str("Debug spacing y: ", debug_spacing_y));
	}
}

$fn = preview_mode ? 16 : detail_level;
$fs = preview_mode ? 0.5 : $fs;

// === Main ===
if (ts_adv_scaling_factor_view) {
	text_test_single(ts_end, debug = true);
}
else if (test_type=="bed_level"){
	color(color_scheme[0]) bed_level_test();
}
else if (pack_objects) {
	object_lists_combined = [object_list, object_sizes, mask];
	object_lists_sorted = pack_sorting=="ascending"?sort_objects_ascending(object_list, object_sizes, mask):pack_sorting=="descending"?sort_objects_descending(object_list, object_sizes, mask):object_lists_combined;
	blockers = [];

	pack_objects(object_lists_sorted[0], object_lists_sorted[1], blockers, object_lists_sorted[2]);
}
else {
	place_with_bottom(test_type);
}

echo("=======Finished=======");

// === Warnings ===
// Tolerance
if ((tolerance_test_start/tolerance_test_step)%1 != 0 || (tolerance_test_end/tolerance_test_step)%1 != 0) {
	echo("WARNING: Tolerance test start and end must be divisible by step, otherwise the test might use too much space for the bottom layers.");
}

if ((tolerance_test_end/tolerance_test_start)%1 != 0) {
	echo("WARNING: Tolerance test end is not divisible by start, the test might use too much space for the bottom layers.");
}

// Sphere
if ((sphere_test_start/sphere_test_step)%1 != 0 || (sphere_test_end/sphere_test_step)%1 != 0) {
	echo("WARNING: Sphere test start and end must be divisible by step, otherwise the test might use too much space for the bottom layers.");
}

if ((sphere_test_end/sphere_test_start)%1 != 0) {
	echo("WARNING: Sphere test end is not divisible by start, the test might use too much space for the bottom layers.");
}
