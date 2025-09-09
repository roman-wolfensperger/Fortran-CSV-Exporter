! Test_array.f90
!
! FUNCTIONS:
! Test_array - Entry point of console application.
!
!****************************************************************************
!
!  PROGRAM: Test_array
!
!
! PURPOSE: Entry point for the console application.
!
!****************************************************************************

! Includes the module file that contains the subroutines for exporting data.
! This is a simple way to combine the source files for compilation.
include "export_csv.f90"
    
program Test_array
    ! This statement makes the procedures and variables from the 'export_csv' module available to this program.
    use export_csv
    implicit none

    ! Variables
    ! Define a constant for the array dimension.
    integer, parameter :: dim=10
    ! Declare loop counters.
    integer j, k
    ! Declare a 1D integer array with the specified dimension.
    integer, dimension(dim) :: Tab1
    
    
    ! Body of Test_array
    ! Initialize the array 'Tab1' with values from 10 down to 1 using an array constructor.
    Tab1 = (/ (10-j,j=0,9) /)
    ! Print a welcome message to the console.
    print *, 'Hello World'
    ! Loop through the array and print each element's value to the console.
    do k=1, dim
        print *, Tab1(k)
    end do
    ! Call the 'int_1D_export' subroutine from the 'export_csv' module.
    ! It exports the 'Tab1' array to a file named 'data.csv'.
    call int_1D_export('data.csv',Tab1,dim)
    ! Pause the program execution and wait for user input.
    read(*,*)

end program Test_array