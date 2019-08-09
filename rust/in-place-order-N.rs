// Author Bill Wood
// in-place, order N
fn main() {
    let mut x = vec!(1,2,2,3,2,1,5,8,4,9,);
    println!("{:?}", stalin_sort(&mut x));
    let mut x = vec!('a','b','c','b','e','g','d','x');
    println!("{:?}", stalin_sort(&mut x));
    let mut ideologies = vec!(
        "Fully Automated Luxury Space Communism",
        "Socialism",
        "Capitalism",
        "Communism",
    );
    println!("{:?}", stalin_sort(&mut ideologies));
}

fn stalin_sort<T: PartialOrd>(v: &mut [T]) -> &[T] {
    let mut i = 1;
    let mut len = v.len();
    while i < len {
        v.swap(i, i + v.len() - len);
        if v[i] >= v[i - 1] {
            i += 1;
        } else {
            len -= 1;
        }
    }
    &v[..len]
}
