# 🚀 Configuração do GitHub

## 📋 Passos para fazer push do projeto

### 1. Criar o repositório no GitHub

Acesse: https://github.com/organizations/oncovo/repositories/new

Ou use a CLI do GitHub:
```bash
gh repo create oncovo/oncovo-app --public --source=. --remote=origin --push
```

**Configurações recomendadas:**
- **Nome do repositório:** `oncovo-app` (ou outro nome de sua preferência)
- **Visibilidade:** Público ou Privado (conforme necessário)
- **NÃO** inicialize com README, .gitignore ou licença (já temos)

### 2. Configurar o remote e fazer push

Após criar o repositório, execute:

```bash
# Adicionar todos os arquivos
git add .

# Fazer commit inicial
git commit -m "feat: initial project setup with Clean Architecture

- React Native 0.83.1 with TypeScript
- Clean Architecture structure
- Version management (Android & iOS)
- Unit tests setup with Jest
- Expo Bare Workflow support
- Configuration files for Supabase, Google Auth, and Notifications"

# Adicionar remote (substitua SEU_REPOSITORIO pelo nome real)
git remote add origin https://github.com/oncovo/SEU_REPOSITORIO.git

# Ou se usar SSH:
# git remote add origin git@github.com:oncovo/SEU_REPOSITORIO.git

# Renomear branch principal para main (se necessário)
git branch -M main

# Fazer push
git push -u origin main
```

### 3. Verificar

Após o push, verifique em: https://github.com/oncovo/SEU_REPOSITORIO

## 🔐 Autenticação

### Opção 1: Personal Access Token (HTTPS)
1. Vá em: GitHub Settings > Developer settings > Personal access tokens > Tokens (classic)
2. Crie um token com permissões `repo`
3. Use o token como senha ao fazer push

### Opção 2: SSH (Recomendado)
1. Gere uma chave SSH: `ssh-keygen -t ed25519 -C "seu-email@exemplo.com"`
2. Adicione ao GitHub: Settings > SSH and GPG keys
3. Use a URL SSH ao adicionar o remote

## 📝 Estrutura do Commit

O projeto segue Conventional Commits:
- `feat:` - Nova funcionalidade
- `fix:` - Correção de bug
- `docs:` - Documentação
- `style:` - Formatação
- `refactor:` - Refatoração
- `test:` - Testes
- `chore:` - Tarefas de manutenção

## 🎯 Próximos Passos

Após fazer o push inicial:
1. Configurar GitHub Actions (CI/CD) - opcional
2. Configurar branch protection rules
3. Adicionar colaboradores
4. Configurar issues e projetos
