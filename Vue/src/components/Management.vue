<template>
          <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">Micro Manager</div>
                <div class="list-group list-group-flush p-2">
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

                <button v-if="isEditing" @click="updateRecord">Update</button>
                <button v-if="isEditing" @click="cancelRecord">Cancel</button>
                <button v-else @click="createRecord">Create</button>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item active"><a class="nav-link" href="#!">Home</a></li>
                                <li class="nav-item"><a class="nav-link" href="#!">Link</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                    <h1 class="mt-4">Time Sheet</h1>
                    <p>This timesheet helps keep track of all work done for a given day.  This is useful for project management, scrum, and productivity.  Add a task, bug, story, or anything else you need to track for a given day.</p>
                    <p>
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum non ornare diam. Ut malesuada ornare massa. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum eget maximus est, a pretium dolor. Sed consequat augue in nunc efficitur, vitae ultricies lorem mattis. Morbi vestibulum justo ac imperdiet ultricies. Cras varius, ipsum quis finibus dapibus, elit augue rutrum nunc, vitae bibendum neque sem non lacus. Vestibulum tortor turpis, pretium non semper in, aliquam quis augue.
                    </p>

                    {{ totalTimeSpent }}
                    <table class="table table-striped" style="width:100%;">
                      <thead>
                        <tr>
                          <td>
                              Date
                          </td>
                          <td>
                            Time Spent<small><i>(hh.mm)</i></small>
                          </td>
                          <td>
                            Description
                          </td>
                          <td>
                            Owner
                          </td>
                          <td>
                            Category
                          </td>
                          <td>
                            Due Date
                          </td>
                          <td>
                            Status
                          </td>
                          <td>
                            Notes
                          </td>
                        </tr>
                      </thead>
                      <tbody>
                          <tr v-for="(item) in (managements)" :key="item.id">
                            <td>
                              {{ item.date }}
                            </td>
                            <td>
                              {{ item.time }}
                            </td>
                            <td>
                              {{ item.description }}
                            </td>
                            <td>
                              {{ item.owner }}
                            </td>
                            <td>
                              {{ item.category }}
                            </td>
                            <td>
                              {{ item.due_date }}
                            </td>
                            <td>
                              {{ item.status }}
                            </td>
                            <td>
                              {{ item.notes }}
                            </td>
                            <td style="text-align:right;">
                              <button class="btn-icons" @click="editRecord(item.id)"><font-awesome-icon icon="fa-solid fa-pencil" /></button>
                              <button class="btn-icons" @click="deleteRecord(item.id)"><font-awesome-icon icon="fa-solid fa-trash-can" /></button>
                            </td>
                          </tr>
                      </tbody>
                  </table>
                </div>
            </div>
        </div>
</template>

<script setup>
  import {ref, onMounted} from 'vue';

  const managements = ref([]);
  const date = ref('');
  const time = ref('');
  const description = ref('');
  const owner = ref('');
  const category = ref('');
  const due_date = ref('');
  const status = ref('');
  const notes = ref('');
  const record_id = ref(0);
  const isEditing = ref(false);
  const API_URL = "http://localhost:3000/managements";

  onMounted(async() => {
    const res = await fetch(API_URL)
    managements.value = await res.json()
  })

  const createRecord = async() => {
    const res = await fetch(API_URL, {
      method: "POST",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        date: date.value,
        time: time.value,
        description: description.value,
        owner: owner.value,
        category: category.value,
        due_date: due_date.value,
        status: status.value,
        notes: notes.value
      })
    })

    const data = await res.json()

    managements.value.push(data)
    date.value = ''
    time.value = ''
    description.value = ''
    owner.value = ''
    category.value = ''
    due_date.value = ''
    status.value = ''
    notes.value = ''
    record_id.value = 0;

  }


  const updateRecord = async() => {
    const res = await fetch(`${API_URL}/${record_id.value}`, {
      method: "PUT",
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        date: date.value,
        time: time.value,
        description: description.value,
        owner: owner.value,
        category: category.value,
        due_date: due_date.value,
        status: status.value,
        notes: notes.value,
        id: record_id.value
      })
    })

    const data = await res.json()

    const index = managements.value.findIndex(item => item.id === data.id)
    managements.value[index] = data

    date.value = ''
    time.value = ''
    description.value = ''
    owner.value = ''
    category.value = ''
    due_date.value = ''
    status.value = ''
    notes.value = ''
    record_id.value = 0
    isEditing.value = false
  }

  const cancelRecord = () => {
    date.value = ''
    time.value = ''
    description.value = ''
    owner.value = ''
    category.value = ''
    due_date.value = ''
    status.value = ''
    notes.value = ''
    record_id.value = ''
    isEditing.value = false
  }

  const editRecord = async(id) => {
    const item = managements.value.find(item => item.id === id)

    date.value = item.date
    time.value = item.time
    description.value = item.description
    owner.value = item.owner
    category.value = item.category
    due_date.value = item.due_date
    status.value = item.status
    notes.value = item.notes
    record_id.value = item.id
    isEditing.value = true

    window.scrollTo({
      top: 0,
      behavior: 'smooth'
    })
  }

  const deleteRecord = async(id) => {
    await fetch(`${API_URL}/${id}`, {
      method: 'DELETE'
    })
    managements.value = managements.value.filter(item => item.id !== id)
  }

  function computed() {
   return managements.value.filter(item => item.time) 
  }
  const totalTimeSpent = computed()
  
</script>

<style scoped>
.container-fluid {
  width:100%;
}
.title-input {
    width: 100%;
    max-height:35px;
    padding: 3px 20px;
    margin: 8px 2px;
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

button.btn-icons {
  padding:5px;
  margin:0 5px;
  background:none;
}
</style>