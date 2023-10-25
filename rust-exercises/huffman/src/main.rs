use huffman::EncodeTable;

//
// A main function to test a couple of compress/decompress examples
//
fn main() {


    let et = EncodeTable::new("   abarca la vaca");
    println!("{et:?}");

    let compressed = et.compress("         ");
    println!("{compressed:?}");

    let original = et.decompress(compressed);
    println!("{original:?}");

    let compressed2 = et.compress("la vaca abarcaba");
    println!("{compressed2:?}");

    let original2 = et.decompress(compressed2);
    println!("{original2:?}");
}

