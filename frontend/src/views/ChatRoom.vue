<template>
  <div class="container">
    <NavBar />
    <ChatWindow :messages="messages" />
  </div>
</template>

<script>
import axios from 'axios';

import NavBar from '@/components/NavBar.vue';
import ChatWindow from '@/components/ChatWindow.vue';

export default {
  components: { NavBar, ChatWindow },

  data() {
    return {
      messages: [],
    };
  },

  methods: {
    async getMessages() {
      try {
        const res = await axios.get('http://localhost:8000/messages', {
          headers: {
            uid: window.localStorage.getItem('uid'),
            'access-token': window.localStorage.getItem('access-token'),
            client: window.localStorage.getItem('client'),
          },
        });

        if (!res) {
          new Error('Could not get messages');
        }

        this.messages = res.data;
      } catch (err) {
        console.log(err);
      }
    },
  },

  mounted() {
    this.getMessages();
  },
};
</script>

<style scoped></style>
