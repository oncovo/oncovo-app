# 📱 Rodar App iOS sem Mac - Guia Completo

## ⚠️ Limitação Importante

Para desenvolver aplicativos iOS nativos, a Apple **requer**:
- ✅ macOS (MacBook, iMac, Mac mini, etc.)
- ✅ Xcode (só funciona no macOS)
- ✅ Conta de desenvolvedor Apple (para instalar no dispositivo)

**Sem um Mac, você NÃO pode:**
- ❌ Compilar o app iOS localmente
- ❌ Instalar diretamente no iPhone via Xcode
- ❌ Usar React Native CLI para iOS

## 🎯 Opções Disponíveis (Sem Mac)

### Opção 1: Expo Go (Mais Fácil) ⭐ RECOMENDADO

**Vantagens:**
- ✅ Funciona sem Mac
- ✅ Teste rápido no iPhone
- ✅ Não precisa compilar

**Desvantagens:**
- ⚠️ Limitações de bibliotecas nativas
- ⚠️ Algumas funcionalidades podem não funcionar

**Como usar:**
1. **Reinstalar Expo** (versão compatível):
   ```bash
   # Verificar versão compatível primeiro
   npx expo install --check
   
   # Instalar versão compatível
   npm install expo@<versão-compatível>
   ```

2. **Configurar app.json:**
   ```json
   {
     "expo": {
       "name": "Oncovo",
       "slug": "oncovo-app"
     }
   }
   ```

3. **Instalar Expo Go no iPhone:**
   - App Store: "Expo Go"

4. **Executar:**
   ```bash
   npm start
   # ou
   npx expo start
   ```

5. **Conectar:**
   - Escaneie o QR code com Expo Go
   - Ou use o link direto

### Opção 2: EAS Build (Build na Nuvem)

**Vantagens:**
- ✅ Compila na nuvem (usa Macs da Expo)
- ✅ Pode gerar .ipa para instalar
- ✅ Funciona sem Mac

**Desvantagens:**
- ⚠️ Requer conta Expo (gratuita)
- ⚠️ Builds podem demorar
- ⚠️ Limitações do plano gratuito

**Como usar:**
1. **Instalar EAS CLI:**
   ```bash
   npm install -g eas-cli
   ```

2. **Login:**
   ```bash
   eas login
   ```

3. **Configurar:**
   ```bash
   eas build:configure
   ```

4. **Build para iOS:**
   ```bash
   eas build --platform ios
   ```

5. **Instalar no iPhone:**
   - Baixe o .ipa do link fornecido
   - Instale via TestFlight ou link direto

### Opção 3: Mac na Nuvem (Pago)

**Serviços disponíveis:**
- **MacStadium** - Macs dedicados na nuvem
- **AWS EC2 Mac instances** - Macs na AWS
- **MacinCloud** - Macs compartilhados
- **Scaleway** - Macs na nuvem

**Custo:** ~$50-200/mês

**Como usar:**
1. Alugar um Mac na nuvem
2. Conectar via VNC/SSH
3. Instalar Xcode
4. Compilar normalmente

### Opção 4: CI/CD com Mac (GitHub Actions, etc.)

**Vantagens:**
- ✅ Automatizado
- ✅ Gratuito (com limites)

**Desvantagens:**
- ⚠️ Mais complexo de configurar
- ⚠️ Requer conhecimento de CI/CD

**Exemplo com GitHub Actions:**
```yaml
# .github/workflows/ios-build.yml
name: iOS Build
on: [push]
jobs:
  build:
    runs-on: macos-latest
    steps:
      - uses: actions/checkout@v2
      - name: Setup Node
        uses: actions/setup-node@v2
      - name: Install dependencies
        run: npm install
      - name: Build iOS
        run: |
          cd ios
          pod install
          xcodebuild -workspace OncovoApp.xcworkspace -scheme OncovoApp
```

### Opção 5: Emprestar/Usar Mac Temporariamente

Se você conhece alguém com Mac:
1. Clone o projeto no Mac
2. Instale dependências
3. Compile e instale no iPhone
4. Depois pode usar Expo Go para desenvolvimento

## 🎯 Recomendação para Seu Caso

### Para Desenvolvimento Rápido:
**Use Expo Go** - É a forma mais rápida de testar no iPhone sem Mac.

### Para Build de Produção:
**Use EAS Build** - Compila na nuvem e gera o .ipa.

## 📝 Passo a Passo: Configurar Expo Go

### 1. Verificar Compatibilidade

Primeiro, precisamos verificar se podemos usar Expo com React Native 0.83.1:

```bash
# Verificar versões compatíveis
npx expo-doctor
```

### 2. Se Expo não for compatível, alternativas:

**Opção A: Usar React Native Web (Teste no navegador)**
- Desenvolva e teste no navegador
- Depois use EAS Build para iOS

**Opção B: Usar Android como referência**
- Desenvolva no Android
- Ajuste para iOS depois (quando tiver acesso a Mac)

**Opção C: Alugar Mac na nuvem**
- Para builds importantes
- Desenvolvimento contínuo no Android

## 🔧 Configuração Expo Go (Se Compatível)

Se decidir usar Expo Go:

1. **Instalar Expo:**
   ```bash
   npm install expo
   ```

2. **Criar app.json:**
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

3. **Iniciar:**
   ```bash
   npx expo start
   ```

4. **No iPhone:**
   - Abra Expo Go
   - Escaneie o QR code
   - App carrega automaticamente

## ⚠️ Limitações Importantes

### Sem Mac, você NÃO pode:
- ❌ Testar funcionalidades nativas específicas do iOS
- ❌ Usar bibliotecas que requerem código nativo customizado
- ❌ Depurar problemas nativos do iOS
- ❌ Publicar na App Store diretamente

### O que você PODE fazer:
- ✅ Desenvolver no Android
- ✅ Testar lógica de negócio
- ✅ Usar Expo Go para UI básica
- ✅ Usar EAS Build para gerar .ipa
- ✅ Testar em navegador (React Native Web)

## 💡 Estratégia Recomendada

1. **Desenvolvimento Principal:** Android (você já tem funcionando)
2. **Testes Rápidos iOS:** Expo Go (quando possível)
3. **Builds iOS:** EAS Build ou Mac na nuvem
4. **Testes Finais:** Dispositivo físico quando tiver acesso a Mac

## 📚 Recursos

- [Expo Go](https://expo.dev/client)
- [EAS Build](https://docs.expo.dev/build/introduction/)
- [MacStadium](https://www.macstadium.com/)
- [React Native Web](https://necolas.github.io/react-native-web/)

---

**Nota:** A melhor solução a longo prazo seria ter acesso a um Mac, mesmo que seja compartilhado ou na nuvem, para desenvolvimento iOS completo.
