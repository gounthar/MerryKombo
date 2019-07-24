PANEL_SIZE = 36;
PANEL_THICKNESS = 4.2;
BETWEEN_HOLES_DISTANCE = 28.8;
HOLE_RADIUS = 1.5;
PILLAR_RADIUS = 3;
PILLAR_HEIGHT = 3.6;
HOLE_CENTER_TO_SIDE = 3.6;

pillars();
holes();

module holes(mainPart, cylinder) {
     difference() {
	  translate([PANEL_THICKNESS/2,PANEL_SIZE/2,PANEL_SIZE/2]) cube([PANEL_THICKNESS,PANEL_SIZE,PANEL_SIZE],true);
	  hole();
	  translate([0,-BETWEEN_HOLES_DISTANCE,0]) hole();
	  translate([0,-BETWEEN_HOLES_DISTANCE,BETWEEN_HOLES_DISTANCE]) hole();
	  translate([0,0,BETWEEN_HOLES_DISTANCE]) hole();

	  cameraHole();
     }
}

module hole() {
     translate([-1,BETWEEN_HOLES_DISTANCE+HOLE_CENTER_TO_SIDE,HOLE_CENTER_TO_SIDE]) rotate(a=90, v=[0,1,0]) cylinder(h=10, r=HOLE_RADIUS, center=false, $fn=100);
}

module cameraHole() {
     translate([0, PANEL_SIZE/2, PANEL_SIZE/2]) rotate(a=90, v=[0,1,0]) cylinder(h=10,r=BETWEEN_HOLES_DISTANCE/2, center=true, $fn=200);
}

module pillar() {
     difference() {
	  translate([PANEL_THICKNESS,HOLE_CENTER_TO_SIDE,HOLE_CENTER_TO_SIDE]) rotate(a=90, v=[0,1,0]) cylinder(h=PILLAR_HEIGHT,r=PILLAR_RADIUS, center=false, $fn=200);
	  translate([PANEL_THICKNESS,HOLE_CENTER_TO_SIDE,HOLE_CENTER_TO_SIDE]) rotate(a=90, v=[0,1,0]) cylinder(h=PILLAR_HEIGHT + 0.1,r=HOLE_RADIUS, center=false, $fn=200);
     }
}

module pillars() {
     pillar();
     translate([0,BETWEEN_HOLES_DISTANCE,0]) pillar();
     translate([0,0,BETWEEN_HOLES_DISTANCE])  pillar();
     translate([0,BETWEEN_HOLES_DISTANCE,BETWEEN_HOLES_DISTANCE])  pillar();
}
