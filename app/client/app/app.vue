<template>
    <div>
        <div style="display: flex; justify-content: center;">
            <img
                :src="`${$config.public.backendPublicUrl}/img/donkey.svg`"
                alt="Donkey image"
                style="width: 800px"
            />
        </div>

        <div>
            <h1>User</h1>

            <div><pre>user: {{ user }}</pre></div>
            <div><pre>error: {{ error }}</pre></div>
        </div>
    </div>
</template>

<script setup lang="ts">
    const { data: user, error } = await useFetch('/api/user')
</script>
