static PVector[] pointOfBothCircles(PVector firstCenter, PVector secondCenter, float radius1, float radius2) {
  float x1 = firstCenter.x, x2 = secondCenter.x, y1 = firstCenter.y, y2 = secondCenter.y;
  PVector[] points;
  float[] pointsY;
  float dx = x1 - x2, dy = y1 - y2;
  float a, b, c;
  float C1 = radius1 * radius1 - x1 * x1 - y1 * y1,
    C2 = radius2 * radius2 - x2 * x2 - y2 * y2,
    C3 = (C1 - C2) / -2;

  a = (dy * dy) + (dx * dx);
  b = -2 * C3 * dy + 2 * x1 * dx * dy - 2 * dx * dx * y1;
  c = C3 * C3 - 2 * x1 * dx * C3 - dx * dx * C1;

  pointsY = getRoots(a, b, c);
  if (pointsY == null) {
    return null;
  }
  points = new PVector[pointsY.length];
  for (int i = 0; i < points.length; i++) {
    points[i] = new PVector();
  }

  for (int i = 0; i < pointsY.length; i++) {
    points[i].x = (C3 - dy * pointsY[i]) / dx;
  }
  for (int i = 0; i < pointsY.length; i++) {
    points[i].y = pointsY[i];
  }
  return points;
}

static PVector[]  pointOfCircleAndLine(PVector center, float r, float k) {
  if (k == 90) {
    return new PVector[]{ new PVector(center.x, center.y - r), new PVector(0, 0)};
  }
  if (k == 270) {
    return new PVector[]{ new PVector(center.x, center.y + r), new PVector(0, 0)};
  }

  k = tan(radians(k));

  float a, b, c, x1 = center.x, y1 = center.y;
  a = k * k + 1;
  b = (k * k + 1) * -2 * x1;
  c = (k * k + 1) * x1 * x1 - (r * r);

  float[] rootsX = getRoots(a, b, c);

  if (rootsX != null) {
    PVector[] points = new PVector[2];
    points[0] = new PVector(rootsX[0], (rootsX[0] - x1) * k + y1);
    points[1] = new PVector(rootsX[1], (rootsX[1] - x1) * k + y1);
    return points;
  } else {
    print("none roots, error (circle, line)");
    return null;
  }
}

static PVector[] pointOfCircleAndStaticLine(PVector center, float r, float xLine, float yLine, float k) {
  float x1 = center.x, y1 = center.y, a, b, c;
  float[] roots;

  if (k == 90 || k == 270) {
    a = 1;
    b = -2 * y1;
    c = (float) Math.pow(xLine - x1, 2) + y1 * y1 - r * r;
    roots = getRoots(a, b, c);
    if (roots != null) {
      PVector[] points = new PVector[2];
      points[0] = new PVector(xLine, roots[0]);
      points[1] = new PVector(xLine, roots[1]);
      return points;
    } else {
      print("none roots, error (circle, static line)");
      return null;
    }
    
  } else {
    k = tan(radians(k));
    a = k * k + 1;
    b = (x1 + xLine * k * k - k * yLine + k * y1) * -2;
    c = (x1 * x1) + (k * k * xLine * xLine) - (2 * k * yLine * xLine) + (yLine * yLine) + (2 * k * y1 * xLine) - (2 * y1 * yLine) + (y1 * y1) - (r * r);
    roots = getRoots(a, b, c);
    if (roots != null) {
      PVector[] points = new PVector[2];
      points[0] = new PVector(roots[0], (roots[0] - xLine) * k + yLine);
      points[1] = new PVector(roots[1], (roots[1] - xLine) * k + yLine);
      return points;
    } else {
      print("no roots for circle and static line");
      return null;
    }
  }
}

static float[] getRoots(float a, float b, float c) {
  float[] roots;
  float d = b * b - 4 * a * c;
  if (d > 0) {
    //print("2 roots   ");
    roots = new float[2];
    roots[0] = (-b - (float) Math.sqrt(d)) / (2 * a);
    roots[1] = (-b + (float) Math.sqrt(d)) / (2 * a);
  } else if (d == 0) {
    //print("1 root   ");
    roots = new float[1];
    roots[0] = -b / (2 * a);
  } else {
    roots = null;
    print("\n none roots for equation");
  }

  return roots;
}

static PVector getClosestPointOfTwo(PVector[] points, PVector hinge) {
  if (PVector.dist(points[0], hinge) > PVector.dist(points[1], hinge)) {
    return points[1];
  } else {
    return points[0];
  }
}
