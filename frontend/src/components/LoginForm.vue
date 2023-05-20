<template>
  <div>
    <h2>Login</h2>
    <form @submit.prevent="login">
      <input type="email" required placeholder="Mail address" v-model="email" />
      <input type="password" required placeholder="Password" v-model="password" />
      <div class="error">{{ error }}</div>
      <button>Login</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  emits: ['redirectToChatRoom'],

  data() {
    return {
      email: '',
      password: '',
      error: null,
    };
  },

  methods: {
    async login() {
      try {
        this.error = null;

        const res = await axios.post('http://localhost:8000/auth/sign_in', {
          email: this.email,
          password: this.password,
        });

        if (!res) {
          throw new Error('Incorrect email or password');
        }

        if (!this.error) {
          this.$emit('redirectToChatRoom');
        }

        console.log({ res });
        return res;
      } catch (error) {
        console.log({ error });
        this.error = 'Incorrect email or password';
      }
    },
  },
};
</script>
