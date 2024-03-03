class Piston extends Component {    //Поршень
  private float pistonWidth;
  private float pistonLength;
  private float lengthOfRod;
  private float xOfLine, yOfLine;
  private PVector connectedHinge;

  Piston() {
  }

  Piston(PVector pistonHinge, PVector connectedHinge, float pistonWidth, float pistonLength) {
    this.connectedHinge = connectedHinge;
    this.xOfLine = pistonHinge.x;
    this.yOfLine = pistonHinge.y;
    this.pistonWidth = pistonWidth;
    this.pistonLength = pistonLength;
    setHinge1(pistonHinge);
    setHinge2(connectedHinge);
    this.lengthOfRod = PVector.dist(get1Hinge(), get2Hinge());
  }

  @Override
    void movePart() {
      set1HingeXY(getClosestPointOfTwo(pointOfCircleAndStaticLine(connectedHinge, lengthOfRod, xOfLine, yOfLine, 180), get1Hinge()));
  }
  
  @Override
    void drawComponent() {
    rectMode(CENTER);
    rect(get1Hinge().x, get1Hinge().y, pistonWidth, pistonLength);
    line(get1Hinge().x, get1Hinge().y, get2Hinge().x, get2Hinge().y);
    drawHinge(get1Hinge());
    drawHinge(get2Hinge());
  }

  float getPistonWidth() {
    return pistonWidth;
  }

  float getPistonLength() {
    return pistonLength;
  }
}
