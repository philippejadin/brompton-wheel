/*
Brompton 3D printed parametric easy wheel
By Philippe Jadin - https://123piano.com


Buy some o-ring joints. Here the settings are for a 75mm outer diameter o-ring of 10mm diameter. Best choose soft material (like hardness of 70)

Buy some ball bearings. Inner diameter should be 5 or 6 mm depending on your bike (mostly 6 mm except older bikes)

Change the variables bellow to make your perfect easy wheel

Generate

3D print

Enjoy!

*/

//Everything in milimeters

// main wheel diameter, directly depends on your chosen o-ring
wheel_size=75;

// height depends on the chosen o-ring. 10 mm recomended to fit brompton
wheel_height=12;

// o-ring diameter
oring_size=10;

// the diameter of your ball bearing, 13mm seems quite common
bearing_size=13;

// diameter of the stopper ring (it prevents the bearing from getting out of the wheel)
stopper_hole=8;
// height in mm
stopper_height=2;

// you can add holes to have a lighter (and stronger?) wheel
hole_size=13;

// how many holes you want
hole_qty=6;

// this is the distance from the center of the wheel, adjust to your taste
hole_distance=20;


// model quality, no need to change
$fn=50; 


difference() {

// main wheel
difference() {
    
difference() {
cylinder(d=wheel_size, h=wheel_height, center=true);
cylinder(d=bearing_size, h=wheel_height+2, center=true);
}

// tire ( = torus)
rotate_extrude(convexity = 10)
translate([wheel_size/2, 0, 0])
circle(r = oring_size/2);
}




// holes
for (i = [1:hole_qty])
{
rotate(a=i*360/hole_qty, v=[0,0,1]) translate([hole_distance, 0, 0])  cylinder(d=hole_size, h=wheel_height+5, center=true);
}

}


// stopper
difference() {
translate([0,0,-wheel_height/2]) cylinder(d=bearing_size, h=stopper_height);
    
    cylinder(d=stopper_hole, h=wheel_height*2, center=true);
}

