CKEDITOR.editorConfig = function( config )
{
    // Define changes to default configuration here. For example:
  CKEDITOR.config.resize_enabled = true;
  CKEDITOR.config.width = 600;
  CKEDITOR.config.autoGrow_minHeight = 600;
  CKEDITOR.config.autoGrow_maxHeight = 600;
  CKEDITOR.config.toolbar_Full =
[
    ['Source','-','Save','NewPage','Preview','-','Templates'],
    ['Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
    ['Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField'], // here i disable the form tools
    '/',
    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote','CreateDiv'],
    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
    ['BidiLtr', 'BidiRtl' ],
    ['Link','Unlink','Anchor'],
    ['Image','Flash','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe'],
    '/',
    ['Styles','Format','Font','FontSize'],
    ['TextColor','BGColor'],
    ['Maximize', 'ShowBlocks','-','About']
];
config.removeButtons = 'Blockquote,Subscript,Superscript,RemoveFormat,BidiLtr,BidiRtl,About,CreateDiv,Outdent,Link,Unlink,Anchor,Checkbox,Image,Radio,TextField,Textarea,Select,Button,Flash,Templates,Table,HorizontalRule,Smiley,SpecialChar,PageBreak,Iframe,FontSize,Format,Font,Styles,Source,Save,Undo,Redo,Flash,Form,NewPage,Preview,Copy,Cut,Paste,PasteText,PasteFromWord,Print,Scayt';

config.height = '30em';
config.width = '5em';
}
;
