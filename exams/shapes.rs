use std::f64::consts::PI;

#[derive(PartialEq, Debug)]
pub struct Point(pub f64, pub f64);

pub trait Shape {
    fn area(&self) -> f64;
    fn container_box(&self, center: &Point) -> (Point, Point);
}

pub struct Circle {
    pub radius: f64,
}

impl Circle {
    pub fn new(radius: f64) -> Box<dyn Shape> {
        Box::new(Circle { radius })
    }
}

impl Shape for Circle {
    fn area(&self) -> f64 {
        PI * self.radius * self.radius
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        let Point(x, y) = center;
        (Point(x - self.radius, y - self.radius), Point(x + self.radius, y + self.radius))
    }
}

pub struct Rectangle {
    pub width: f64,
    pub height: f64,
}

impl Rectangle {
    pub fn new(width: f64, height: f64) -> Box<dyn Shape> {
        Box::new(Rectangle { width, height })
    }
}

impl Shape for Rectangle {
    fn area(&self) -> f64 {
        return self.width * self.height;
    }

    fn container_box(&self, center: &Point) -> (Point, Point) {
        let Point(x, y) = center;
        let w2 = self.width / 2.0;
        let h2 = self.height / 2.0;
        return (Point(x - w2, y - h2), Point(x + w2, y + w2));
    }
}

pub struct Canvas {
    width: f64,
    height: f64,
    pub shapes: Vec<(Point, Box<dyn Shape>)>,
}

impl Canvas {
    pub fn new(width: f64, height: f64) -> Self {
        Canvas { width, height, shapes: Vec::new() }
    }
    pub fn add(&mut self, place: Point, shape: Box<dyn Shape>) {
        self.shapes.push((place, shape))
    }
    pub fn sum_areas(&self) -> f64 {
        self.shapes.iter().map(|(_, s)| s.area()).sum()
    }

    pub fn move_all(&mut self, shift_x: f64, shift_y: f64) -> bool {
        for (c, s) in &self.shapes {
            let (Point(low_x, low_y), Point(top_x, top_y)) = s.container_box(c);
            if low_x < 0.0 || low_y < 0.0 || top_x > self.width || top_y > self.height {
                return false;
            }
        }
        for (c, _) in &mut self.shapes {
            let Point(x, y) = c;
            *c = Point(*x + shift_x, *y + shift_y);
        }
        return true;
    }
}