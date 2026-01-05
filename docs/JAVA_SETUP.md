# ☕ Configuração Java para Android Build

## Problema

Gradle 9.0.0 requer **Java 17 ou superior**, mas o sistema pode estar usando Java 11.

## ✅ Verificar Versão do Java

```powershell
java -version
```

Deve mostrar: `java version "17"` ou superior.

## 🔧 Configurar Java 17

### Opção 1: Configurar JAVA_HOME (Recomendado)

1. **Encontrar o caminho do Java 17:**
   ```powershell
   where java
   ```
   Exemplo: `C:\Program Files\Java\jdk-17\bin\java.exe`

2. **Definir JAVA_HOME:**
   ```powershell
   # Temporário (apenas esta sessão)
   $env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
   
   # Permanente (recomendado)
   [System.Environment]::SetEnvironmentVariable('JAVA_HOME', 'C:\Program Files\Java\jdk-17', 'User')
   ```

3. **Verificar:**
   ```powershell
   $env:JAVA_HOME
   java -version
   ```

### Opção 2: Configurar no gradle.properties

Edite `android/gradle.properties` e adicione:

```properties
org.gradle.java.home=C:\\Program Files\\Java\\jdk-17
```

**⚠️ Importante:** Use barras duplas (`\\`) no Windows.

### Opção 3: Usar Android Studio JDK

Se você tem Android Studio instalado:

1. Abra Android Studio
2. File > Settings > Build, Execution, Deployment > Build Tools > Gradle
3. Copie o caminho do "Gradle JDK"
4. Use esse caminho no `gradle.properties`

## 🚀 Após Configurar

1. **Limpar build do Android:**
   ```powershell
   cd android
   .\gradlew clean
   cd ..
   ```

2. **Tentar novamente:**
   ```powershell
   npm run android
   ```

## 📝 Verificar Configuração

```powershell
# Verificar Java
java -version

# Verificar JAVA_HOME
echo $env:JAVA_HOME

# Verificar no Gradle
cd android
.\gradlew --version
cd ..
```

## 🔍 Troubleshooting

### Erro: "JAVA_HOME is not set"

Configure o JAVA_HOME conforme Opção 1 acima.

### Erro: "Gradle still using Java 11"

1. Pare todos os processos do Gradle:
   ```powershell
   cd android
   .\gradlew --stop
   cd ..
   ```

2. Limpe o cache:
   ```powershell
   cd android
   .\gradlew clean
   Remove-Item -Recurse -Force .gradle
   cd ..
   ```

3. Tente novamente.

### Múltiplas Versões de Java

Se você tem múltiplas versões:

1. Liste todas:
   ```powershell
   Get-ChildItem "C:\Program Files\Java"
   ```

2. Use a versão 17 ou superior:
   ```powershell
   $env:JAVA_HOME = "C:\Program Files\Java\jdk-17"
   ```

## 📚 Recursos

- [Gradle Java Compatibility](https://docs.gradle.org/current/userguide/compatibility.html#java)
- [Android Studio JDK Setup](https://developer.android.com/studio/intro/studio-config#jdk)
