<template>
   <div class ="main">
       <div class="conta">
           <form  v-on:submit.prevent="login(name, pw)">
               <div class="title">
                   <h2>Connexion</h2>
               </div>
               <div class="reponse">
                   <label for="email">Email</label>
                   <input v-on:input="name = $event.target.value" type="text" name="email">
                   <label for="password">Mot de passe</label>
                   <input v-on:input="pw = $event.target.value" type="password" name="password">
               </div>
               <input type="submit" value="Connexion">
               <p>si tu n'a pas de compte inscrit toi <a v-bind:href="'#/Register'">ici</a></p>
           </form>
       </div>
    </div>
</template>

<script>
module.exports = {
    props: {

  },
  data () {
    return {
      name: "",
      pw : "",
    }
  },
    methods: {
        login(email,password){
            this.$emit("login",email, password)
        }
    }
}
</script>
