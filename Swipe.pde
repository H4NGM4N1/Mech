class Swipe extends Component{
  private PVector centerPoint;
  private float hinge1Radius;
  private float hinge2Radius;
  
  Swipe(){
  }
  
  Swipe(PVector centerPoint, float rotationRadius1, float rotationRadius2){
    setCenterPoint(centerPoint);
    setHinge1Radius(rotationRadius1);
    setHinge2Radius(rotationRadius2);
    setHinge1(new PVector(centerPoint.x, centerPoint.y - hinge1Radius));
    setHinge2(new PVector(centerPoint.x, centerPoint.y - hinge2Radius));
  }
  
  @Override
  void drawComponent(){
    line(getCenterPoint().x, getCenterPoint().y, get2Hinge().x, get2Hinge().y);
    drawHinge(get1Hinge());
    drawHinge(get2Hinge());
    drawHinge(centerPoint);
  }
  
  @Override
  void movePart(){
    
  }
  
  PVector getCenterPoint(){
    return centerPoint;
  }
  
    void setCenterPoint(PVector centerPoint){
    this.centerPoint = centerPoint;
  }
  
  float get1HingeRadius(){
    return hinge1Radius;
  }
  
  void setHinge1Radius(float hinge1Radius){
    this.hinge1Radius = hinge1Radius;
  }
  
  float get2HingeRadius(){
    return hinge2Radius;
  }
  
  void setHinge2Radius(float hinge2Radius){
    this.hinge2Radius = hinge2Radius;
  }
}
