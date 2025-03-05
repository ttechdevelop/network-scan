# получаем путь к директории скрипта
$scriptDir = $PSScriptRoot
$scanResultsPath = "$scriptDir\ScanResults.txt"

# очистка файла перед началом сканирования
Clear-Content -Path $scanResultsPath -ErrorAction SilentlyContinue

# время ожидания (в миллисекундах) ответа от хоста
$timeout = 10 

for ($i = 1; $i -le 254; $i++) {
    $ip = "172.20.0.$i"
    
    # используем ping для проверки доступности
    $pingResult = Test-Connection -ComputerName $ip -Count 1 -Quiet

    if ($pingResult) {
        # сохраняем результат в файл
        Add-Content -Path $scanResultsPath -Value "$ip доступен"
    }
}
