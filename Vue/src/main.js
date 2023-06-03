import { createApp } from 'vue'
import './style.css'
import App from './App.vue'
/* import the fontawesome core */
import { library } from '@fortawesome/fontawesome-svg-core'

/* import font awesome icon component */
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

/* import specific icons */
import { faUserSecret, faTrashCan, faPencil } from '@fortawesome/free-solid-svg-icons'

/* add icons to the library */
library.add([faUserSecret, faTrashCan, faPencil])
// library.add(faTrashCan)
// library.add(faPencil)

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'


createApp(App).component('font-awesome-icon', FontAwesomeIcon).mount('#app')
