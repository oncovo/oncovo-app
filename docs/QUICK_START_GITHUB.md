# 🚀 Quick Start - GitHub Setup

## ⚡ Passos Rápidos

### 1️⃣ Criar repositório no GitHub
Acesse: https://github.com/organizations/oncovo/repositories/new

- Nome: `oncovo-app` (ou outro)
- ⚠️ **NÃO** marque README, .gitignore ou license
- Clique em "Create repository"

### 2️⃣ Configurar e fazer push

**Windows (PowerShell):**
```powershell
.\scripts\setup-github.ps1 -RepositoryName "oncovo-app"
git push -u origin main
```

**Linux/Mac:**
```bash
bash scripts/setup-github.sh oncovo-app
git push -u origin main
```

**Manual:**
```bash
git remote add origin https://github.com/oncovo/oncovo-app.git
git push -u origin main
```

### 3️⃣ Pronto! ✅
Seu código está no GitHub: https://github.com/oncovo/oncovo-app

---

**Dúvidas?** Veja [GITHUB_SETUP.md](./GITHUB_SETUP.md) para instruções detalhadas.
