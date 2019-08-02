package stalinSort

import "testing"

type StalinSortTestCase struct {
    Input []int
    Expected []int
}

func GetTestCases() []StalinSortTestCase {
    return []StalinSortTestCase {
        StalinSortTestCase{
            Input: []int{ 1, 2, 10, 3, 2, 4, 15, 6, 30, 20 },
            Expected: []int{ 1, 2, 10, 15, 30 },
        },
        StalinSortTestCase{
            Input: []int{ 78, 33, 100, 61, 65, 72, 11, 66, 89, 3 },
            Expected: []int{ 78, 100 },
        },
        StalinSortTestCase{
            Input: []int{ 2, 2, 3, 1, 10 },
            Expected: []int{ 2, 3, 10 },
        },
    }
}

func TestSort(t *testing.T) {
    testcases := GetTestCases()

    for index, testcase := range testcases {
        result := SortInts(testcase.Input)

        if len(result) != len(testcase.Expected) {
            t.Fatalf("Length of result (%d) does not match length of expected result (%d) for test case #%d",
                len(result), len(testcase.Expected), index)
        } else {
            for i := 0; i < len(result); i++ {
                if result[i] != testcase.Expected[i] {
                    t.Fatalf("Expected %d at index %d but got %d instead for test case #%d",
                        testcase.Expected[i], i, result[i], index)
                }
            }
        }
    }
}
