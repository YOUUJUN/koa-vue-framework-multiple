<template>

    <div class="footer">

        <div class="view-container">
            <div class="view-area cols12">

                <span class="stat">Copyright @2005-2018 中国 铜陵 玉成软件科技有限责任公司</span>

            </div>
        </div>

    </div>

</template>

<script>
    export default {
        name: "Footer"
    }
</script>

<style scoped>

    .footer{
        padding: 23px 0;
        text-align: center;
        color:#9dacb6;
        background-color: #2188b6;
    }

    @media (max-width:767px) {
        .footer{
            font-size: 12px;
        }
    }

    .stat{

    }

</style>