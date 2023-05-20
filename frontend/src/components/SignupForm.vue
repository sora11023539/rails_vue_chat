<template>
  <div>
    <h2>Sign up</h2>
    <form>
      <input type="text" required placeholder="Name" v-model="name" />
      <input type="email" required placeholder="Email" v-model="email" />
      <input type="password" required placeholder="Password" v-model="password" />
      <input type="password" required placeholder="Password confirmation" v-model="passwordConfirmation" />
      <button>Sign up</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
    };
  },
};
</script>
