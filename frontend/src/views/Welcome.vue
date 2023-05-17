<template>
  <div>
    <h1>{{ title }}</h1>
    <TestComponent @toggle="toggle" message="Give data for component" />
    <p v-if="isEnabled">hello</p>
  </div>
</template>

<script>
import TestComponent from "@/components/TestComponent.vue";

export default {
  components: {
    TestComponent
  },

  data() {
    return {
      title: 'New vue app',
      subtitle: 'ようこそ',
      isEnabled: true,
    };
  },

  computed: {
    text() {
      if (this.isEnabled) {
        return 'hello'
      } else {
        return 'bye'
      }
    }
  },

  methods: {
    toggle() {
      this.isEnabled = !this.isEnabled
    }
  }
};
</script>

<style scoped>
  p {
    font-size: 20px;
    color: blue;
  }
</style>
