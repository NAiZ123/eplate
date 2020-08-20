import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import App from '../app.vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#hello',
     data: {
      message: "2020ver"
    },
    components: { App }
  })
})
