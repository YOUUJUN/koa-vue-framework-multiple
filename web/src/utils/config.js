export default {

    devBaseUrl : 'http://localhost:3000',
    prodBashUrl : 'http://106.13.63.236',

    baseUrl (){
        if(process.env.NODE_ENV === "development" || process.env.NODE_ENV === "devBuild"){
            return this.devBaseUrl;
        }else{
            return this.prodBashUrl
        }
    }


};