<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <div>
      <input v-model="novoProduto" />
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
.hello {
  background: #fafafa;
  padding: 50px;
}
</style>
