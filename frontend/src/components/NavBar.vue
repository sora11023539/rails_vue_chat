<template>
  <nav>
    <div>
      <p>
        Hello, <span class="name">{{ name }}</span>
      </p>
      <p class="email">{{ email }} is login</p>
    </div>
    <button @click="logout">Logout</button>
  </nav>
</template>

<script>
import axios from 'axios';
import removeItem from '@/auth/removeItem';

export default {
  data() {
    return {
      name: window.localStorage.getItem('name'),
      email: window.localStorage.getItem('uid'),
      error: null,
    };
  },

  methods: {
    async logout() {
      this.error = null;

      try {
        const res = await axios.delete('http://localhost:8000/auth/sign_out', {
          headers: {
            uid: this.email,
            'access-token': window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client'),
          },
        });

        if (!res) {
          new Error('Could not logout');
        }

        if (!this.error) {
          console.log('Logout');
          removeItem();
          this.$router.push({ name: 'Welcome' });
        }

        return res;
      } catch (error) {
        this.error = 'Could not logout';
      }
    },
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
