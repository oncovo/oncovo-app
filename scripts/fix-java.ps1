# Script para configurar Java 17 para Gradle
# Uso: .\scripts\fix-java.ps1

Write-Host "☕ Configurando Java 17 para Gradle..." -ForegroundColor Cyan

# Encontrar Java 17
$java17Path = $null
$possiblePaths = @(
    "C:\Program Files\Java\jdk-17",
    "C:\Program Files\Java\jdk17",
    "C:\Program Files\Eclipse Adoptium\jdk-17*",
    "C:\Program Files\Eclipse Adoptium\jdk17*"
)

foreach ($path in $possiblePaths) {
    $found = Get-ChildItem $path -ErrorAction SilentlyContinue | Where-Object { 
        Test-Path (Join-Path $_.FullName "bin\java.exe") 
    } | Select-Object -First 1
    
    if ($found) {
        $javaExe = Join-Path $found.FullName "bin\java.exe"
        $version = & $javaExe -version 2>&1 | Select-String "version"
        if ($version -match "17|18|19|20|21") {
            $java17Path = $found.FullName
            Write-Host "✅ Java 17 encontrado: $java17Path" -ForegroundColor Green
            Write-Host "   Versão: $version" -ForegroundColor Gray
            break
        }
    }
}

if (-not $java17Path) {
    Write-Host "❌ Java 17 não encontrado!" -ForegroundColor Red
    Write-Host "`n📝 Instale Java 17 ou superior:" -ForegroundColor Yellow
    Write-Host "   - Oracle JDK: https://www.oracle.com/java/technologies/downloads/#java17" -ForegroundColor White
    Write-Host "   - Eclipse Adoptium: https://adoptium.net/temurin/releases/?version=17" -ForegroundColor White
    exit 1
}

# Configurar gradle.properties
$gradleProps = "android\gradle.properties"
if (Test-Path $gradleProps) {
    $content = Get-Content $gradleProps -Raw
    
    # Converter caminho para formato do Gradle (barras duplas)
    $gradlePath = $java17Path -replace '\\', '\\'
    
    if ($content -match "org\.gradle\.java\.home=") {
        $content = $content -replace "org\.gradle\.java\.home=.*", "org.gradle.java.home=$gradlePath"
        Write-Host "✅ gradle.properties atualizado" -ForegroundColor Green
    } else {
        $content += "`n# Java version configuration`norg.gradle.java.home=$gradlePath`n"
        Write-Host "✅ gradle.properties atualizado (nova entrada)" -ForegroundColor Green
    }
    
    Set-Content $gradleProps $content
} else {
    Write-Host "❌ gradle.properties não encontrado!" -ForegroundColor Red
    exit 1
}

# Parar daemons do Gradle
Write-Host ""
Write-Host "Parando daemons do Gradle..." -ForegroundColor Yellow
Push-Location android
.\gradlew --stop 2>&1 | Out-Null
Pop-Location
Write-Host "✅ Daemons parados" -ForegroundColor Green

Write-Host "`n✅ Configuração concluída!" -ForegroundColor Green
Write-Host "`n📝 Próximos passos:" -ForegroundColor Cyan
Write-Host "   1. cd android" -ForegroundColor White
Write-Host "   2. .\gradlew clean" -ForegroundColor White
Write-Host "   3. cd .." -ForegroundColor White
Write-Host "   4. npm run android" -ForegroundColor White
