use huffman::EncodeTable;

#[test]
fn check_create_encoder() {
    let em = EncodeTable::new("     abc   ");

    assert_eq!("{' ': [true], 'a': [false, true, false], 'b': [false, true, true], 'c': [false, false]}",
               format!("{em:?}"));
}


#[test]
fn check_encode() {
    let et = EncodeTable::new("     abc   ");


    assert_eq!(vec![true; 10], et.compress("          "));
}