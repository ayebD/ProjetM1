<template>
  <div class="container">
    <div id="allArticle">
      <article v-for="article in articles" :key="article.id" class="article">
        <div class="article-img" :style="{ backgroundImage: 'url(' + article.image + ')' }"></div>
        <div class="article-infos">
          <div class="article-buttons">
            <button @click="openArticle(article.id)">En savoir plus</button>
            <button @click="deleteArticle(article.id)" v-if="users.userPerm === '1'">Supprimer</button>
            <button @click="editArticle(article.id)" v-if="users.userPerm === '1'">Modifier</button>
          </div>
          <h2 class="article-title"> {{ article.title }} </h2>
          <h4 class="article-price"> {{ article.price }} </h4>
          <div class="article-content" style="display: none">
            <div class="article-title">
              <h2><input type="text"></h2>
              <div>
                <button @click="sendEditArticle()">Valider</button>
                <button @click="abortEditArticle()">Annuler</button>
              </div>
            </div>
            <p><textarea></textarea></p>
            <input type="text" placeholder="Lien vers l'image">
          </div>
        </div>
      </article>
    </div>
  </div>
</template>

<script>
module.exports = {
  props: {
    articles: { type: Array, default: [] },
    users: { type: Object, default: () => {
        return {
          userName: "none",
          userId: -1,
          userPerm: 0
        }
      }
    }
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
  },
  methods: {
    alreadyBuy(articleId) {
      return this.panier.articles.some( e => e.id == articleId )
    },
    removeFromPanier(articleId) {
      this.$emit('remove-from-panier', articleId)
    },
    addArticle () {
      this.$emit('add-article', this.newArticle)
    },
    deleteArticle (articleId) {
      this.$emit('delete-article', articleId)
    },
    editArticle (articleId) {
      location.replace("#/updateArticle?id=" + articleId);
    },
    sendEditArticle () {
      this.$emit('update-article', this.editingArticle)
      this.abortEditArticle()
    },
    abortEditArticle () {
      this.editingArticle = {
        id: -1,
        name: '',
        description: '',
        image: '',
        price: 0
      }
    },
    openArticle(articleId){
      location.replace("#/ArticleView?id=" + articleId)
    }
  }
}
</script>

<style scoped>

  #allArticle {
    background-color: transparent;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    align-items: center;
    width: 100%;
  }

  article {

    padding: 20px;
    width: 800px;
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: flex-start;
    height: 200px;
    border-radius: 20px;
    margin: 20px;
    background: linear-gradient(-45deg, #5770ff, #c644fd);
    color: white;
    box-shadow: 0 0 12px 1px rgba(0, 0, 0, 0.3);

  }

  @media (max-width: 400px) {

article {
width: 100%!important;
    }

  }

  .article-title {

    font-size: 25px;

  }

  .article-img {

    height: 100%;
    width: 30%;
    background-size: cover;
    background-position: center;

  }

  article:hover .article-img {

    background-size: calc(cover + 20px);

  }

  .article-infos {

    height: 100%;
    width: 70%;
    box-sizing: border-box;
    padding: 20px;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: flex-start;
    transform: scale(1);

  }

  .article-buttons {

    position: absolute;
    bottom: 10px;
    right: 10px;
    display: flex;
    flex-direction: row;

  }

  .article-buttons button {

    padding: 10px;
    background-color: white;
    box-shadow: 0 0 12px 1px rgba(0, 0, 0, 0.3);
    border-radius: 3px;
    color: black;
    border: none;
    margin-right: 10px;
    font-size: 13px;

  }

</style>
