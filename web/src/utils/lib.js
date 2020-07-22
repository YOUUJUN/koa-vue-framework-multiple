import axios from './http';
import echarts from "echarts";
import editormd from "editor.md/editormd.min";
import editormdconfig from "./editor.md";
import common from "./common";
import config from "./config";

var Rxport = {
    axios,
    echarts,
    editormd,
    editormdconfig,
    common,
    config
};

export default Rxport;