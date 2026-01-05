# Script para limpar todos os caches do React Native
# Uso: .\scripts\clean-cache.ps1

Write-Host "🧹 Limpando caches do React Native..." -ForegroundColor Cyan

# Parar processos do Metro
Write-Host "`n🛑 Parando processos do Metro..." -ForegroundColor Yellow
$metroProcess = Get-Process -Name node -ErrorAction SilentlyContinue | Where-Object { $_.CommandLine -like "*metro*" }
if ($metroProcess) {
    Stop-Process -Name node -Force -ErrorAction SilentlyContinue
    Write-Host "✅ Processos do Metro parados" -ForegroundColor Green
}

# Limpar node_modules
Write-Host "`n📦 Limpando node_modules..." -ForegroundColor Yellow
if (Test-Path "node_modules") {
    Remove-Item -Recurse -Force "node_modules"
    Write-Host "✅ node_modules removido" -ForegroundColor Green
}

# Limpar cache do Metro
Write-Host "`n🗑️ Limpando cache do Metro..." -ForegroundColor Yellow
$metroCache = "$env:TEMP\metro-*", "$env:TEMP\haste-*"
foreach ($cache in $metroCache) {
    if (Test-Path $cache) {
        Remove-Item -Recurse -Force $cache -ErrorAction SilentlyContinue
    }
}
Write-Host "✅ Cache do Metro limpo" -ForegroundColor Green

# Limpar cache do npm
Write-Host "`n📦 Limpando cache do npm..." -ForegroundColor Yellow
npm cache clean --force
Write-Host "✅ Cache do npm limpo" -ForegroundColor Green

# Limpar build do Android
Write-Host "`n🤖 Limpando build do Android..." -ForegroundColor Yellow
if (Test-Path "android\app\build") {
    Remove-Item -Recurse -Force "android\app\build"
    Write-Host "✅ Build do Android limpo" -ForegroundColor Green
}
if (Test-Path "android\.gradle") {
    Remove-Item -Recurse -Force "android\.gradle"
    Write-Host "✅ Gradle cache limpo" -ForegroundColor Green
}

# Limpar Pods do iOS (se estiver no macOS)
Write-Host "`n🍎 Para limpar iOS (macOS apenas):" -ForegroundColor Yellow
Write-Host "   cd ios" -ForegroundColor White
Write-Host "   rm -rf Pods Podfile.lock" -ForegroundColor White
Write-Host "   pod install" -ForegroundColor White

Write-Host "`n✅ Limpeza concluída!" -ForegroundColor Green
Write-Host "`n📝 Próximos passos:" -ForegroundColor Cyan
Write-Host "   1. npm install" -ForegroundColor White
Write-Host "   2. npm start -- --reset-cache" -ForegroundColor White
Write-Host "   3. Em outro terminal: npm run android (ou ios)" -ForegroundColor White
