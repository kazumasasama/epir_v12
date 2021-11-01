<template>
  <div class="container">
    <v-card>
      <v-card-title>
        顧客一覧
        <div class="btn-container">
          <v-btn right color="primary" outlined><v-icon left>mdi-account-plus</v-icon>新規登録</v-btn>
        </div>
      </v-card-title>
      <v-data-table @click:row="clickRow">
        <template v-slot:default>
          <thead>
            <tr>
              <th class="text-left vip">
                <v-icon small>mdi-star-outline</v-icon>
              </th>
              <th class="text-left danger">
                <v-icon small>mdi-star</v-icon>
              </th>
              <th class="text-left">名前</th>
              <th class="text-left">メールアドレス</th>
              <th class="text-left">TEL</th>
              <th class="buttons"></th>
            </tr>
          </thead>
          <tbody>
            <tr
              v-for="user in users"
              :key="user.id"
            >
              <td v-if="user.vip === true">☆</td>
              <td v-else></td>
              <td v-if="user.danger === true">★</td>
              <td v-else></td>
              <td>{{ user.last_name + " " + user.first_name }}</td>
              <td>{{ user.email }}</td>
              <td>{{ user.phone }}</td>
              <td>
                <v-btn small @click="showDetail(scope.$index, scope.row)" color="primary" outlined><v-icon small>mdi-account-details</v-icon>info</v-btn>
                <v-btn class="left-button" small color="success" outlined><v-icon small>mdi-pencil</v-icon>編集</v-btn>
                <v-btn class="left-button" small color="error" outlined><v-icon small>mdi-trash-can</v-icon>削除</v-btn>
              </td>
            </tr>
          </tbody>
        </template>
      </v-data-table>
    </v-card>
    <v-dialog v-model="dialog">
      <UserDetail :user="user" @handleCancel="doCancel" />
    </v-dialog>
  </div>
</template>

<script>
import UserDetail from "@/views/user/components/UserDetail.vue"

export default {
  components: {
    UserDetail
  },
  data() {
    return {
      user: {},
      dialog: false,
      headers: this.users,
    }
  },
  mounted() {
    this.$store.dispatch("loadUsers");
  },
  computed: {
    users() {
      return this.$store.state.users;
    },
  },
  methods: {
    doCancel() {
      this.dialog = false;
    },
    clickRow: function(item) {
      const selected = this.items.indexOf(item);
      alert((selected + 1) + "行目をクリックしました。");
    },
  }
}
</script>

<style lang="scss">
.vip {
  width: 10px;
  padding: 0px;
}
.danger {
  width: 10px;
  padding: 0px;
}
.v-card__title {
  background-color: rgb(194, 189, 221);
}
.left-button {
  margin-left: 10px;
}
.btn-container {
  margin-right: 0px;
  margin-left: auto;
}
</style>