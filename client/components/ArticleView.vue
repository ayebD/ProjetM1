<template>
    <div class="container">
        <div class="allArticle">
          <div class="ArticleAllText">
            <h1 class="ArticleName">
                {{ selected.title }}
            </h1>
            <div class = "ArticleImage" :style="{ backgroundImage: 'url(' + selected.image + ')' }"></div>
            <div class="Articlet">
                {{ selected.text}}
            </div>
            <h4> {{ selected.price }} </h4>
            <button @click="back2back">Tous les produits</button>
          </div>
        </div>
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
              price: "personne"
            }
          }
        }
      },
      data () {
          return {
              selectedId: -1
          }
      },
      async mounted () {

            this.$emit('check-perm');
            this.selectedId = this.$route.query.id
            this.$emit('get-article-infos', this.selectedId);
            console.log(this.selected)

      },
      methods: {
          back2back(){
              location.replace("/#/home")
          }
      }
    }
</script>
