! export_csv.f90
!
!****************************************************************************
!
! @file export_csv.f90
! @brief Module to export 1D arrays to a CSV file.
!
! @details This module contains subroutines for writing one-dimensional
! arrays of different data types to a CSV file. It's designed to be
! reusable and easily included in other Fortran programs.
!
!****************************************************************************
    
module export_csv
    implicit none

    contains
        
        !********************************************************************
        !
        ! Functions
        !
        !******************************************************************** !> @brief Exports a 1D integer array to a CSV file.
        !! @param file_name The name of the output CSV file.
        !! @param array The 1D integer array to be exported.
        !! @param dim_array The dimension (size) of the array.
        !! @details This subroutine opens a file and writes each element of the array
        !! on a new line, following the format "index, "value"". It uses a Fortran
        !! format specifier (I4,A,I10,A) to ensure proper spacing and quoting for the output.
        subroutine int_1D_export(file_name,array,dim_array)
            implicit none
            
            character(len=*) file_name
            integer, dimension(*) :: array
            integer dim_array, i, file_unit, rc

            open(action='write', file=file_name, iostat=rc, newunit=file_unit, status='replace')

            if (rc /= 0) then
                print '(3a)', 'Error: opening file "', file_name, '" failed'
                stop
            end if
            
            ! Write data to file in CSV format.
            do i=1, dim_array
                ! integer 10 digits
                write (file_unit,'(I4,A,I10,A)') i, ',"', array(i), '"'
            end do

            close (file_unit)
            
        end subroutine int_1D_export
        
        !> @brief Exports a 1D real*8 (double precision) array to a CSV file.
        !! @param file_name The name of the output CSV file.
        !! @param array The 1D real*8 array to be exported.
        !! @param dim_array The dimension (size) of the array.
        !! @details This subroutine is similar to int_1D_export but is tailored for
        !! real*8 data types. It writes each element on a new line. The format
        !! specifier (I4,A,F,A) handles the specific formatting for floating-point numbers.
        subroutine real8_1D_export(file_name,array,dim_array)
            
            implicit none
            
            character(len=*) file_name
            real*8, dimension(*) :: array
            integer dim_array, i, file_unit, rc

            open(action='write', file=file_name, iostat=rc, newunit=file_unit, status='replace')

            if (rc /= 0) then
                print '(3a)', 'Error: opening file "', file_name, '" failed'
                stop
            end if
            
            ! Write data to file in CSV format.
            do i=1, dim_array
                ! integer 10 digits
                write (file_unit,'(I4,A,F,A)') i, ',"', array(i), '"'
            end do

            close (file_unit)
            
        end subroutine real8_1D_export

end module export_csv
