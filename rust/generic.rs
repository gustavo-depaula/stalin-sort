// Author Bill Wood
fn main() {
    let x = vec!(1,2,3,2,5,8,4,9);
    println!("{:?}", stalin_sort(x));
    let x = vec!('a','b','c','b','e','g','d','x');
    println!("{:?}", stalin_sort(x));
    let ideologies = vec!(
        "Fully Automated Luxury Space Communism",
        "Socialism",
        "Capitalism",
        "Communism",
    );
    println!("{:?}", stalin_sort(ideologies));
}

fn stalin_sort<T: PartialOrd>(x: Vec<T>) -> Vec<T> {
    let mut y = vec!();
    for v in x {
        if y.len() == 0 || &v >= y.last().unwrap() {
            y.push(v);
        }
    }
    y
}
