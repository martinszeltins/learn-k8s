// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  compatibilityDate: '2025-07-15',
  devtools: { enabled: true },

  runtimeConfig: {
    public: {
        // Internal Docker network communication
        backendApiUrl: 'http://learn-k8s-server/api',

        // Public facing URL
        backendPublicUrl: 'http://localhost:7658'
    }
  }
})
