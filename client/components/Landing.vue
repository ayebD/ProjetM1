<template>
    <div class="landing">
            <div class="text">
                <h1>
                    Bienvenu sur TECH WORLD <br> Site d'ecommerce d'objet tech 
                </h1>
            </div>
    </div>
</template>
<script>
  module.exports = {
    async mounted () {
        this.$emit('check-perm');
    }
  }
</script>
<style scoped>

    .landing{

        width: 100%;
        height: calc(100% - 130px);
        margin-top:0 ;
        background-size: cover;
        background-position: center center;
        background-image: url("https://images.pexels.com/photos/129208/pexels-photo-129208.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260");
        background-repeat: no-repeat;
        box-sizing: border-box;
        display: flex;
        justify-content: flex-end;
    }

    .text{

        width: 35%;
        margin-right: 50px;
        margin-top: 120px;
    }

    .text h1,
    .text h2{

        color: #fff;
    }
</style>
