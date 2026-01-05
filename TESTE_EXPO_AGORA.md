# 🚀 Teste Expo Go Agora - Passo a Passo

## ✅ O Que Foi Corrigido

1. ✅ **React Native downgrade**: 0.83.1 → 0.81.5
2. ✅ **React downgrade**: 19.2.0 → 19.1.0
3. ✅ **Metro config**: Agora usa `expo/metro-config`
4. ✅ **Babel config**: Usa `babel-preset-expo`
5. ✅ **Imports**: Corrigidos para não usar aliases problemáticos
6. ✅ **Dependências**: Todas compatíveis com Expo SDK 54

## 🎯 Teste Agora

### Passo 1: Limpar Cache do Expo Go no iPhone

**IMPORTANTE - Faça isso primeiro:**
1. Feche completamente o Expo Go (swipe up e feche)
2. Ou desinstale e reinstale o Expo Go da App Store
3. Isso limpa o cache antigo que pode estar causando o erro

### Passo 2: Limpar Cache do Servidor

```powershell
# Parar qualquer processo do Metro
Get-Process -Name node -ErrorAction SilentlyContinue | Stop-Process -Force

# Limpar cache e iniciar
npx expo start --clear
```

### Passo 3: Conectar iPhone

1. **Certifique-se que iPhone e PC estão na mesma rede Wi-Fi**
2. Abra Expo Go no iPhone (após ter fechado/reinstalado)
3. Escaneie o QR code que aparece no terminal
4. Aguarde o carregamento

### Passo 4: Se Não Conectar

**Use tunnel (funciona mesmo em redes diferentes):**
```powershell
npx expo start --tunnel --clear
```

## ⚠️ Se Ainda Der Erro

### Opção 1: Verificar Logs

```powershell
# Ver logs detalhados
npx expo start --clear --verbose
```

### Opção 2: Usar EAS Build (Mais Confiável)

```bash
# Instalar EAS CLI
npm install -g eas-cli

# Login
eas login

# Configurar
eas build:configure

# Build para iOS
eas build --platform ios

# Aguardar (15-30 min) e instalar via link
```

### Opção 3: Desenvolver no Android

O Android já está funcionando perfeitamente! Você pode:
- Desenvolver no Android
- Usar EAS Build quando precisar testar no iPhone

## 📝 Checklist

Antes de testar, verifique:
- [ ] Expo Go foi fechado e reaberto (ou reinstalado)
- [ ] Cache limpo (`--clear`)
- [ ] iPhone e PC na mesma rede Wi-Fi
- [ ] Sem processos antigos do Metro rodando
- [ ] Versões corretas instaladas

## 🎉 Próximo Passo

Execute:
```powershell
npx expo start --clear
```

E escaneie o QR code no Expo Go (após ter fechado e reaberto o app).

---

**Dica:** Se o erro persistir após fechar/reabrir o Expo Go, use **EAS Build** - é a solução mais confiável para ter um app completo no iPhone sem Mac.
