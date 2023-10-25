use Trie::Node;


///
/// Implement a generic Trie
///
#[derive(Debug)]
pub enum Trie<T> {
    Leaf(T),
    Node(Box<Trie<T>>, Box<Trie<T>>),  // Box is needed to avoid an infinity size struct
}

impl<T> Trie<T> {
    pub fn new(p0: Trie<T>, p1: Trie<T>) -> Trie<T> {
        Node(Box::new(p0), Box::new(p1))
    }
}

#[test]
fn check_trie() {
    let ta = Trie::Leaf('a');
    assert_eq!("Leaf('a')", format!("{ta:?}"));


    let ab = Trie::new(ta, Trie::Leaf('b'));
    assert_eq!("Node(Leaf('a'), Leaf('b'))", format!("{ab:?}"));

    let abc = Trie::new(Trie::Leaf('c'), ab);
    assert_eq!("Node(Leaf('c'), Node(Leaf('a'), Leaf('b')))", format!("{abc:?}"));
}