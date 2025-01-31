import { defineConfig } from 'vite';
import laravel from 'laravel-vite-plugin';

export default defineConfig({
    plugins: [
        laravel({
            input: [
                'resources/css/app.css',
                'resources/js/app.js',
            ],
            refresh: true,
        }),
    ],
    resolve: {
        alias: {
            '@': '/resources/js',
            '%': '/resources/css',
        },
    },
    server: {
        hmr: {
            host: 'localhost', // this controls the url host used
        },
        host: true, // this allows the use of vite in docker
        strictPort: true,
        port: 5173,
    },
});
