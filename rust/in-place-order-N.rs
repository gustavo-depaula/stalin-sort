// Author Bill Wood
// in-place, order N
fn main() {
    let x = vec!(1,2,2,3,2,1,5,8,4,9,);
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
    let mut i = 1;
    let vlen = v.len();
    let mut newlen = vlen;
    while i < newlen {
        v.swap(i, i + vlen - newlen);
        if v[i] >= v[i - 1] {
            i += 1;
        } else {
            newlen -= 1;
        }
    }
    v.truncate(newlen);
    v
}
