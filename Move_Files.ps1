# This ps.1 move multiple files from one location to another
# You will need first create a txt.file that list all the file paths of the targeted files

$Mergefile = Get-Content -Path "C:\Users\Admin\Desktop\Path.txt" #Create an variable to store the .txt
foreach ($file in $Mergefile) {
    Move-Item -Path $file -Destination "C:\Users\Admin\Desktop\IT_Skills"

}
