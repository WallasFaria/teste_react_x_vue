<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <div>
      <input v-model="novoProduto" @keypress.enter="add()" />
      <button @click="add()">Add</button>
    </div>
    <ul>
      <li v-for="produto in produtos" :key="produto.id">{{ produto.nome }}</li>
    </ul>
    {{msg}}
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { Produto } from "@/models/produto";

export default Vue.extend({
  name: "HelloWorld",
  props: {
    msg: String
  },

  data() {
    return {
      novoProduto: "",
      produtos: [{ id: 12, nome: "Produto Teste" }] as Array<Produto>
    };
  },

  methods: {
    add(): void {
      this.produtos.push({
        id: this.produtos.length + 1,
        nome: this.novoProduto
      });
      this.novoProduto = "";
    }
  }
});
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
ul {
  width: 300px;
  margin: 20px auto;
  padding: 0;
  border-radius: 5px;
  border: 1px solid #ddd;

  li {
    padding: 10px 15px;
    border-bottom: 2px solid #eee;
    list-style: none;
    text-align: left;

    &:last-child {
      border-bottom: none;
    }
  }
}
</style>
