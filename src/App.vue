<template>
  <div id="app">
    <router-view />
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html {
  scroll-behavior: smooth;
}

body {
  font-family: 'Arial', sans-serif;
  line-height: 1.6;
  color: #333;
  background-color: #ffffff;
  margin: 0;
  padding: 0;
}

#app {
  min-height: 100vh;
  width: 100%;
  margin: 0;
  padding: 0;
}

/* 确保所有容器都有对称的布局 */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  width: 100%;
  box-sizing: border-box;
}

/* 移动端响应式设计 */
@media (max-width: 768px) {
  .container {
    padding: 0 1rem;
  }
}
</style>