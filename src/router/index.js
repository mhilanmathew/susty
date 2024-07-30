import { createRouter, createWebHistory } from 'vue-router'
import HomeView from '../views/Home.vue'
import AboutView from '../views/About.vue'
import MarketplaceView from '../views/Marketplace.vue'
import CommunityView from '../views/Community.vue'
import AuthView from '../views/AuthView.vue'

const routes = [
  { 
    path: '/', 
    name: 'Home', 
    component: HomeView,
    meta: { requiresAuth: true }
  },
  { 
    path: '/about', 
    name: 'About', 
    component: AboutView,
    meta: { requiresAuth: true }
  },
  { 
    path: '/marketplace', 
    name: 'Marketplace', 
    component: MarketplaceView,
    meta: { requiresAuth: true }
  },
  { 
    path: '/community', 
    name: 'Community', 
    component: CommunityView,
    meta: { requiresAuth: true }
  },
  { 
    path: '/auth', 
    name: 'Auth', 
    component: AuthView
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

router.beforeEach((to, from, next) => {
  const isAuthenticated = !!localStorage.getItem('currentUser')
  if (to.matched.some(record => record.meta.requiresAuth) && !isAuthenticated) {
    next({ name: 'Auth' })
  } else {
    next()
  }
})

export default router