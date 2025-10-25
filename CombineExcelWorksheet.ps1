
    $data1 = Import-Excel -Path "C:\Users\Admin\Desktop\Practices\W1.xlsx" -WorksheetName 'Sheet1'
    $data2 = Import-Excel -Path "C:\Users\Admin\Desktop\Practices\W2.xlsx" -WorksheetName 'Sheet2'
    
    $data1 | Export-Excel -Path "C:\Users\Admin\Desktop\Practices\Combined_data.xlsx" -WorksheetName 'Com1'
    $data2 | Export-Excel -Path "C:\Users\Admin\Desktop\Practices\Combined_data.xlsx" -WorksheetName 'Com2'