import axios from 'axios';
import config from "./config";

let myDIYAxios = function(options){

    console.log("well, i think i can do something here");

    let $axios = axios.create({
        baseURL : config.baseUrl(),
        withCredentials :true
    });

    $axios.interceptors.request.use(function (config) {
        let marscript = window.localStorage.getItem("marscript");
        if (marscript) {
            config.headers.accessToken = marscript;
            // config.headers['accessToken'] = Token;
        }
        return config;
    }, function (error) {
        return Promise.reject(error);
    });


    return $axios(options);
}

export default myDIYAxios;