# Script para limpar TUDO e reiniciar
# Uso: .\scripts\clean-all.ps1

Write-Host "🧹 Limpeza Completa do Projeto..." -ForegroundColor Cyan

# Parar processos
Write-Host "`n🛑 Parando processos..." -ForegroundColor Yellow
Get-Process -Name node -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 2

# Limpar node_modules
Write-Host "`n📦 Removendo node_modules..." -ForegroundColor Yellow
if (Test-Path "node_modules") {
    Remove-Item -Recurse -Force "node_modules"
    Write-Host "✅ node_modules removido" -ForegroundColor Green
}

# Limpar package-lock
Write-Host "`n📄 Removendo package-lock.json..." -ForegroundColor Yellow
if (Test-Path "package-lock.json") {
    Remove-Item -Force "package-lock.json"
    Write-Host "✅ package-lock.json removido" -ForegroundColor Green
}

# Limpar caches
Write-Host ""
Write-Host "Limpando caches..." -ForegroundColor Yellow
$caches = @(
    "$env:TEMP\metro-*",
    "$env:TEMP\haste-*",
    "$env:LOCALAPPDATA\Temp\metro-*",
    "$env:LOCALAPPDATA\Temp\haste-*"
)
foreach ($cache in $caches) {
    Get-ChildItem $cache -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
}
Write-Host "✅ Caches limpos" -ForegroundColor Green

# Limpar cache do npm
Write-Host "`n📦 Limpando cache do npm..." -ForegroundColor Yellow
npm cache clean --force
Write-Host "✅ Cache do npm limpo" -ForegroundColor Green

# Limpar build Android
Write-Host "`n🤖 Limpando build Android..." -ForegroundColor Yellow
if (Test-Path "android\app\build") {
    Remove-Item -Recurse -Force "android\app\build"
}
if (Test-Path "android\.gradle") {
    Remove-Item -Recurse -Force "android\.gradle"
}
Write-Host "✅ Build Android limpo" -ForegroundColor Green

Write-Host "`n✅ Limpeza completa!" -ForegroundColor Green
Write-Host "`n📝 Próximos passos:" -ForegroundColor Cyan
Write-Host "   1. npm install" -ForegroundColor White
Write-Host "   2. npx expo start --clear" -ForegroundColor White
Write-Host "   3. Escanear QR code no Expo Go" -ForegroundColor White
