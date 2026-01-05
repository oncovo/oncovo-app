# Script PowerShell para configurar o repositório GitHub
# Uso: .\scripts\setup-github.ps1 -RepositoryName "nome-do-repositorio"

param(
    [Parameter(Mandatory=$true)]
    [string]$RepositoryName
)

$OrgName = "oncovo"
$RemoteUrl = "https://github.com/${OrgName}/${RepositoryName}.git"

Write-Host "🚀 Configurando repositório GitHub..." -ForegroundColor Cyan
Write-Host "📦 Organização: $OrgName" -ForegroundColor Yellow
Write-Host "📁 Repositório: $RepositoryName" -ForegroundColor Yellow
Write-Host ""

# Verificar se o remote já existe
try {
    $existingRemote = git remote get-url origin 2>$null
    if ($existingRemote) {
        Write-Host "⚠️  Remote 'origin' já existe. Removendo..." -ForegroundColor Yellow
        git remote remove origin
    }
} catch {
    # Remote não existe, tudo bem
}

# Adicionar remote
Write-Host "➕ Adicionando remote..." -ForegroundColor Green
git remote add origin $RemoteUrl

# Verificar conexão
Write-Host "🔍 Verificando conexão..." -ForegroundColor Cyan
$remoteCheck = git ls-remote --heads origin 2>&1

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Repositório encontrado!" -ForegroundColor Green
    Write-Host ""
    Write-Host "📤 Para fazer push, execute:" -ForegroundColor Cyan
    Write-Host "   git push -u origin main" -ForegroundColor White
} else {
    Write-Host "❌ Repositório não encontrado ou sem acesso" -ForegroundColor Red
    Write-Host ""
    Write-Host "📝 Crie o repositório primeiro em:" -ForegroundColor Yellow
    Write-Host "   https://github.com/organizations/${OrgName}/repositories/new" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "   Nome: $RepositoryName" -ForegroundColor White
    Write-Host "   Visibilidade: Público ou Privado" -ForegroundColor White
    Write-Host "   NÃO inicialize com README, .gitignore ou licença" -ForegroundColor Yellow
    Write-Host ""
    Write-Host "Depois execute novamente este script ou:" -ForegroundColor Yellow
    Write-Host "   git remote add origin $RemoteUrl" -ForegroundColor White
    Write-Host "   git push -u origin main" -ForegroundColor White
}
