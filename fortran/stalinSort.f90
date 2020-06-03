program helloworld
    real, allocatable, dimension(:) :: a
    real, allocatable, dimension(:) :: b
    integer :: res_len
    
    allocate(a(10))
    a = (/ 1, 3, 2, 5, 4, 7, 6, 9, 8 /)
    
    b = stalinSort(a)
    res_len = size(b)

    do i = 1, res_len
        print *, b(i)
    end do

contains
    function stalinSort(a)
        real, allocatable, dimension(:), intent(in) :: a
        real, allocatable, dimension(:) :: tmp, stalinSort
        integer :: j, n
        n = size(a)
        allocate(tmp(n))

        j = 1
        do i = 1, n
            if ((i .eq. 1) .or. (a(i) .gt. a(i - 1))) then
                tmp(j) = a(i)
                j = j + 1
            end if
        end do

        allocate(stalinSort(j - 1))
        stalinSort = tmp(:j - 1)
    end function stalinSort
end program helloworld