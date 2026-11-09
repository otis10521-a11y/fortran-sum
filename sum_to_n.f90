! sum_to_n.f90 — 計算 1 + 2 + ... + N
program sum_to_n
    implicit none
    integer(kind=8) :: n, i, total, formula
    integer :: ios

    write(*, '(A)', advance='no') '請輸入正整數 N: '
    read(*, *, iostat=ios) n

    if (ios /= 0 .or. n < 1) then
        write(*, '(A)') '錯誤：請輸入一個正整數。'
        stop 1
    end if

    ! 方法一：用迴圈逐項相加
    total = 0
    do i = 1, n
        total = total + i
    end do

    ! 方法二：用高斯公式 N(N+1)/2 驗證
    formula = n * (n + 1) / 2

    write(*, '(A, I0, A, I0)') '1 加到 ', n, ' 的總和 (迴圈) = ', total
    write(*, '(A, I0)')        '高斯公式 N(N+1)/2 驗證     = ', formula

    if (total == formula) then
        write(*, '(A)') '兩種方法結果一致 ✓'
    else
        write(*, '(A)') '結果不一致！'
    end if
end program sum_to_n
