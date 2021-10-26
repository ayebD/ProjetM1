<template>
  <div class="Container">
    <div id="isConnected" v-if="users.userId !== -1">
      <form @submit.prevent="addArticle">
        <h2>Ajouter un nouvelle article</h2>
        <div class="ArticleTarget">
            <label>Titre</label>
            <textarea type="text" v-model="newArticle.title" name="title" placeholder="Titre de l'artcile" class = "TextUpdate" required></textarea>
            <label>Text</label>
            <textarea type="text" v-model="newArticle.text" name="text" placeholder="text de l'article" class = "TextUpdate" required></textarea>
            <label>Image</label>
            <textarea type="text" v-model="newArticle.image" name="image" class = "TextUpdate" placeholder="Lien vers l'image"></textarea>
            <button type="submit">Ajouter</button>
        </div>
      </form>
    </div>
    <div id="notConnected" v-else>
      <h2>Vous devez être connecté</h2>
      <a href="#/login"> se connecter </a>
    </div>
  </div>
</template>

<script>
  module.exports = {
    props: {
      users: { type: Object, default: () => {
        return {
          userName: "none",
          userId: -1,
          userPerm: 1,
        }
      }}
    },
    data () {
      return {
        newArticle: {
          title: "",
          text: "",
          image: "",
          price: ""
        }
      }
    },
    async mounted() {
      this.$emit('check-perm');
      this.newArticle.price = this.users.userName;
    },
    methods: {
      addArticle () {
        this.$emit('add-article', this.newArticle)
      },

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

.TextUpdate{

  width: 80%;
  height: 200px;
}

h2{

  text-align: center
}

</style>
