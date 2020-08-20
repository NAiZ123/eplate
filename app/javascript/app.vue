<template>
  <div id="app">
    <p>{{ message }}</p>
    <div class="text-center my-3">
      <b-button v-b-tooltip.hover title="You must be create account">write</b-button size="xl" variant="outline-primary>

      <b-button v-b-tooltip.hover title="You don't need create account">read</b-button size="xl" variant="outline-primary>
    </div>

  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Write or Read?"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 4em;
  text-align: center;
}


</style>
