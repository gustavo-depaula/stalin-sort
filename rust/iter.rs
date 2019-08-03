use std::cmp::Ordering;
use std::iter::Peekable;

pub struct StalinSorted<I: Iterator, F> {
    iter: Peekable<I>,
    compare: F,
}

impl<I, F> StalinSorted<I, F>
where
    I: Iterator,
{
    pub fn new(iter: I, compare: F) -> StalinSorted<I, F>
    {
        Self {
            iter: iter.peekable(),
            compare,
        }
    }
}

impl<I, F> Iterator for StalinSorted<I, F>
where
    I: Iterator,
    F: FnMut(&I::Item, &I::Item) -> Option<Ordering>,
{
    type Item = I::Item;

    fn next(&mut self) -> Option<Self::Item> {
        if let Some(current) = self.iter.next() {
            while let Some(next) = self.iter.peek() {
                match (self.compare)(next, &current) {
                    Some(Ordering::Less) | None => self.iter.next(),
                    _ => break,
                };
            }

            Some(current)
        } else {
            None
        }
    }
}

pub trait IteratorExt: Iterator
where
    Self: Iterator,
{
    #[allow(clippy::type_complexity)]
    fn stalin_sorted(self) -> StalinSorted<Self, fn(&Self::Item, &Self::Item) -> Option<Ordering>>
    where
        Self: Sized,
        Self::Item: PartialOrd,
    {
        self.stalin_sorted_by(|a, b| a.partial_cmp(b))
    }

    fn stalin_sorted_by<F>(self, compare: F) -> StalinSorted<Self, F>
    where
        Self: Sized,
        F: FnMut(&Self::Item, &Self::Item) -> Option<Ordering>,
    {
        StalinSorted::new(self, compare)
    }
}

impl<I> IteratorExt for I where I: Iterator {}

#[test]
fn stalin_sorts_correctly() {
    fn check(input: &[usize], expected: &[usize]) {
        assert_eq!(
            input.iter().copied().stalin_sorted().collect::<Vec<_>>(),
            expected
        );
    }

    check(&[1, 2, 3, 4, 5, 6, 7, 8, 9], &[1, 2, 3, 4, 5, 6, 7, 8, 9]);
    check(&[9, 8, 7, 6, 5, 4, 3, 2, 1], &[9]);
    check(&[1, 2, 10, 3, 2, 4, 15, 6, 30, 20], &[1, 2, 10, 15, 30]);
    check(&[78, 33, 100, 61, 65, 72, 11, 66, 89, 3], &[78, 100]);
    check(&[2, 2, 3, 1, 10], &[2, 2, 3, 10]);
}

fn main() {
    let ideologies = [
        "Fully Automated Luxury Gay Space Communism",
        "Socialism",
        "Capitalism",
        "Communism",
    ];
    for ideology in ideologies.iter().stalin_sorted() {
        println!("{}", ideology);
    }
}
