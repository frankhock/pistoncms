CKEDITOR.config.allowedContent = true // Allow source code to be edited
CKEDITOR.config.toolbar= [
                    { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
                    { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source' ] },
                    { name: 'others', items: [ '-' ] },
                    { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Strike', '-', 'RemoveFormat' ] },
                    { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', '-', 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock' ] },
                    { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Scayt' ] },
                    { name: 'styles', items : [ 'Styles','Format','Font','FontSize' ] },
                    { name: 'colors', items : [ 'TextColor','BGColor' ] },
                    { name: 'tools', items : [ 'About' ] }
                  ]
CKEDITOR.config.height = '400px';