class Component {
  private PVector hinge1;
  private PVector hinge2;
  private final float hingeSize = 10;
  private int index = 0;

  Component() {
  }

  Component(PVector hinge1, PVector hinge2) {
    this.hinge1 = hinge1;
    this.hinge2 = hinge2;
  }

  PVector getHingeByIndex(int index) {
    if (index == 1) {
      return hinge1;
    } else {
      return hinge2;
    }
  }

  int getIndex() {
    return this.index;
  }

  void increeseIndex() {
    this.index++;
  }

  PVector get1Hinge() {
    return hinge1;
  }

  void setHinge1(PVector hinge1) {
    this.hinge1 = hinge1;
  }

  void set1HingeXY(PVector hinge1) {
    this.hinge1.x = hinge1.x;
    this.hinge1.y = hinge1.y;
  }

  void set1HingeXY(float x, float y) {
    this.hinge1.x = x;
    this.hinge1.y = y;
  }

  PVector get2Hinge() {
    return hinge2;
  }

  void setHinge2(PVector hinge2) {
    this.hinge2 = hinge2;
  }

  void set2HingeXY(PVector hinge2) {
    this.hinge2.x = hinge2.x;
    this.hinge2.y = hinge2.y;
  }

  void drawHinge(PVector h) {
    circle(h.x, h.y, hingeSize);
  }

  void movePart() {
  }

  void drawComponent() {
  }
}
