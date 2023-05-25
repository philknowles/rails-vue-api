<template>
  <div>
    <h1>Micro Manager</h1>
    <input type="date" 
      v-model="date"
      placeholder="date"
      class="title-input">

      <input type="text" 
      v-model="time"
      placeholder="time"
      class="title-input">

      <input type="text" 
      v-model="description"
      placeholder="description"
      class="title-input">

      <input type="text" 
      v-model="owner"
      placeholder="owner"
      class="title-input">

      <input type="text" 
      v-model="category"
      placeholder="category"
      class="title-input">

      <input type="date" 
      v-model="due_date"
      placeholder="due date"
      class="title-input">

      <input type="text" 
      v-model="status"
      placeholder="status"
      class="title-input">

      <textarea  
      v-model="notes"
      placeholder="notes"
      class="title-input"></textarea>
</div>
</template>

<script setup>

</script>

<style scoped>
.title-input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid #ccc;
    background-color: #f8f8f8;
    color: #111;
    border-radius: 4px;
    resize: vertical;
}

.body-input {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border: 2px solid #ccc;
    background-color: #f8f8f8;
    color: #111;
    border-radius: 4px;
    resize: vertical;
}
</style>