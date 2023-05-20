<template>
  <nav>
    <div>
      <p>Hello, <span class="name">{{ name }}</span></p>
      <p class="email">{{ email }} is login</p>
    </div>
    <button>Logout</button>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      name: window.localStorage.getItem('name'),
      email: window.localStorage.getItem('uid'),
    };
  },
};
</script>

<style scoped>
nav {
  padding: 20px;
  border-bottom: 1px solid #eee;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
nav p {
  margin: 2px auto;
  font-size: 16px;
  color: #444;
}
nav p.email {
  font-size: 14px;
  color: #999;
}
</style>
