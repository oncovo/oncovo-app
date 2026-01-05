# 🚀 Expo Go - Início Rápido

## ✅ Expo Instalado!

O Expo foi instalado com sucesso. Agora você pode testar no iPhone!

## 📱 Passo a Passo

### 1. Instalar Expo Go no iPhone

1. Abra a **App Store** no iPhone
2. Procure por **"Expo Go"**
3. Instale o app (é gratuito)

### 2. Executar o Servidor

```bash
# Comando correto (você digitou "starth" antes)
npx expo start

# Ou use o script
npm run start:expo
```

### 3. Conectar iPhone

**IMPORTANTE:** iPhone e PC devem estar na **mesma rede Wi-Fi**

**Opção A: QR Code (Recomendado)**
1. No terminal, você verá um **QR Code**
2. Abra **Expo Go** no iPhone
3. Toque em **"Scan QR Code"**
4. Escaneie o QR code
5. O app carrega automaticamente!

**Opção B: Link Manual**
1. No terminal, você verá um link como: `exp://192.168.1.100:8081`
2. Abra **Expo Go** no iPhone
3. Toque em **"Enter URL manually"**
4. Digite o link
5. O app carrega!

### 4. Se Não Conectar

**Problema: Redes Diferentes**
```bash
# Use tunnel (mais lento, mas funciona de qualquer lugar)
npx expo start --tunnel
```

**Problema: Firewall**
- Desative temporariamente o firewall do Windows
- Ou permita a porta 8081 nas configurações de firewall

## 🎯 Comandos Úteis

```bash
# Iniciar normalmente
npx expo start

# Iniciar com tunnel (se não estiver na mesma rede)
npx expo start --tunnel

# Limpar cache
npx expo start --clear

# Modo desenvolvimento
npx expo start --dev-client
```

## ⚠️ Avisos Importantes

### Compatibilidade

O React Native 0.83.1 pode ter algumas incompatibilidades com Expo SDK 54. Se você ver erros:

1. **Erro de versão:**
   - O Expo pode avisar sobre versões incompatíveis
   - Isso é normal, pode funcionar mesmo assim

2. **Erro de módulos:**
   - Algumas bibliotecas nativas podem não funcionar no Expo Go
   - Isso é esperado

### Limitações do Expo Go

- ❌ Não testa código nativo customizado
- ❌ Algumas bibliotecas podem não funcionar
- ❌ Performance pode ser diferente do app compilado

**Mas funciona para:**
- ✅ Testar UI
- ✅ Testar lógica de negócio
- ✅ Ver como fica no iPhone
- ✅ Desenvolvimento rápido

## 🔄 Recarregar o App

No iPhone, dentro do Expo Go:
- **Puxe para baixo** na tela do app para recarregar
- Ou agite o dispositivo e selecione "Reload"

## 📝 Troubleshooting

### "Unable to connect to Metro"
- Verifique se o Metro está rodando: `npm start`
- Certifique-se que estão na mesma rede Wi-Fi
- Tente usar `--tunnel`

### "Network request failed"
- Verifique conexão Wi-Fi do iPhone
- Tente usar `--tunnel`

### App não carrega
- Verifique os logs no terminal
- Tente limpar cache: `npx expo start --clear`
- Reinicie o servidor

## ✅ Próximos Passos

1. Execute `npx expo start`
2. Escaneie o QR code no Expo Go
3. Veja seu app rodando no iPhone! 🎉

---

**Dica:** Para desenvolvimento contínuo, desenvolva no Android e use Expo Go para testes rápidos no iPhone quando necessário.
