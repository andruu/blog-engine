// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require epiceditor
//= require jquery.slugify
//= require css_browser_selector
//= require select2

$('.slug').slugify('.title');

$('#page_tag_list').select2({containerCssClass: 'myselect2', tags:$('#tag-list').data('tags'), tokenSeparators: [","]});

if ($('#epiceditor').length >= 1) {
  var opts = {
    container: 'epiceditor',
    basePath: '/epiceditor',
    clientSideStorage: false,
    parser: marked,
    theme: {
      base:'/themes/base/epiceditor.css',
      preview:'/themes/preview/preview-dark.css',
      editor:'/themes/editor/epic-dark.css'
    },
    focusOnLoad: false,
    shortcut: {
      modifier: 18,
      fullscreen: 70,
      preview: 80,
      edit: 79
    }
  }

  var editor = new EpicEditor(opts);

  $textarea = $('#page_body').hide();

  // When it loads put the exiting content in there
  editor.on('load', function (file) {
    editor.importFile(null, $textarea.val());
  });

  //Everytime it's updated, update the textarea
  editor.on('update', function (file) {
    $textarea.val(editor.exportFile());
  });

  // Everything is all setup, so load!
  editor.load();
  
}
