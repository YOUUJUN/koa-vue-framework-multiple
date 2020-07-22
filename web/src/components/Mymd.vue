<template>
    <div class="markdown-editor-box">
        <link rel="stylesheet" href="/lib/editor.md/css/editormd.css">
        <div id="editorId" ref="editorId" class="hide"></div>
    </div>
</template>
<script>
    import scriptjs from 'scriptjs'
    import  defaultConfig  from '../utils/editor.md'
    export default {
        props: {
            config: { // 编辑器配置
                type: Object
            },
            preview : {
                type : Boolean
            },
            initData: {
                'type': String
            },

            syncContent : {
                type : String
            }
        },
        data: function () {
            return {
                editor: null,
                timer: null,
                doc: {},
                jsLoadOver: false,
                markdownChecker : false //检查markdown内容是否已经渲染
            }
        },
        methods: {
            fetchScript: function (url) {
                return new Promise((resolve) => {
                    scriptjs(url, () => {
                        resolve()
                    })
                })
            },
            getConfig: function () {
                return { ...defaultConfig, ...this.config }
            },
            getEditor: function () {
                return this.editor
            },
            getDoc: function () {
                return this.doc
            },
            watch: function () {
                return this.editor.watch()
            },
            unwatch: function () {
                return this.editor.unwatch()
            },
            previewing: function () {
                return this.editor.previewing()
            },
            getHTML: function () {
                return this.editor.getHTML()
            },
            getMarkdown: function () {
                return this.editor.getMarkdown()
            },
            setMarkdown: function (markdown) {
                return this.editor.setMarkdown(markdown)
            },
            init () {
                let vm = this;

                if(vm.preview){
                    vm.initPreView(vm.initData);
                }else{
                    vm.initEditor();
                }
            },
            initPreView: function (markdown) {
                let vm = this;
                let config = vm.getConfig();
                if (markdown) {
                    config.markdown = markdown
                }
                (async () => {
                    await vm.fetchScript('/lib/editor.md/jquery.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/marked.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/prettify.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/raphael.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/underscore.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/sequence-diagram.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/flowchart.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/jquery.flowchart.min.js');
                    await vm.fetchScript('/lib/editor.md/editormd.min.js');
                    vm.jsLoadOver = true;
                    vm.$nextTick(() => {




                        // vm.editor = window.editormd("editorId", config);
                        vm.editor = editormd.markdownToHTML("editorId", config);
                        this.$refs["editorId"].classList.remove("hide");

                        // vm.editor.on('load', () => {
                        //     vm.editor.setMarkdown("hello");
                        // });
                        vm.editor.on('change', () => {
                            vm.editor = editormd.markdownToHTML("editorId", config);

                            // let html = vm.editor.getPreviewedHTML()
                            // vm.onchange({
                            //     markdown: vm.editor.getMarkdown(),
                            //     html: html,
                            //     text: window.$(html).text()
                            // })
                        })
                    })
                })()
            },
            initEditor: function (markdown) {
                let vm = this;
                let config = vm.getConfig();
                if (markdown) {
                    config.markdown = markdown
                }

                (async () => {
                    await vm.fetchScript('/lib/editor.md/jquery.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/marked.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/prettify.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/raphael.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/underscore.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/sequence-diagram.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/flowchart.min.js');
                    await vm.fetchScript('/lib/editor.md/lib/jquery.flowchart.min.js');
                    await vm.fetchScript('/lib/editor.md/editormd.min.js');
                    vm.jsLoadOver = true;
                    vm.$nextTick(() => {

                        config.onload = function() {
                            let codeMirror = this.codeMirror[0];

                            let callback = function(mutations){
                                for(let mutation of mutations){
                                    if(mutation.type === "attributes"){
                                        let classList = codeMirror.getAttribute("class");
                                        if(classList.indexOf("CodeMirror-focused") === -1){
                                            vm.$emit("draftsStorage");
                                        }
                                    }
                                }
                            };
                            let config = { attributes: true, childList: false, subtree: false };
                            let observer = new MutationObserver(callback);
                            observer.observe(codeMirror,config);
                        };

                        vm.editor = editormd("editorId", config);
                        vm.markdownChecker = true;
                        this.$refs["editorId"].classList.remove("hide");


                        // vm.editor.on('load', () => {
                        //     vm.editor.setMarkdown("hello");
                        // });
                        // vm.onchange && vm.editor.on('change', () => {
                        //     let html = vm.editor.getPreviewedHTML()
                        //     vm.onchange({
                        //         markdown: vm.editor.getMarkdown(),
                        //         html: html,
                        //         text: window.$(html).text()
                        //     })
                        // })
                    })
                })()
            }
        },
        watch: {
            initData (newV, oldV){
                // this.config.markdown = newV;
                var docArea = this.$refs["editorId"];
                var textArea = document.createElement("textarea");
                docArea.innerHTML = '';
                docArea.appendChild(textArea);
                textArea.value = newV;
                editormd.markdownToHTML("editorId", this.config);
            },

            syncContent(newValue, oldValue){
                console.log("newValue =====>",newValue);
                // this.config.markdown = newValue;
            }
        },
        mounted: function () {
            let vm = this;
            vm.init();
            vm.timer = setInterval(function () {
                if (vm.editor && vm.jsLoadOver) {
                    try {
                        vm.watch();
                        // vm.previewing();
                        window.clearInterval(vm.timer);
                        vm.timer = null
                    } catch (e) {
                    }
                }
            }, 80);
        },

        destroyed: function () {
            let vm = this;
            if (vm.timer != null) {
                window.clearInterval(vm.timer);
                vm.timer = null
            }
        }
    }
</script>
<style>
    #editorId{
        box-sizing: border-box;
        z-index: 998;
    }
</style>