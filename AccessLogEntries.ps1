$access_log = Import-Excel -Path "C:\Users\Admin\Desktop\Access_log.xlsx" -NoHeader
$data       = Import-Excel -Path "C:\Users\Admin\Desktop\data.xlsx" -NoHeader

# --- Add correct headers ---
$access_log = $access_log | Select-Object `
    @{Name='Name';        Expression={$_.'P1'}}, `
    @{Name='date';        Expression={$_.'P2'}}, `
    @{Name='location';    Expression={$_.'P3'}}, `
    @{Name='Description'; Expression={$_.'P4'}}

$data = $data | Select-Object `
    @{Name='Name';        Expression={$_.'P1'}}, `
    @{Name='date';        Expression={$_.'P2'}}, `
    @{Name='StartingTime';Expression={$_.'P3'}}, `
    @{Name='EndingTime';  Expression={$_.'P4'}}, `
    @{Name='Cowoker';     Expression={$_.'P5'}}, `
    @{Name='ID';          Expression={$_.'P6'}}
    
# --- Filter Data Center ---
$dc = $access_log | Where-Object { $_.location -like "*Data center*" }

# --- Build checking ---
$checking = foreach ($row in $dc) {
    $match = $data | Where-Object {
        $_.Name -eq $row.Name -and $_.date -eq $row.date
    } | Select-Object -First 1

    if (-not $match) {
        $match = $data | Where-Object {
            $_.Cowoker -eq $row.Name -and $_.date -eq $row.date
        } | Select-Object -First 1
    }

    $id = if ($match) { $match.ID } else { "" }

    [PSCustomObject]@{
        Name        = $row.Name
        Date        = $row.date
        location    = $row.location
        Description = $row.Description
        ID          = $id
    }
}

$checking | Export-Excel -Path "C:\Users\Admin\Desktop\Dec_2025.xlsx" -WorksheetName "checking"