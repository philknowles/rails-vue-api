# Vue 3 + Vite

This template should help get you started developing with Vue 3 in Vite. The template uses Vue 3 `<script setup>` SFCs, check out the [script setup docs](https://v3.vuejs.org/api/sfc-script-setup.html#sfc-script-setup) to learn more.

## Recommended IDE Setup

- [VS Code](https://code.visualstudio.com/) + [Volar](https://marketplace.visualstudio.com/items?itemName=Vue.volar) (and disable Vetur) + [TypeScript Vue Plugin (Volar)](https://marketplace.visualstudio.com/items?itemName=Vue.vscode-typescript-vue-plugin).

## Setup Rails API

- rails new {directory} --api
- cd inside your directory
- In the Gemfile and uncomment the rack-cors gem.
- Access your cors.rb in the initializers folder, and uncomment the code.
- Change origins to * for development.
- rails g scaffold post title body:text
- cd in the directory if not already
- npm create vite@latest


https://www.youtube.com/watch?v=2Tm41U-dl24&ab_channel=Deanin