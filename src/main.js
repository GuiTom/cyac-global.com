import { createApp } from 'vue'
import { createRouter, createWebHistory } from 'vue-router'
import App from './App.vue'
import Home from './views/Home.vue'
import Gallery from './views/Gallery.vue'
import Article from './views/Article.vue'
import Query from './views/Query.vue'
import 'swiper/css'

// 创建路由
const routes = [
  { path: '/', component: Home },
  { path: '/gallery', component: Gallery },
  { path: '/article/:id', component: Article },
  { path: '/query', component: Query }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

// 创建应用
const app = createApp(App)
app.use(router)
app.mount('#app')
console.log('app mouted')