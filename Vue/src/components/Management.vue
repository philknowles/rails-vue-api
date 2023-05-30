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

      <!-- <input type="text" 
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
      class="title-input"></textarea> -->

      <button v-if="isEditing" @click="updateRecord">Update</button>
      <button v-if="isEditing" @click="cancelRecord">Cancel</button>
      <button v-else @click="createRecord">Create</button>

      <div v-for="item in managements" :key="item.id">
        <h5>{{item.id}} {{ item.title }}</h5>
        <p>{{ item.date }} {{ item.time }} {{ item.description }}{{ item.owner }}{{ item.category }}{{ item.due_date }}{{ item.status }}</p>
        <p>{{ item.notes }}</p>
        <button @click="editRecord(item.id)">Edit</button>
        <button @click="deleteRecord(item.id)">Delete</button>
      </div>

</div>
</template>

<script setup>
  import {ref, onMounted} from 'vue';

  const managements = ref([]);
  const date = ref('');
  const time = ref('');
  const description = ref('');
  const record_id = ref(0);
  const isEditing = false;
  const API_URL = "http://localhost:3000/managements";

  const createRecord = async() => {
    const res = await fetch(API_URL, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        date: date.value,
        time: time.value,
        description: description.value
      })
    })

    const data = await res.json()

    managements.value.push(data)
    date.value = ''
    time.value = ''
    description.value = ''
    record_id.value = 0;

    console.log(data)
  }

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