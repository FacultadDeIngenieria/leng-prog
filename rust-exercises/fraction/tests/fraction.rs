use fraction::*;

#[test]
fn test_add() {
    let result = add((1, 2), (1, 4));
    assert_eq!(result, simplify(6, 8));
}

#[test]
fn test_sub() {
    let result = sub((1, 2), (1, 4));
    assert_eq!(result, simplify(2, 8));
}

#[test]
fn test_mul() {
    let result = mul((1, 2), (1, 4));
    assert_eq!(result, simplify(1, 8));
}

#[test]
fn test_divide() {
    let result = divide((1, 2), (1, 4));
    assert_eq!(result, simplify(4, 2));
}

#[test]
fn test_hcf_24_30() {
    let result = hcf(24, 30);
    assert_eq!(result, 6)
}

#[test]
fn test_hcf_30_24() {
    let result = hcf(30, 24);
    assert_eq!(result, 6)
}

#[ignore]
#[test]
fn test_add_simplifying() {
    let result = add((1, 2), (1, 4));
    assert_eq!(result, simplify(3, 4));
}
