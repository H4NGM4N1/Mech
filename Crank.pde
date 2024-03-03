class Crank extends Component{
  private float rotationRadius;
  private float currentAngle;
  private float angleChangeStep;
  
  Crank(){
    
  }
  
  Crank(PVector baseHinge, float rotationRadius, float startAngle, float angleChangeStep){
    setHinge1(baseHinge);
    setCurrentAngle(startAngle);
    setHinge2(pointOfCircleAndLine(baseHinge, rotationRadius, startAngle)[0]);
    this.rotationRadius = rotationRadius;
    this.angleChangeStep = angleChangeStep;
  }
  


  @Override
  void movePart(){
    if(currentAngle > 360){
      currentAngle -= 360;
    }
    //fix
    if(currentAngle == 0){
      currentAngle = 360;
    }
    currentAngle += angleChangeStep;
    PVector[] possiblePoints = pointOfCircleAndLine(get1Hinge(), getRotationRadius(), currentAngle);
    if(PVector.dist(possiblePoints[0], get2Hinge()) > PVector.dist(possiblePoints[1], get2Hinge())){
      set2HingeXY(possiblePoints[1]);
    }
    else{
      set2HingeXY(possiblePoints[0]);
    }
  }

  @Override
  void drawComponent(){
    line(get1Hinge().x, get1Hinge().y, get2Hinge().x, get2Hinge().y);
    drawHinge(get1Hinge());
    drawHinge(get2Hinge());
    fill(#000000);
    text("O", get1Hinge().x + 15, get1Hinge().y + 15);
    fill(#FFFFFF);
  }
  
  float getRotationRadius(){
    return rotationRadius;
  }
  
  void setRotationRadius(float rotationRadius){
    this.rotationRadius = rotationRadius;
  }
  
  float getCurrentAngle(){
    return currentAngle;
  }
  
  void setCurrentAngle(float currentAngle){
    this.currentAngle = currentAngle;
  }
}
