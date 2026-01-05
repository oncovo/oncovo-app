/**
 * @format
 */

import { AppRegistry } from 'react-native';
import App from './src/presentation/App';
import { name as appName } from './app.json';

// Register the main component
// Expo Go expects 'main', React Native CLI uses appName
AppRegistry.registerComponent('main', () => App);
// Also register with appName for React Native CLI compatibility
if (appName && appName !== 'main') {
  AppRegistry.registerComponent(appName, () => App);
}
