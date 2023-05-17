<template>
  <div>
    <h1>{{ title }}</h1>
    <p v-if="isEnabled">{{ subtitle }}</p>
    <button @dblclick="toggle">toggle</button>
    <p>{{ text }}</p>
  </div>
</template>

<script>
export default {
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
