pub struct User {
    name: String,
    age: u32,
    weight: f32,
}

impl User {
    pub fn new(name: &str, age: u32, weight: f32) -> Self { panic!("Implement me!") }

    pub fn name(&self) -> &str { panic!("Implement me!") }

    pub fn age(&self) -> u32 { panic!("Implement me!") }

    pub fn weight(&self) -> f32 { panic!("Implement me!") }

    pub fn set_age(&mut self, new_age: u32) { panic!("Implement me!") }

    pub fn set_weight(&mut self, new_weight: f32) { panic!("Implement me!") }
}
