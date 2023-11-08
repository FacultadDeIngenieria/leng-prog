use std::mem::replace;

#[derive(Debug)]
pub struct MutStack<T> {
    head: NodeRef<T>,
}

type NodeRef<T> = Option<Box<Node<T>>>;

#[derive(Debug)]
struct Node<T> {
    value: T,
    next: NodeRef<T>,
}

impl<T> MutStack<T> {
    pub fn new() -> Self {
        MutStack { head: None }
    }

    pub fn push(&mut self, value: T) -> &mut Self {
        let dest = &mut self.head;
        let node = Node {
            value,
            next: replace(dest, None),
        };
        self.head = Some(Box::new(node));
        self
    }

    pub fn peek(&self) -> Option<&T> {
        self.head.as_ref().map(|node| &node.value)
    }
    pub fn pop(&mut self) -> Option<T> {
        let old_head = self.head.take()?;
        self.head = old_head.next;
        Some(old_head.value)
    }


    pub fn is_empty(&self) -> bool {
        self.head.is_none()
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn check_push() {
        let mut stack = MutStack::new();
        assert!(stack.is_empty());

        stack.push(1);
        assert_eq!(1, *stack.peek().unwrap());

        stack.push(2);
        assert_eq!(2, *stack.peek().unwrap());
        assert_eq!(2, stack.pop().unwrap());
        assert_eq!(1, *stack.peek().unwrap());
    }

    #[test]
    fn check_pop() {
        let mut stack = MutStack::new();
        assert!(stack.pop().is_none());
        stack.push(1).push(2);
        let v = stack.pop().unwrap();
        assert_eq!(2, v);
    }
}
