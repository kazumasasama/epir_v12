<template>
  <div>
    <Header />
  </div>
</template>

<script>
import Header from "@/components/Header.vue"

export default {
  name: 'App',
  components: {
    Header,
  },
  methods: {
  }
}
</script>

<style scoped>
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
</style>