use fraction_type::*;

#[test]
fn test_add() {
    let result = Fraction(1,2).add(Fraction(1,4));
    assert_eq!(result, Fraction(3, 4));
}

#[test]
fn test_sub() {
    let result = Fraction(1,2).sub(Fraction(1,4));
    assert_eq!(result, Fraction(1, 4));
}
#[test]
fn test_mul() {
     let result = Fraction(1, 2).mul(Fraction(1, 4));
     assert_eq!(result, Fraction(1, 8));
}
#[test]
fn test_divide() {
    let result = Fraction(1, 2).divide(Fraction(1, 4));
    assert_eq!(result, Fraction(2, 1));
}

#[test]
fn test_add_operator() {
    let result = Fraction(1,2) + Fraction(1,4);
    assert_eq!(result, Fraction(3, 4));
}