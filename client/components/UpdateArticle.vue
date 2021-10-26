<template>
    <div class="container">
      <article>
          <h2> Modifier l'article</h2>
          <div class="ArticleTarget">
            <label>Titre</label>
            <textarea v-model="selected.title" class="TextUpdate"></textarea>
            <label>Image</label>
            <textarea v-model="selected.image" class = "TextUpdate" :style="{ backgroundImage: 'url(' + selected.image + ')' }"> </textarea>
            <label>Text</label>
            <textarea v-model="selected.text" class="TextUpdate"></textarea>
            <label>price</label>
            <textarea v-model="selected.price" class="TextUpdate"> </textarea>
            <button @click="edit">Valider</button>
          </div>
      </article>
    </div>
</template>

<script>
    module.exports = {
      props: {
          articles: { type: Array, default: [] },
          selected: { type: Object, default: () => {
            return {
              id: -1,
              title: "oupsi",
              text: "il y a eut un problème :/",
              image: "aucune",
              price: "0"
            }
          }
        }
      },
      data () {
          return {
              selectedId: -1,
              editingArticle: {
                id: -1,
                title: "",
                text: "",
                image: "",
                price: ""
              }
          }
      },
      async mounted () {
          this.$emit('check-perm');
          this.selectedId = this.$route.query.id;
          console.log(this.selectedId)
          this.$emit("get-article-infos", this.selectedId)
      },
      methods: {
          edit() {
            this.$emit('edit-article', this.selected);
            location.replace('#/home');
          }
      }
    }
</script>
<style>

  .ArticleTarget{

    margin-top: 50px;
    height: 400px;
    width: 500px;
    display: flex;
    flex-direction: column;
    align-items: center;
    background:rgba(0,0,0,0.49);
    padding: 20px 50px 50px 50px;
    border-radius: 10px;
    box-shadow: 0 15px 25px rgba(0,0,0,.5);
  }

  .TextUpdate{

    width: 80%;
    height: 200px;
  }

  h2{

    text-align: center
  }

  button{
    background: transparent;
    border: none;
    color: #fff;
    border: solid 1px #fff;
    padding: 10px 20px;
    cursor: pointer;
    border-radius: 5px;
    transition: 1s;
    display: block ;
    width: 100%;
    text-align: center;
    margin-top: 50px;
  }


</style>
