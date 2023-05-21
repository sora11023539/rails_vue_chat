<template>
  <div class="container">
    <NavBar />
    <ChatWindow :messages="messages" />
    <NewChatForm @connectCable="connectCable" />
  </div>
</template>

<script>
import axios from 'axios';
import ActionCable from 'actioncable';

import NavBar from '@/components/NavBar.vue';
import ChatWindow from '@/components/ChatWindow.vue';
import NewChatForm from '@/components/NewChatForm.vue';

export default {
  components: { NavBar, ChatWindow, NewChatForm },

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

    connectCable(message) {
      this.messageChannel.perform('receive', {
        message: message,
        email: window.localStorage.getItem('uid'),
      });
    },
  },

  mounted() {
    const cable = ActionCable.createConsumer('ws://localhost:8000/cable');
    this.messageChannel = cable.subscriptions.create('RoomChannel', {
      connected: () => {
        this.getMessages();
      },
      received: () => {
        this.getMessages();
      },
    });
  },

  beforeUnmount() {
    this.messageChannel.unsubscribe();
  },
};
</script>

<style scoped></style>
