UPLOADCARE_PUBLIC_KEY = "e2dc3ae396e76af502b5" // Uploadcare public key
CKEDITOR.config.extraPlugins = 'uploadcare'
CKEDITOR.config.toolbar= [
                    { name: 'insert', items: [ 'Uploadcare' ] },
                    { name: 'tools', items: [ 'Maximize' ] },
                    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
                    { name: 'others', items: [ '-' ] },
                    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
                    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
                    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Scayt' ] },
                    '/',
                    { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
                    { name: 'colors', items : [ 'TextColor','BGColor' ] },
                    { name: 'tools', items : [ 'Maximize', 'ShowBlocks','-','About' ] }
                  ]