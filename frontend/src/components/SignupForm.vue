<template>
  <div>
    <h2>Sign up</h2>
    <form @submit.prevent="signUp">
      <input type="text" required placeholder="Name" v-model="name" />
      <input type="email" required placeholder="Email" v-model="email" />
      <input type="password" required placeholder="Password" v-model="password" />
      <input type="password" required placeholder="Password confirmation" v-model="passwordConfirmation" />
      <div class="error">{{ error }}</div>
      <button>Sign up</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';
import setItem from '@/auth/setItem';

export default {
  emits: ['redirectToChatRoom'],

  data() {
    return {
      name: '',
      email: '',
      password: '',
      passwordConfirmation: '',
      error: null,
    };
  },

  methods: {
    async signUp() {
      this.error = null;

      try {
        const res = await axios.post('http://localhost:8000/auth', {
          name: this.name,
          email: this.email,
          password: this.password,
          password_confirmation: this.password_confirmation,
        });

        if (!res) {
          throw new Error('Could not signup');
        }

        if (!this.error) {
          setItem(res.headers, res.data.data.name);
          this.$emit('redirectToChatRoom');
        }

        console.log({ res });
        return res;
      } catch (error) {
        this.error = 'Could not signup';
      }
    },
  },
};
</script>
