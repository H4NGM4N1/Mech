class Connector extends Component {          //Шатун
  private float lengthOfCon;
  private Swipe connectedComponent;

  Connector(Component c1, int hingeNum1, Swipe c2, int hingeNum2) {
    setHinge1(c1.getHingeByIndex(hingeNum1));
    setHinge2(c2.getHingeByIndex(hingeNum2));
    this.connectedComponent = c2;
    this.lengthOfCon = PVector.dist(get1Hinge(), get2Hinge());
  }

  @Override
    void movePart() {
      PVector lastSwipehinge2 = new PVector(get2Hinge().x, get2Hinge().y);
      set2HingeXY(getClosestPointOfTwo(pointOfBothCircles(get1Hinge(), connectedComponent.getCenterPoint(), lengthOfCon, connectedComponent.get2HingeRadius()), lastSwipehinge2));
      
      float dxForhinge2 = get2Hinge().x - lastSwipehinge2.x;
      float dyForhinge2 = get2Hinge().y - lastSwipehinge2.y;
      
      float proportion = connectedComponent.get1HingeRadius() / connectedComponent.get2HingeRadius();
      float dxForhinge1 = dxForhinge2 * proportion;
      float dyForhinge1 = dyForhinge2 * proportion;
      
      connectedComponent.set1HingeXY(connectedComponent.get1Hinge().x + dxForhinge1, connectedComponent.get1Hinge().y + dyForhinge1);
  }

  @Override
    void drawComponent() {
    line(get1Hinge().x, get1Hinge().y, get2Hinge().x, get2Hinge().y);
    drawHinge(get1Hinge());
    drawHinge(get2Hinge());
    
    fill(#000000);
    text("A" + getIndex(), get1Hinge().x + 15, get1Hinge().y + 15);
    fill(#FFFFFF);
    fill(#000000);
    text("B" + getIndex(), get2Hinge().x + 15, get2Hinge().y + 15);
    fill(#FFFFFF);
    increeseIndex();
  }

  float getLengthOfCon() {
    return lengthOfCon;
  }

  void setLengthOfCon(float newLength) {
    this.lengthOfCon = newLength;
  }
}
