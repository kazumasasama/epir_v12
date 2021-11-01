<template>
  <v-card elevation="2" outlined>
    <div class="card-header">
      <v-hover>
        <template v-slot:default="{ hover }">
        <v-avatar size="100" @click="overlay = !overlay">
          <img src="https://cdn.vuetifyjs.com/images/john.jpg">
          <v-fade-transition>
          <v-overlay v-if="hover" :absolute="absolute">
            <v-btn color="yellow darken-3" @click="showModal"><v-icon>mdi-upload</v-icon>画像編集</v-btn>
          </v-overlay>
          </v-fade-transition>
        </v-avatar>
        </template>
      </v-hover>
      <div class="card-header-text">
        <p>ID: {{ user.id }}</p>
        <h1>{{ user.last_name + " " + user.firat_name }}</h1>
      </div>
    </div>
      <v-divider></v-divider>
      <v-simple-table>
        <template v-slot:default>
          <tbody class="text-left">
            <tr>
              <th>LINE</th>
              <td>{{ user.line_id }}</td>
            </tr>
            <tr>
              <th>TEL1</th>
              <td>{{ user.phone }}</td>
            </tr>
            <tr>
              <th>メール</th>
              <td>{{ user.email }}</td>
            </tr>
            <tr>
              <th>郵便番号</th>
              <td>{{ user.zip }}</td>
            </tr>
            <tr>
              <th>都道府県</th>
              <td>{{ user.prefecture }}</td>
            </tr>
            <tr>
              <th>住所</th>
              <td>{{ user.address }}</td>
            </tr>
            <tr>
              <th>性別</th>
              <td>{{ user.gender }}</td>
            </tr>
            <tr>
              <th>生年月日</th>
              <td>{{ user.birthday }}</td>
            </tr>
            <tr>
              <th>お客様ノート</th>
              <td>{{ user.customer_note }}</td>
            </tr>
            <tr>
              <th>メモ</th>
              <td>{{ user.memo }}</td>
            </tr>
          </tbody>
        </template>
      </v-simple-table>
      <v-divider></v-divider>
      <v-btn color="success" @click="handleEdit">編集</v-btn>
      <v-btn color="warning" @click="handleCancel">戻る</v-btn>
  </v-card>
</template>

<script>
export default {
  props: {
    user: {
      default() {
        return {
          first_name: "",
          last_name: "",
          email: "",
          password: "",
          password_confirmation: "",
          phone: "",
          line_id: "",
          birthday: "",
          gender: "",
          zip: "",
          prefecture: "",
          address: "",
          memo: "",
          customer_note: "",
        }
      }
    }
  },
  methods: {
    hamdleCancel() {
      this.$emit("close")
    }
  }
}
</script>
