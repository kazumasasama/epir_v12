import Vue from 'vue'
import Vuex from 'vuex'
import Api from '../services/api'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    users: [],
    admins: [],
  },
  mutations: {
    SET_ADMINS(state, admins) {
      state.admins = admins
    },
    SET_USERS(state, users) {
      state.users = users
    }
  },
  actions: {
    async loadAdmins({commit}) {
      let response = await Api().get("/admins");
      let admins = response.data;
      commit("SET_ADMINS", admins);
    },
    async loadUsers({commit}) {
      let response = await Api().get("/users");
      let users = response.data;
      commit("SET_USERS", users);
    }
  },
  modules: {
  }
})
