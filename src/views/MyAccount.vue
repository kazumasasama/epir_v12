<template>
<div class="container">
  <v-card elevation="2" outlined>
    <h1>ログイン</h1>
    <v-form ref="loginForm">
      <v-container>
        <div class="form-container">
          <v-col>
          <v-row
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="email"
              :rules="emailRules"
              label="メールアドレス"
              autocomplete="true"
              required
            ></v-text-field>
          </v-row>
          <v-row
            cols="12"
            md="4"
          >
            <v-text-field
              v-model="password"
              :rules="passwordRules"
              :append-icon="showPassword ? 'mdi-eye' : 'mdi-eye-off'"
              :type="showPassword ? 'text' : 'password'"
              label="パスワード"
              autocomplete="true"
              required
              @click:append="showPassword = !showPassword"
            ></v-text-field>
          </v-row>
        </v-col>
        <v-btn color="success" @click="login">ログイン</v-btn>
        <v-btn color="warning" @click="handleCancel">キャンセル</v-btn>
        </div>
      </v-container>
    </v-form>
  </v-card>
</div>
</template>

<script>

  export default {
    data: () => ({
      name: "Login",
      valid: false,
      password: '',
      showPassword: false,
      passwordRules: [
        v => !!v || '必須項目です',
        v => v.length <= 20 || '20文字までの英数記号',
      ],
      email: '',
      emailRules: [
        v => !!v || '必須項目です',
        v => /.+@.+/.test(v) || '例:test@example.com',
      ],
    }),
    methods: {
      handleCancel() {
        this.$router.back();
      },
    }
  }
</script>

<style scoped>
h1 {
  font-size: 20px;
  margin-top: 40px;
  margin-bottom: 30px;
}
button {
  margin: 50px 15px;
  margin-right: 15px;
}
.v-card {
  width: 400px;
  margin-top: 100px;
}
.container {
  display: flex;
  justify-content: center;
  align-items: center;
  text-align: center;
}
</style>