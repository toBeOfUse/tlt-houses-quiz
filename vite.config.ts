import devtoolsJson from 'vite-plugin-devtools-json';
import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit(), devtoolsJson()],
	// https://github.com/sveltejs/kit/issues/3882#issuecomment-2294459036
	build: {
		rollupOptions: {
			output: {
				manualChunks: (id) => {
					return 'my-app';
				}
			}
		}
	}
});
