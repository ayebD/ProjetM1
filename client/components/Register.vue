<template>
    <div class="main">
        <div class="conta">
            <form v-on:submit.prevent="inscription(name, pw)">
                <div class="title">
                    <h2>Inscription</h2>
                </div>
                <div class="reponse">
                    <label for="email">Email</label>
                    <input v-on:input="name = $event.target.value" type="text" required>
                    <label for="">Password</label>
                    <input v-on:input="pw = $event.target.value" type="password" name="password" required >
                    <input type="submit" value="Inscription">
                </div>
            </form>
            <p>si tu as déjà un compte connecte toi <a v-bind:href="'#/Login'">ici</a></p>
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
        inscription(email,password){
            this.$emit("inscription",email, password)
        }
    }
}
</script>
