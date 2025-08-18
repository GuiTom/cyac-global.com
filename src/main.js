import { createApp } from 'vue'
import { createPinia } from 'pinia'
import { createRouter, createWebHashHistory } from 'vue-router'
import App from './App.vue'
import Home from './views/Home.vue'
import Query from './views/Query.vue'
import Gallery from './views/Gallery.vue'
import Article from './views/Article.vue'

// 创建路由
const routes = [
  { path: '/', name: 'Home', component: Home },
  { path: '/query', name: 'Query', component: Query },
  { path: '/gallery', name: 'Gallery', component: Gallery },
  { path: '/article/:id', name: 'Article', component: Article }
]

const router = createRouter({
  history: createWebHashHistory(),
  routes
})

// 创建应用
const app = createApp(App)
app.use(createPinia())
app.use(router)
app.mount('#app')
console.log('app mouted')