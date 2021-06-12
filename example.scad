/**
 * Simple example of Honeycomb library usage
 * License: Creative Commons - Attribution
 * Copyright: Gael Lafond 2017
 * 
 * Inspired from:
 *   https://www.thingiverse.com/thing:1763704
 */

include <honeycomb.scad>

// 901.5 x 57 x 25.4
// 4x 225.375

$fn = 60;

//translate([0,-15,0]) %cube([901.5,5,25.4]);


module rtb(h=10, l=60, w=24){
  translate([0,-1,0]) hull(){
    translate([ 0,0,h]) rotate([0,90,90]) cylinder(d=8, h=l);
    translate([w-8,0,h]) rotate([0,90,90]) cylinder(d=8, h=l);    
    translate([-4,0,0]) cube([w,l,h]);
  }
}


module section(place){
difference(){
  cube([225.375, 57.15, 25.4]);
  translate([0,4,-.5]) cube([225.375,49.15,26.4]);
  for (i = ([10,65,125,180])){
    translate([i,0,0]) #rtb(w=40);
  } 
  translate([20,14,0]) rotate([0,0,90]) rtb(w=37.075); 
}

difference(){
translate([0,0,15.4])
  linear_extrude(10) {
    honeycomb(225.325, 55, 12, 4);
  }
  translate([-20,-1,-1]) cube([20,60,30]);
}
} 

/*
translate([0,0,0]) cube([4,57.15,25.4]);
translate([0,0,0]) section();
translate([225.375,0,0]) section();
translate([450.75,0,0]) section();
translate([676.075,0,0]) section();
translate([897.5,0,0]) cube([4,57.15,25.4]);
*/
///* spaced
translate([0,0,0]) cube([4,57.15,25.4]);
translate([0,0,0]) section();
translate([228,0,0]) section();

translate([0,-60,0]) section();
translate([228,-60,0]) section();
translate([449.375,-60,0]) cube([4,57.15,25.4]);
//*/