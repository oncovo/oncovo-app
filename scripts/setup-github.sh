#!/bin/bash

# Script para configurar o repositório GitHub
# Uso: ./scripts/setup-github.sh SEU_REPOSITORIO

if [ -z "$1" ]; then
    echo "❌ Erro: Nome do repositório não fornecido"
    echo "Uso: ./scripts/setup-github.sh nome-do-repositorio"
    echo "Exemplo: ./scripts/setup-github.sh oncovo-app"
    exit 1
fi

REPO_NAME=$1
ORG_NAME="oncovo"
REMOTE_URL="https://github.com/${ORG_NAME}/${REPO_NAME}.git"

echo "🚀 Configurando repositório GitHub..."
echo "📦 Organização: ${ORG_NAME}"
echo "📁 Repositório: ${REPO_NAME}"
echo ""

# Verificar se o remote já existe
if git remote get-url origin &> /dev/null; then
    echo "⚠️  Remote 'origin' já existe. Removendo..."
    git remote remove origin
fi

# Adicionar remote
echo "➕ Adicionando remote..."
git remote add origin ${REMOTE_URL}

# Verificar conexão
echo "🔍 Verificando conexão..."
if git ls-remote --heads origin &> /dev/null; then
    echo "✅ Repositório encontrado!"
    echo ""
    echo "📤 Para fazer push, execute:"
    echo "   git push -u origin main"
else
    echo "❌ Repositório não encontrado ou sem acesso"
    echo ""
    echo "📝 Crie o repositório primeiro em:"
    echo "   https://github.com/organizations/${ORG_NAME}/repositories/new"
    echo ""
    echo "   Nome: ${REPO_NAME}"
    echo "   Visibilidade: Público ou Privado"
    echo "   NÃO inicialize com README, .gitignore ou licença"
    echo ""
    echo "Depois execute novamente este script ou:"
    echo "   git remote add origin ${REMOTE_URL}"
    echo "   git push -u origin main"
fi
