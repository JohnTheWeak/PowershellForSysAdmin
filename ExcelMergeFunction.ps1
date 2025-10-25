#This PowerShell function merges excel worksheets from multiple .xlsx to one excel file

$files = Get-ChildItem -Path "C:\Users\Admin\Desktop\Practices" #stored the files in var


foreach ($file in $files) {                                                   #For each items in the folder
    $sheetname = $file.BaseName                                               #put the WorksheetName into var $sheetname, the .Basedname allow ps to read the original name and use it
    $data = Import-Excel $file.FullName
    Export-Excel -Path "C:\Users\Admin\Desktop\MergedExcel.xlsx" -WorksheetName $sheetname -InputObject $data #exported the data to the desination with data stored in var data
    

}
