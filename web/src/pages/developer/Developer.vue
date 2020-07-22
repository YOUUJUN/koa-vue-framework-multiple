<template>
    <div id="app">

        <header>

            <navigation v-bind:list="navigationList"></navigation>

        </header>

        <main>


        </main>

        <footer>


        </footer>

    </div>
</template>
<script>
    const navigation = () => import("../../components/Navigation.vue");
    export default {
        components : {navigation},
        data() {

            return {
                navigationList : this.$store.state.navigationList,


            }

        },
        methods : {

        },

        created () {
            this.$store.dispatch("getUserLogStatus");
        },

        mounted() {

        }
    };
</script>
<style>

    @import "../../assets/css/youjun_base.css";
    @import "~font-awesome\css\font-awesome.min.css";

</style>
