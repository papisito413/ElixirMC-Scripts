# DLLPARSER.ps1 PARA MENU GUI

# Lógica ejemplo: busca archivos .dll y lista propiedades
$path = "C:\ruta\a\carpeta\de\dlls"
if (-not (Test-Path $path)) {
    "No se encontró la carpeta de DLLs: $path"
    return
}

$files = Get-ChildItem -Path $path -Filter *.dll -Recurse -ErrorAction SilentlyContinue

if ($files) {
    $files | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize | Out-String
    "`n✔ Script ejecutado correctamente.`n"
} else {
    "No se encontraron archivos .dll en $path`n"
}
