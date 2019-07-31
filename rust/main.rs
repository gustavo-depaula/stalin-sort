fn main() {
    let unsorted_data = vec![10, 30, 20, 40, 50, -1];
    let mut sorted_data = vec![unsorted_data[0]];
    let mut last = unsorted_data[0];

    for (i, _x) in unsorted_data.iter().enumerate() {
        if unsorted_data[i] > last {
            sorted_data.push(unsorted_data[i]);
        }
        last = unsorted_data[i];
    }

    println!("{:?}", sorted_data);
}
