use circular_buffer::{CircularBuffer, Error};
use std::rc::Rc;

#[test]
fn error_on_read_empty_buffer() {
    let mut buffer = CircularBuffer::<char>::new(1);
    assert_eq!(Err(Error::EmptyBuffer), buffer.read());
}

#[test]

fn can_read_item_just_written() {
    let mut buffer = CircularBuffer::new(1);
    assert!(buffer.write('1').is_ok());
    assert_eq!(Ok('1'), buffer.read());
}

#[test]

fn each_item_may_only_be_read_once() {
    let mut buffer = CircularBuffer::new(1);
    assert!(buffer.write('1').is_ok());
    assert_eq!(Ok('1'), buffer.read());
    assert_eq!(Err(Error::EmptyBuffer), buffer.read());
}

#[test]

fn items_are_read_in_the_order_they_are_written() {
    let mut buffer = CircularBuffer::new(2);
    assert!(buffer.write('1').is_ok());
    assert!(buffer.write('2').is_ok());
    assert_eq!(Ok('1'), buffer.read());
    assert_eq!(Ok('2'), buffer.read());
    assert_eq!(Err(Error::EmptyBuffer), buffer.read());
}

#[test]

fn full_buffer_cant_be_written_to() {
    let mut buffer = CircularBuffer::new(1);
    assert!(buffer.write('1').is_ok());
    assert_eq!(Err(Error::FullBuffer), buffer.write('2'));
}

#[test]

fn read_frees_up_capacity_for_another_write() {
    let mut buffer = CircularBuffer::new(1);
    assert!(buffer.write('1').is_ok());
    assert_eq!(Ok('1'), buffer.read());
    assert!(buffer.write('2').is_ok());
    assert_eq!(Ok('2'), buffer.read());
}

#[test]

fn read_position_is_maintained_even_across_multiple_writes() {
    let mut buffer = CircularBuffer::new(3);
    assert!(buffer.write('1').is_ok());
    assert!(buffer.write('2').is_ok());
    assert_eq!(Ok('1'), buffer.read());
    assert!(buffer.write('3').is_ok());
    assert_eq!(Ok('2'), buffer.read());
    assert_eq!(Ok('3'), buffer.read());
}

#[test]

fn items_cleared_out_of_buffer_cant_be_read() {
    let mut buffer = CircularBuffer::new(1);
    assert!(buffer.write('1').is_ok());
    buffer.clear();
    assert_eq!(Err(Error::EmptyBuffer), buffer.read());
}

#[test]

fn clear_frees_up_capacity_for_another_write() {
    let mut buffer = CircularBuffer::new(1);
    assert!(buffer.write('1').is_ok());
    buffer.clear();
    assert!(buffer.write('2').is_ok());
    assert_eq!(Ok('2'), buffer.read());
}

#[test]

fn clear_does_nothing_on_empty_buffer() {
    let mut buffer = CircularBuffer::new(1);
    buffer.clear();
    assert!(buffer.write('1').is_ok());
    assert_eq!(Ok('1'), buffer.read());
}

#[test]

fn clear_actually_frees_up_its_elements() {
    let mut buffer = CircularBuffer::new(1);
    let element = Rc::new(());
    assert!(buffer.write(Rc::clone(&element)).is_ok());
    assert_eq!(Rc::strong_count(&element), 2);
    buffer.clear();
    assert_eq!(Rc::strong_count(&element), 1);
}

#[test]

fn integer_buffer() {
    let mut buffer = CircularBuffer::new(2);
    assert!(buffer.write(1).is_ok());
    assert!(buffer.write(2).is_ok());
    assert_eq!(Ok(1), buffer.read());
    assert!(buffer.write(-1).is_ok());
    assert_eq!(Ok(2), buffer.read());
    assert_eq!(Ok(-1), buffer.read());
    assert_eq!(Err(Error::EmptyBuffer), buffer.read());
}

#[test]

fn string_buffer() {
    let mut buffer = CircularBuffer::new(2);
    buffer.write("".to_string()).unwrap();
    buffer.write("Testing".to_string()).unwrap();
    assert_eq!(0, buffer.read().unwrap().len());
    assert_eq!(Ok("Testing".to_string()), buffer.read());
}
