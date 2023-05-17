<template>
  <div>
    This is appeared from component
    <p>{{ message }}</p>
    <button @click="onClick">Execute parent method button</button>
  </div>
</template>

<script>
export default {
  props: [
    'message',
    'isEnabled'
  ],

  methods: {
    onClick() {
      this.$emit('toggle')
    }
  }
}
</script>
