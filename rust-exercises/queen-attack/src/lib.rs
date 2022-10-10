#[derive(Debug)]
pub struct ChessPosition(i32, i32);

#[derive(Debug)]
pub struct Queen {
    position: ChessPosition
}

impl ChessPosition {
    pub fn new(rank: i32, file: i32) -> Option<Self> {
        panic!("Implement me");
    }
}

impl Queen {
    pub fn new(position: ChessPosition) -> Self {
        panic!("Implement me");
    }

    pub fn can_attack(&self, other: &Queen) -> bool {
    panic!("Implement me");
}
}
