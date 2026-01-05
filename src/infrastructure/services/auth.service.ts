/**
 * Authentication service
 * Handles Google authentication and other auth methods
 */

// Placeholder for authentication service
// Will be implemented when adding Google Auth integration

export class AuthService {
  static async signInWithGoogle(): Promise<{ user: unknown; token: string } | null> {
    // TODO: Implement Google Sign In
    return null;
  }

  static async signOut(): Promise<void> {
    // TODO: Implement sign out
  }

  static async getCurrentUser(): Promise<unknown | null> {
    // TODO: Get current authenticated user
    return null;
  }
}
