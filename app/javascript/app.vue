<template>
  <div id="app">
    <p>{{ message }}</p>
  </div>
</template>

<script>
import Vvveb from './vvvebjs/libs/builder';
export default {
  data: function () {
    return {
      message: "Hello Vue!"
    }
  },
  mounted() {
    this.$nextTick(() => {
      $(document).ready(() => {
        Vvveb.Builder.init('./vvvebjs/demo/index.html', function() {
          //load code after page is loaded here
          Vvveb.Gui.init();
        });
      });
    })
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
