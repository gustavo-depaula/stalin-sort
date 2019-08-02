fn main() {
    let unsorted_data = vec![10, 30, 20, 25, 50, -1];
    let mut sorted_data = vec![unsorted_data[0]];
    let mut last = unsorted_data[0];

    for &x in unsorted_data.iter() {
        if x > last {
            sorted_data.push(x);
            last = x;
        }
    }

    println!("{:?}", sorted_data);
}
