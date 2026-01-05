# 🍎 Rodar App no iPhone - Guia Rápido (Sem Mac)

## ⚠️ Situação Atual

Você tem:
- ✅ Windows
- ✅ iPhone físico
- ❌ Sem Mac

## 🎯 Solução Mais Rápida: Expo Go

### Passo 1: Verificar Compatibilidade

Primeiro, vamos verificar se podemos usar Expo:

```bash
# Verificar versão do React Native
npx react-native --version

# Verificar compatibilidade Expo
npx expo-doctor
```

### Passo 2: Instalar Expo (Se Compatível)

```bash
# Instalar Expo
npm install expo

# Verificar instalação
npx expo --version
```

### Passo 3: Configurar app.json

O arquivo `app.json` já existe, mas precisa ter configuração Expo:

```json
{
  "expo": {
    "name": "Oncovo",
    "slug": "oncovo-app",
    "version": "1.0.0",
    "platforms": ["ios", "android"],
    "ios": {
      "bundleIdentifier": "com.oncovoapp"
    }
  }
}
```

### Passo 4: Instalar Expo Go no iPhone

1. Abra a **App Store** no iPhone
2. Procure por **"Expo Go"**
3. Instale o app (gratuito)

### Passo 5: Executar

```bash
# Iniciar servidor Expo
npx expo start

# Ou se tiver instalado globalmente
expo start
```

### Passo 6: Conectar iPhone

1. **Certifique-se que iPhone e PC estão na mesma rede Wi-Fi**
2. No terminal, você verá um **QR Code**
3. Abra **Expo Go** no iPhone
4. Toque em **"Scan QR Code"**
5. Escaneie o QR code
6. O app carregará automaticamente!

## 🔄 Alternativa: Usar Tunnel

Se não estiverem na mesma rede:

```bash
# Usar tunnel (mais lento, mas funciona de qualquer lugar)
npx expo start --tunnel
```

## ⚠️ Limitações do Expo Go

- ❌ Algumas bibliotecas nativas não funcionam
- ❌ Não pode usar todas as funcionalidades do React Native
- ❌ Performance pode ser diferente do app compilado

## 🎯 Alternativa: EAS Build (Para App Completo)

Se precisar de funcionalidades nativas completas:

### 1. Instalar EAS CLI

```bash
npm install -g eas-cli
```

### 2. Login

```bash
eas login
```

### 3. Configurar

```bash
eas build:configure
```

### 4. Build para iOS

```bash
eas build --platform ios
```

### 5. Instalar no iPhone

- Você receberá um link
- Abra no iPhone
- Instale o app (pode precisar de perfil de desenvolvedor)

## 📱 Teste Rápido: React Native Web

Para testar a UI sem iPhone:

```bash
# Instalar React Native Web
npm install react-native-web

# Executar no navegador
npx react-native start
# Depois acesse http://localhost:8081
```

## 🚀 Recomendação Imediata

**Para testar AGORA no iPhone:**

1. Tente usar **Expo Go** (mais rápido)
2. Se não funcionar por incompatibilidade, use **EAS Build**
3. Para desenvolvimento diário, continue no **Android**

## 📝 Checklist

- [ ] iPhone e PC na mesma rede Wi-Fi
- [ ] Expo Go instalado no iPhone
- [ ] Expo instalado no projeto (`npm install expo`)
- [ ] `app.json` configurado
- [ ] Servidor rodando (`npx expo start`)
- [ ] QR code escaneado no Expo Go

---

**Dica:** Para desenvolvimento contínuo, desenvolva no Android e use Expo Go/EAS Build para testes rápidos no iPhone quando necessário.
