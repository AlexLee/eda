// Model of Avago Technologies ADNS-2610

// Pin 1 is [0,0,0] unless using adns2610_oc0

// adns2610_render_part=0;
 adns2610_render_part=1; // adns2610()
// adns2610_render_part=2; // adns2610_oc0()
// adns2610_render_part=3; // parametric adns2610_oc0 example

module adns2610_pin(
	pinDTh=0.0
	, pinDH=0.0
        , pinH=5.15
        , pinTh=0.25
        , pinWB=0.50
        , pinWT=0.90
        , pin2TH=1.00
        , pkgB2TH=3.18
	, pin2pkg=(12.85-9.10)/2
	, pinColor=[192/255,192/255,0]
        ) {
  $fs=0.1;
  $fa=15;
  color(pinColor) {
    translate([-pinWB/2,-(pinTh+pinDTh)/2,pkgB2TH-pinH-pinDH-pin2TH])
        cube(size=[pinWB, (pinTh+pinDTh), pinH+pinDH], center=false);
    translate([-pinWT/2, -(pinTh+pinDTh)/2, 0])
        cube(size=[pinWT, (pinTh+pinDTh), pkgB2TH-pin2TH], center=false);
    translate([-pinWT/2, -(pinTh+pinDTh)/2, pkgB2TH-pin2TH]) rotate([-90,0,0])
        cube(size=[pinWT, (pinTh+pinDTh), pin2pkg+pinTh], center=false);
  }
}


module adns2610(
	pinDTh=0.0
	, pinDH=0.0
	, opticalDD=0.0
	, opticalDZ=0.0
	, pinH=5.15
	, pinTh=0.25
	, pinWB=0.50
	, pinWT=0.90
	, pin2TH=1.00
	, pkgB2TH=3.18
	, pin2pin=2.00
	, pin2pkg=(12.85-9.10)/2
	, row2row=12.85
	, pkgW=9.10
	, pkgL=9.90
	, opticalXC=2.00
	, opticalYC=4.55+(12.85-9.10)/2
	, opticalD=5.60
	, opticalZ=1.42
	, bodyColor=[64/255,64/255,64/255]
	) {
  color(bodyColor) {
    // package
    translate([opticalXC-4.45,opticalYC-4.55,0])
      cube(size=[pkgL, pkgW, pkgB2TH],center=false);
    // optical path
    translate([opticalXC,opticalYC,-opticalZ-opticalDZ])
      cylinder($fa=15, $fs=0.1, r=(opticalD+opticalDD)/2,h=opticalZ+opticalDZ,center=false);
    // optical path top marker
    translate([opticalXC,opticalYC,-0.1]) cylinder($fa=15, $fs=0.1, r=opticalD/2,h=pkgB2TH+0.2,center=false);
  }
  // pin1
  adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH , pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin1 indicator
  color([1,1,1]-bodyColor)
    translate([0,pin2pkg+1.0,pkgB2TH]) sphere($fa=30, $fs=0.1, r=0.5,center=true);
  // pin2
  translate([pin2pin,0,0])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin3
  translate([2*pin2pin,0,0])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin4
  translate([3*pin2pin,0,0])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin5
  translate([3*pin2pin-pin2pin/2,row2row,0]) rotate([0,0,180])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin6
  translate([2*pin2pin-pin2pin/2,row2row,0]) rotate([0,0,180])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin7
  translate([1*pin2pin-pin2pin/2,row2row,0]) rotate([0,0,180])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
  // pin8
  translate([-pin2pin/2,row2row,0]) rotate([0,0,180])
    adns2610_pin( pinDTh=pinDTh, pinDH=pinDH, pinH=pinH, pinTh=pinTh , pinWB=pinWB , pinWT=pinWT , pin2TH=pin2TH , pkgB2TH=pkgB2TH, pin2pkg=pin2pkg);
}

module adns2610_oc0(
	pinDTh=0.0
	, pinDH=0.0
	, opticalDD=0.0
	, opticalDZ=0.0
	, pinH=5.15
	, pinTh=0.25
	, pinWB=0.50
	, pinWT=0.90
	, pin2TH=1.00
	, pkgB2TH=3.18
	, pin2pin=2.00
	, pin2pkg=(12.85-9.10)/2
	, row2row=12.85
	, pkgW=9.10
	, pkgL=9.90
	, opticalXC=2.00
	, opticalYC=4.55+(12.85-9.10)/2
	, opticalD=5.60
	, opticalZ=1.42
	) {
  translate([-opticalXC,-opticalYC,0])
    adns2610(
	pinDTh=pinDTh
	, pinDH=pinDH
	, opticalDD=opticalDD
	, opticalDZ=opticalDZ
	, pinH=pinH
	, pinTh=pinTh
	, pinWB=pinWB
	, pinWT=pinWT
	, pin2TH=pin2TH
	, pkgB2TH=pkgB2TH
	, pin2pin=pin2pin
	, pin2pkg=pin2pkg
	, row2row=row2row
	, pkgW=pkgW
	, pkgL=pkgL
	, opticalXC=opticalXC
	, opticalYC=opticalYC
	, opticalD=opticalD
	, opticalZ=opticalZ
    );
}

if( adns2610_render_part==1 ) {
  echo("Rendering adns2610...");
  adns2610();
}

if( adns2610_render_part==2 ) {
  echo("Rendering adns2610_oc0...");
  adns2610_oc0();
}

if( adns2610_render_part==3 ) {
  echo("Rendering parametric adns2610_oc0 example...");
  adns2610_oc0(
	pinDTh=0.5
	, pinDH=5.0
	, opticalDD=0.2
	, opticalDZ=5.0
  );
}
