! sum_to_n.f90 — 計算 1 + 2 + ... + N
! （本行為檔案說明註解：程式名稱與用途）
program sum_to_n                                 ! 宣告主程式開始，程式名稱為 sum_to_n
    implicit none                                ! 關閉隱式型別宣告，所有變數都必須明確宣告
    integer(kind=8) :: n, i, total, formula      ! 宣告 64 位元整數：n=上限、i=迴圈計數、total=迴圈總和、formula=公式結果
    integer :: ios                               ! 宣告整數 ios，用來接收讀取輸入時的狀態碼（0 代表成功）

    write(*, '(A)', advance='no') '請輸入正整數 N: '   ! 在螢幕印出提示文字，advance='no' 讓游標停在同一行
    read(*, *, iostat=ios) n                     ! 從鍵盤讀入 n，讀取狀態存入 ios（輸入非數字時 ios 不為 0）

    if (ios /= 0 .or. n < 1) then                ! 若讀取失敗或 n 小於 1，視為不合法輸入
        write(*, '(A)') '錯誤：請輸入一個正整數。'   ! 印出錯誤訊息
        stop 1                                   ! 以錯誤碼 1 結束程式
    end if                                       ! 結束 if 判斷

    ! 方法一：用迴圈逐項相加
    total = 0                                    ! 總和變數歸零，作為累加的起點
    do i = 1, n                                  ! 迴圈開始：i 從 1 依序跑到 n
        total = total + i                        ! 每一圈把目前的 i 加進 total
    end do                                       ! 迴圈結束

    ! 方法二：用高斯公式 N(N+1)/2 驗證
    formula = n * (n + 1) / 2                    ! 先算 n*(n+1)（必為偶數），再除以 2，得到公式解

    write(*, '(A, I0, A, I0)') '1 加到 ', n, ' 的總和 (迴圈) = ', total   ! 印出迴圈結果；I0 表示整數用最短寬度輸出
    write(*, '(A, I0)')        '高斯公式 N(N+1)/2 驗證     = ', formula  ! 印出公式結果

    if (total == formula) then                   ! 比較兩種方法的結果是否相等
        write(*, '(A)') '兩種方法結果一致 ✓'       ! 相等時印出一致訊息
    else                                         ! 否則（結果不相等）
        write(*, '(A)') '結果不一致！'             ! 印出不一致警告
    end if                                       ! 結束 if 判斷
end program sum_to_n                             ! 主程式結束
