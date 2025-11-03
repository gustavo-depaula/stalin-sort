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

fn stalin_sort<T: PartialOrd + Clone>(x: Vec<T>) -> Vec<T> {
    stalin_sort_iter(x.into_iter()).collect()
}

fn stalin_sort_iter<T: PartialOrd + Clone>(
    arr: impl Iterator<Item = T>,
) -> impl Iterator<Item = T> {
    arr.scan(None, |running_max, n| {
        *running_max =
            Some(
                running_max
                    .clone()
                    .map_or(n.clone(), |m: T| if n > m { n.clone() } else { m.clone() }),
            );
        Some((running_max.clone().unwrap(), n))
    })
    .filter_map(|(max, n)| if max == n { Some(n) } else { None })
}
