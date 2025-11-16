# ------------------------------------------------------------
# 1. GUI – Collect two log file paths
# ------------------------------------------------------------
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Select Log Files for Excel Processing'
$form.Size = New-Object System.Drawing.Size(560,180)
$form.StartPosition = 'CenterScreen'
$form.FormBorderStyle = 'FixedDialog'
$form.MaximizeBox = $false

# ---- Access Log ------------------------------------------------
$lbl1 = New-Object System.Windows.Forms.Label
$lbl1.Location = New-Object System.Drawing.Point(20,20)
$lbl1.Size = New-Object System.Drawing.Size(120,23)
$lbl1.Text = 'Access Log file path:'
$lbl1.Font = New-Object System.Drawing.Font('Segoe UI',9)
$form.Controls.Add($lbl1)

$txt1 = New-Object System.Windows.Forms.TextBox
$txt1.Location = New-Object System.Drawing.Point(125,20)
$txt1.Size = New-Object System.Drawing.Size(300,23)
$form.Controls.Add($txt1)

$btn1 = New-Object System.Windows.Forms.Button
$btn1.Location = New-Object System.Drawing.Point(430,20)
$btn1.Size = New-Object System.Drawing.Size(75,23)
$btn1.Text = 'Browse'
$btn1.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$form.Controls.Add($btn1)

# ---- Data Log --------------------------------------------------
$lbl2 = New-Object System.Windows.Forms.Label
$lbl2.Location = New-Object System.Drawing.Point(20,60)
$lbl2.Size = New-Object System.Drawing.Size(120,23)
$lbl2.Text = 'Ivanti log file path:'
$lbl2.Font = New-Object System.Drawing.Font('Segoe UI',9)
$form.Controls.Add($lbl2)

$txt2 = New-Object System.Windows.Forms.TextBox
$txt2.Location = New-Object System.Drawing.Point(125,60)
$txt2.Size = New-Object System.Drawing.Size(300,23)
$form.Controls.Add($txt2)

$btn2 = New-Object System.Windows.Forms.Button
$btn2.Location = New-Object System.Drawing.Point(430,60)
$btn2.Size = New-Object System.Drawing.Size(75,23)
$btn2.Text = 'Browse'
$btn2.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$form.Controls.Add($btn2)

# ---- OK / Cancel -----------------------------------------------
$btnOK = New-Object System.Windows.Forms.Button
$btnOK.Location = New-Object System.Drawing.Point(300,110)
$btnOK.Size = New-Object System.Drawing.Size(75,30)
$btnOK.Text = 'OK'
$btnOK.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$btnOK.DialogResult = 'OK'
$form.AcceptButton = $btnOK
$form.Controls.Add($btnOK)

$btnCancel = New-Object System.Windows.Forms.Button
$btnCancel.Location = New-Object System.Drawing.Point(390,110)
$btnCancel.Size = New-Object System.Drawing.Size(75,30)
$btnCancel.Text = 'Cancel'
$btnCancel.Font = New-Object System.Drawing.Font('Segoe UI', 9)
$btnCancel.DialogResult = 'Cancel'
$form.CancelButton = $btnCancel
$form.Controls.Add($btnCancel)

# ---- Browse dialogs (EXCEL ONLY) --------------------------------
$ofd = New-Object System.Windows.Forms.OpenFileDialog
$ofd.Filter = 'Excel Files (*.xlsx;*.xls;*.xlsm)|*.xlsx;*.xls;*.xlsm|All Files (*.*)|*.*'
$ofd.Title  = 'Select an Excel File'
$ofd.CheckFileExists = $true
$ofd.CheckPathExists = $true
$ofd.Multiselect     = $false

$btn1.Add_Click({ 
    if ($ofd.ShowDialog() -eq 'OK') { 
        $txt1.Text = $ofd.FileName 
    } 
})
$btn2.Add_Click({ 
    if ($ofd.ShowDialog() -eq 'OK') { 
        $txt2.Text = $ofd.FileName 
    } 
})

# ------------------------------------------------------------
# 2. Show GUI and capture paths
# ------------------------------------------------------------
if ($form.ShowDialog() -eq 'OK') {
    Write-Host "File paths have been captured" -ForegroundColor Green
    $filepath1 = $txt1.Text.Trim() # Access Log
    $filepath2 = $txt2.Text.Trim() # Data Log
}
else {
    Write-Host "User cancelled the operation." -ForegroundColor Yellow
}
# ------------------------------------------------------------
# 3. Excel-processing function
# ------------------------------------------------------------
