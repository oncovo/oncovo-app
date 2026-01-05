# ⬇️ Downgrade React Native para Compatibilidade com Expo

## 🎯 Objetivo

Fazer downgrade do React Native de **0.83.1** para **0.81.5** para ser compatível com **Expo SDK 54**.

## 📋 Versões Esperadas pelo Expo SDK 54

- `react-native@0.81.5`
- `react@19.1.0`
- `@types/react@~19.1.10`

## 🔧 Processo de Downgrade

### Passo 1: Usar Expo para Ajustar Versões

```bash
# O Expo ajusta automaticamente todas as versões para serem compatíveis
npx expo install --fix
```

Este comando:
- ✅ Verifica todas as dependências
- ✅ Ajusta versões para compatibilidade
- ✅ Atualiza package.json automaticamente

### Passo 2: Verificar Versões

```bash
# Verificar versão do React Native
npx react-native --version

# Verificar compatibilidade
npx expo-doctor
```

### Passo 3: Limpar e Reinstalar

```bash
# Limpar node_modules
rm -rf node_modules
rm package-lock.json

# Reinstalar dependências
npm install

# Limpar cache
npm start -- --reset-cache
```

### Passo 4: Rebuild do Android

```bash
# Limpar build Android
cd android
.\gradlew clean
cd ..

# Reinstalar
npm run android
```

## ⚠️ Possíveis Impactos

### O que pode mudar:
- ⚠️ Algumas features novas do RN 0.83 podem não estar disponíveis
- ⚠️ Pode precisar ajustar código se usar features específicas do 0.83
- ⚠️ Build pode precisar ser refeito

### O que NÃO muda:
- ✅ Estrutura do projeto
- ✅ Clean Architecture
- ✅ Código TypeScript
- ✅ Funcionalidades básicas

## ✅ Após o Downgrade

1. **Testar no Android:**
   ```bash
   npm run android
   ```

2. **Testar no iPhone (Expo Go):**
   ```bash
   npx expo start
   # Escanear QR code no Expo Go
   ```

3. **Verificar se tudo funciona:**
   - App carrega corretamente
   - Sem erros de runtime
   - Funcionalidades básicas funcionando

## 📝 Notas

- O downgrade é necessário para usar Expo Go
- React Native 0.81.5 ainda é uma versão recente e estável
- Quando Expo SDK atualizar, você pode voltar para RN 0.83+

---

**Status:** Aguardando execução do `npx expo install --fix`
