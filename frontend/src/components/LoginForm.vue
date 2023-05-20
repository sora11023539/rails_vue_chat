<template>
  <div>
    <h2>Login</h2>
    <form>
      <input type="email" required placeholder="Mail address" v-model="email" />
      <input type="password" required placeholder="Password" v-model="password" />
      <button>Login</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
    };
  },
};
</script>
