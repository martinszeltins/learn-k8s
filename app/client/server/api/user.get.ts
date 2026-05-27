interface User {
    id: number
    username: string
    email: string
}

export default defineEventHandler(async (): Promise<User> => {
    const backendApiUrl = useRuntimeConfig().public.backendApiUrl

    const response = await $fetch(`${backendApiUrl}/user`)

    return response as User
})
