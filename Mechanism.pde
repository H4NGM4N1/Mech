int i = 0;
//------------------------------------------------------------------------------
Crank crank = new Crank(new PVector(750, 300), 50, 60, -30);
Swipe swipe = new Swipe(new PVector(500, 100), -100, -200);
Connector con = new Connector(crank, 5, swipe, 5);
Piston piston = new Piston(new PVector(300, 200), swipe.get1Hinge(), 100, 60);

void setup() {
  frameRate(14);
  size(931, 517);
  surface.setLocation(552, 331);
  surface.setTitle("ПГ-11 Практична робота №1 Білецький Дмитро");
  textSize(16);
}

void draw() {

  
  if (i < 12) {
    crank.movePart();
    crank.drawComponent();
    con.movePart();
    con.drawComponent();
    swipe.drawComponent();
    piston.movePart();
    piston.drawComponent();
  }
 
  i++;
}
