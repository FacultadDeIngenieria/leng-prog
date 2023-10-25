use std::cmp::Ordering;
use crate::trie::Trie;
use crate::trie::Trie::Leaf;


///
/// HeapEntry is the struct that will be stored in the Heap to create the huffman Trie
///
#[derive(Debug)]
pub struct HeapEntry(u64, Trie<char>);

impl HeapEntry {
    ///
    /// Create a HeapEntry from a char and the number of its occurrences
    ///
    pub fn new(count: u64, chr: char) -> HeapEntry { HeapEntry(count, Leaf(chr)) }

    ///
    /// Combine to Heap Entries adding up the number of occurrences and creating a new Trie Node
    ///
    pub fn combine(self, other: HeapEntry) -> HeapEntry {
        HeapEntry(self.0 + other.0, Trie::new(self.1, other.1))
    }

    ///
    /// Helper function to avoid making the Trie field public
    ///
    pub fn trie(self) -> Trie<char> { self.1 }
}

///
/// I need to implement Ord for storing elements in the Heap
/// So I need to implement PartialOrd and Eq
/// Comparison is inverted to ensure that elements are stored in reversed order in the Heap
///
impl Ord for HeapEntry {
    fn cmp(&self, other: &HeapEntry) -> Ordering {
        other.0.cmp(&self.0)
    }
}

///
/// Ord requires PartialOrd Implementation
///
impl PartialOrd<Self> for HeapEntry {
    fn partial_cmp(&self, other: &HeapEntry) -> Option<Ordering> { other.0.partial_cmp(&self.0) }
}

///
/// And Eq also
/// I just let it empty, but PartialEq should be implemented
///
impl Eq for HeapEntry {}

impl PartialEq<Self> for HeapEntry {
    fn eq(&self, other: &HeapEntry) -> bool {
        self.0 == other.0
    }
}


#[test]
fn check_heap_cmp() {
    let e0 = HeapEntry::new(1, 'x');
    let e1 = HeapEntry::new(1, 'a');
    let e2 = HeapEntry::new(2, 'a');
    assert!(e1 > e2);
    assert_eq!(e0, e1);
}
