# JARPARSER.ps1 PARA MENU GUI

$path = "C:\ruta\a\carpeta\de\jars"   # <-- CAMBIA ESTA RUTA POR LA TUYA REAL

if (-not (Test-Path $path)) {
    Write-Output "No se encontró la carpeta de JARs: $path"
    return
}

$files = Get-ChildItem -Path $path -Filter *.jar -Recurse -ErrorAction SilentlyContinue

if ($files) {
    $out = $files | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize | Out-String
    $out += "`n✔ Script ejecutado correctamente.`n"
    Write-Output $out
} else {
    Write-Output "No se encontraron archivos .jar en $path`n"
}
