import Vue from 'vue'
import VueRouter from 'vue-router'
import PageNotFound from '@/views/PageNotFound.vue'
import Home from '@/views/Home.vue'
import MyAccount from '@/views/MyAccount.vue'
import UserIndex from '@/views/user/UserIndex.vue'
import AdminIndex from '@/views/admin/AdminIndex.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '*',
    name: '404',
    component: PageNotFound
  },
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/admins',
    name: 'AdminIndex',
    component: AdminIndex
  },
  {
    path: '/myaccount',
    name: 'MyAccount',
    component: MyAccount
  },
  {
    path: '/users',
    name: 'UserIndex',
    component: UserIndex
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  }
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
