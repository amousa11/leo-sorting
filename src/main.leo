// The 'leo-sorting' main function.
function main(nums: [u32; 10]) -> [u32; 10] {
    for i in 0..5 {
        let j = 9 - i;
        let min_index = i;
        let max_index = i;
        let min = nums[i];
        let max = nums[i];

        for k in i..(9-i+1) {
            if nums[k] < min {
                min = nums[k];
                min_index = k;
            } else if nums[k] > max {
                max = nums[k];
                max_index = k;
            }
        }

        let tmp = nums[i];
        nums[i] = min;
        nums[min_index] = tmp;

        let index = nums[min_index] == max ? min_index : max_index;
        tmp = nums[j];
        nums[j] = max;
        nums[index] = tmp;
    }
    return nums;
}

@test
function test_a() {
    let unsorted = [8u32, 2u32, 4u32, 3u32, 5u32, 10u32, 7u32, 1u32, 9u32, 6u32];
    let sorted = [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32];
    let result = main(unsorted);
    console.log("{}", result);
    console.assert(result == sorted);
}

@test
function test_b() {
    let unsorted = [34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32];
    let sorted = [34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32];
    let result = main(unsorted);
    console.log("{}", result);
    console.assert(result == sorted);
}

@test
function test_reversed() {
    let unsorted = [10u32, 9u32, 8u32, 7u32, 6u32, 5u32, 4u32, 3u32, 2u32, 1u32];
    let sorted = [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32];
    let result = main(unsorted);
    console.log("{}", result);
    console.assert(result == sorted);
}

@test
function test_sorted() {
    let unsorted = [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32];
    let sorted = [1u32, 2u32, 3u32, 4u32, 5u32, 6u32, 7u32, 8u32, 9u32, 10u32];
    let result = main(unsorted);
    console.log("{}", result);
    console.assert(result == sorted);
}
