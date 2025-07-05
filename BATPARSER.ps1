# BATPARSER.ps1 PARA MENU GUI

# Lógica ejemplo: busca archivos .bat y lista propiedades
$path = "C:\ruta\a\carpeta\de\bats"
if (-not (Test-Path $path)) {
    "No se encontró la carpeta de BATs: $path"
    return
}

$files = Get-ChildItem -Path $path -Filter *.bat -Recurse -ErrorAction SilentlyContinue

if ($files) {
    $files | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize | Out-String
    "`n✔ Script ejecutado correctamente.`n"
} else {
    "No se encontraron archivos .bat en $path`n"
}
