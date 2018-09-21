// app/javascript/packs/application.js

import Vue from 'vue/dist/vue.esm.js';
import App from '../components/app.vue'

document.addEventListener('DOMContentLoaded', () => {
const app = new Vue({
    el: 'app',
    template: '<App/>',
    components: { App }
})

console.log(app)
})
