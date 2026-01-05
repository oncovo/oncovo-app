/**
 * Main App Component
 * Root component of the application
 */

import React from 'react';
import { StatusBar, useColorScheme, View, Text, StyleSheet } from 'react-native';
import {
  SafeAreaProvider,
  useSafeAreaInsets,
} from 'react-native-safe-area-context';
import { logger } from '../core/utils/logger';

function AppContent() {
  const safeAreaInsets = useSafeAreaInsets();
  const isDarkMode = useColorScheme() === 'dark';

  React.useEffect(() => {
    logger.info('App initialized');
  }, []);

  return (
    <>
      <StatusBar
        barStyle={isDarkMode ? 'light-content' : 'dark-content'}
        backgroundColor="transparent"
        translucent
      />
      <View style={styles.container}>
        <Text style={styles.title}>Oncovo App</Text>
        <Text style={styles.subtitle}>React Native 0.81.5</Text>
        <Text style={styles.message}>App inicializado com sucesso! 🚀</Text>
      </View>
    </>
  );
}

function App(): React.JSX.Element {
  return (
    <SafeAreaProvider>
      <AppContent />
    </SafeAreaProvider>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#ffffff',
    padding: 20,
  },
  title: {
    fontSize: 32,
    fontWeight: 'bold',
    color: '#000000',
    marginBottom: 10,
  },
  subtitle: {
    fontSize: 18,
    color: '#666666',
    marginBottom: 20,
  },
  message: {
    fontSize: 16,
    color: '#333333',
    textAlign: 'center',
  },
});

export default App;
