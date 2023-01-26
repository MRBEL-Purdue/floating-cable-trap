include <nutsnbolts/cyl_head_bolt.scad>;

outer_radius = 20;
inner_radius = 10;
length = 100;

screw_size = "M5"; // [M1, M2, M3, M4, M5, M6, M8]

screw_diameter = ord(screw_size[1]) - 48; 


bolt_radius = 5; // 5 = M5
// Height measured from top of outside edge
bolt_head_height = 10;
// Radius of bolt head to increase from standard
bolt_head_radius_add = -1;

number_of_screw_pairs = 2;
// Location as a decimal [0,1]
screw_pair_location = [0.2, 0.8, 0, 0];


difference() {
  cylinder(r=outer_radius, h=length);
  
  translate([(outer_radius+length)*2,0,0]){
      cube((outer_radius+length)*4, center=true);
  }
      translate([0,0,-1]){
      cylinder(r=inner_radius, h=length*2);
  }
  
  for (i = [1:1:number_of_screw_pairs]){
    	rotate([0,90,180]) {
        translate([-length * screw_pair_location[i-1], (outer_radius+ inner_radius) / 2 , outer_radius]) hole_through(name=screw_size, l=50, cld=0.1, h=bolt_head_height, hcld=bolt_head_radius_add);
        }
        
        rotate([0,90,180]) {
        translate([-length * screw_pair_location[i-1], -(outer_radius+ inner_radius) / 2 , outer_radius]) hole_through(name=screw_size, l=50, cld=0.1, h=bolt_head_height, hcld=bolt_head_radius_add);
        }
    }
    }
//
//difference() {
//	translate([-15, -15, 0]) cube([80, 30, 50]);
//	
//
//
//}
//    

