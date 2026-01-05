/**
 * Jest setup file
 * Configure test environment and global mocks
 */

// Mock React Native modules if needed
jest.mock('react-native', () => {
  const RN = jest.requireActual('react-native');
  return {
    ...RN,
    // Add any React Native mocks here
  };
});

// Global test setup
beforeEach(() => {
  // Reset mocks before each test
  jest.clearAllMocks();
});
