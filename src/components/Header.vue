<template>
  <div>
    <!-- ログイン済のユーザー -->
    <div class="icon-container">
      <v-app>
        <v-app-bar app clipped-left>
          <v-app-bar-nav-icon @click="drawer=!drawer"></v-app-bar-nav-icon>
          <router-link to="/">
            <img class="logo" src="@/assets/epiRLogo70x40.png">
          </router-link>
          <v-toolbar-title class="font-color toolbar-title">予約 Beta</v-toolbar-title>
          <v-spacer></v-spacer>
          <v-toolbar-items>
            <v-btn text color="grey darken-2">ログアウト<v-icon color="grey darken-2">mdi-logout</v-icon></v-btn>
          </v-toolbar-items>
        </v-app-bar>
        <v-main>
          <router-view />
        </v-main>
        <v-navigation-drawer app clipped v-model="drawer">
          <v-container>
            <v-list-item>
              <v-list-item-content>
                <v-list-item-title class="title grey--text text--darken-2">
                  管理メニュー
                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
            <v-divider></v-divider>
            <v-list dense nav>
              <v-list-group 
                v-for="nav_list in nav_lists" 
                :key="nav_list.name"
                :prepend-icon="nav_list.icon"
                no-action
                :append-icon="nav_list.lists ? undefined : ''"
              > 
                <template v-slot:activator>
                  <v-list-item :to="nav_list.link">
                    <v-list-item-content>
                    <v-list-item-title>
                      {{ nav_list.name }}
                    </v-list-item-title>
                    </v-list-item-content>
                  </v-list-item>
                </template>
                <v-list-item v-for="list in nav_list.lists" :key="list.name" :to="list.link">
                  <v-list-item-content>
                    <v-list-item-title>{{ list.name }}</v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list-group>
            </v-list>
          </v-container>
        </v-navigation-drawer>
        <v-footer app class="footer">
          <v-spacer></v-spacer><span class="font-color copyright">©︎ {{ thisYear }} 脱毛サロンepiR祖師谷</span>
        </v-footer>
      </v-app>
    </div>
    <!-- 未ログインのユーザー -->
    <!-- <div class="icon-container">
      <v-app>
        <v-app-bar app clipped-left>
            <router-link to="/">
              <img class="logo" src="@/assets/epiRLogo70x40.png">
            </router-link>
          <v-toolbar-title class="font-color toolbar-title">予約 Beta</v-toolbar-title>
          <v-spacer></v-spacer>
        </v-app-bar>
      <v-main>
        <router-view />
      </v-main>
      <v-footer app class="footer">
        <v-spacer></v-spacer><span class="font-color copyright">©︎ {{ thisYear }} 脱毛サロンepiR祖師谷</span>
      </v-footer>
      </v-app>
    </div> -->
  </div>
</template>

<script>
import moment from 'moment';

export default {
  name: 'App',
  data() {
    return {
      thisYear: moment().format('YYYY'),
      drawer: null,
      nav_lists:[
        {
          name: '予約',
          icon: 'mdi-calendar-month',
          link: '/appointments',
        },
        {
          name: '顧客',
          icon: 'mdi-human-handsup',
          link: '/users',
        },
        {
          name: '施術メニュー',
          icon: 'mdi-heart-circle',
          link: '/menus',
        },
        {
          name: '設定',
          icon: 'mdi-cog-outline',
          lists:[
            { name: 'アカウント詳細', link: '/myaccount' },
            { name: 'スタッフ管理', link: '/admins' },
            { name: 'メニュー管理', link: '/settings/menu' }
          ]
        },
      ],
    }
  },
  methods: {
    logout() {
      this.$emit("logout")
    },
  },
}
</script>

<style lang="scss">
.font-color {
  color: rgb(77, 77, 77);
}
.copyright {
  font-size: 12px;
}
.footer {
  text-align: right;
}
.toolbar-title {
  margin-left: 12px;
  font-size: 18px;
  padding-top: 10px;
}
.logo {
  margin-left: 30px;
}
.v-main__wrap {
  background-color: rgb(250, 250, 250);
}
</style>