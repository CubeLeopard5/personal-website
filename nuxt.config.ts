// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
    plugins:['@/plugins/antd', '@/plugins/i18n'],
	modules: [
		'@vueuse/nuxt',
		'@nuxtjs/color-mode',
	],
	app: {
		head: {
			title: "Michaud Developpement Informatique",
			meta: [
				{ name: 'description', content: "Ayant suivi la formation de l'école Epitech (actuellement en 5ième année), je suis animé des technologies web et possède de larges compétences en C, CPP, Javascript et VueJS." },
			]
		}
	}
})
