use std::f64::consts::PI;
use std::f64;

const G: f64 = 9.807;

// Calculate the range (max x) and height (max y) of an oblique shot
// Provide the angle (in degrees) and initial velocity

pub fn oblique_shot(angle: f64, velocity: f64) -> (f64, f64) {
    let radians = angle * PI / 180.0;
    let vx = velocity * radians.cos();
    let vy = velocity * radians.sin();
    let t = 2.0 * vy / G;
    let range = vx * t;
    let time = vy * vy / (2.0 * G);
    (range, time)
}
