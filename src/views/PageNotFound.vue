<template>
  <div class="container">
    <v-card
      elevation="2"
      outlined
      width:
    >
      <h1>404エラー</h1>
      <v-card-text>存在しないページか、アクセス権限が必要なページにアクセスしようとしています。</v-card-text>
      <v-btn
        color="primary"
        elevation="2"
        @click="handleClick"
      >ホームに戻る</v-btn>
    </v-card>
  </div>
</template>

<script>
export default {
  methods: {
    handleClick() {
      this.$router.replace("/")
    }
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