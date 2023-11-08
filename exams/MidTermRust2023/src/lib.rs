use std::rc::Rc;

#[derive(Debug)]
pub struct Stack<T> {
    head: Option<Rc<Node<T>>>,
}

#[derive(Debug)]
struct Node<T> {
    value: T,
    next: Stack<T>,
}

impl<T> Clone for Stack<T> {

   // fn clone(&self) -> Self {
   //      Stack(match self.0 {
   //          None => { None }
   //          Some(ref n) => { Some(n.clone()) }
   //      })
   //  }
   // fn clone(&self) -> Self {
   //     if self.is_empty() {
   //         return Stack(None)
   //     }
   //     Stack(Some(self.0.as_ref().unwrap().clone()))
   // }

    // fn clone(&self) -> Self {
    //     if let Some(ref n) = self.0  {
    //         Stack(Some(n.clone()))
    //     }
    //     else {
    //         Stack(None)
    //     }
    // }

    fn clone(&self) -> Self {
        let option = self.head.as_ref();
        Stack { head: option.map(|r| r.clone()) }
    }
}

impl<T> Stack<T> {
    pub fn new() -> Self {
        Stack { head: None }
    }

    pub fn push(&self, value: T) -> Self {
        let new_node = Node {
            value: value,
            next: self.clone()
        };
        Stack { head: Some(Rc::new(new_node)) }
    }

    pub fn peek(&self) -> Option<&T> {
        match &self.head {
            None => { None }
            Some(rc) => {
                Some(&(*rc).value)   // * can be omitted
            }
        }
    }

    pub fn peek2(&self) -> Option<&T> {
        let rc = self.head.as_ref();
        if rc.is_none() { return None }
        Some(&rc.unwrap().value)
    }
    /// peek3 uses '?' instead of unwrap and avoids checking for None
    pub fn peek3(&self) -> Option<&T> {
        let rc = self.head.as_ref()?;
        Some(&rc.value)
    }

    pub fn pop(&self) -> Option<(&T, Stack<T>)> {
        match self.head {
            None => { None }
            Some(ref rc) => { Some((&rc.value, rc.next.clone())) }
        }
    }

    pub fn pop2(&self) -> Option<(&T, Stack<T>)> {
        let rc = self.head.as_ref()?;
        Some((&rc.value, rc.next.clone()))
    }

    pub fn is_empty(&self) -> bool {
        self.head.is_none()
    }
    pub fn is_empty2(&self) -> bool {
        match self.head {
            None => {true }
            Some(_) => {false}
        }
    }
}


#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn check_push() {
        let stack = Stack::new();
        assert!(stack.is_empty());

        let stack1 = stack.push(1);
        let stack2 = stack1.push(2);

        let v = stack1.peek().unwrap();
        assert_eq!(1, *v);
        assert_eq!(2, *stack2.peek().unwrap());
    }

    #[test]
    fn check_pop() {
        let stack = Stack::new();
        assert!(stack.pop().is_none());
        let stack1 = stack.push(1).push(2);
        let (v, stack2) = stack1.pop().unwrap();
        assert_eq!(2, *v);
        assert_eq!(1, *stack2.peek().unwrap());
    }
}
