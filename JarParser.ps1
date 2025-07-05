# JARPARSER.ps1 PARA MENU GUI

# Ejemplo de lógica: busca archivos .jar y lista propiedades básicas
$path = "C:\ruta\a\carpeta\de\jars"
if (-not (Test-Path $path)) {
    "No se encontró la carpeta de JARs: $path"
    return
}

$files = Get-ChildItem -Path $path -Filter *.jar -Recurse -ErrorAction SilentlyContinue

if ($files) {
    $files | Select-Object Name, Length, LastWriteTime | Format-Table -AutoSize | Out-String
    "`n✔ Script ejecutado correctamente.`n"
} else {
    "No se encontraron archivos .jar en $path`n"
}
