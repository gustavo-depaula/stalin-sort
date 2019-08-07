// Author Bill Wood
// In-place sort, uses pattern matching (inspired by OCaml version)
// uses nightly-only feature slice_patterns
#![feature(slice_patterns)]
fn main() {
    let x = vec!(1,2,3,2,5,8,4,9,);
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

fn stalin_sort<T: PartialOrd>(mut v: Vec<T>) -> Vec<T> {
    match &v[..] {
        [] | [_] => v,
        [x, y, ..] if x <= y => {
            let rest = v.split_off(1);
            v.append(&mut stalin_sort(rest));
            v
        }
        _ => {
            v.remove(1);
            stalin_sort(v)
        }
    }
}
