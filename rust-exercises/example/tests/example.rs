use example::*;

#[test]
fn test_oblique_shot() {

    let (range, time) = oblique_shot(45.0, 10.0);
    assert_eq!(round(range), 10.2);
    assert_eq!(round(time), 2.55);
}

fn round(x: f64) -> f64 {
    (x * 100.0).round() / 100.0
}