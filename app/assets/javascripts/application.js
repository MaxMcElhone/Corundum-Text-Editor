// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require codemirror
//= require codemirror/modes/xml
//= require codemirror/modes/htmlmixed
//= require codemirror/modes/javascript
//= require codemirror/modes/ruby
//= require codemirror/modes/haml
//
function Upload() {
  var file = $("#file").prop("files")[0];
  fr = new FileReader(); // FileReader instance
				      // Do stuff on onload, use fr.result for contents of file
              //fr.readAsDataURL( file );
              fr.readAsText( file );
				      $( '#document_body' ).val(  fr.result  )


};
//method steven wrote to handle uploaded files slightly edited
function openFile(event) {
  var input = event.target;

  var r = new FileReader();
  r.onload = function(){
    var text = r.result;
    var out = document.getElementById('document_body');
    out.value = text;
    console.log(reader.result.substring(0,200));

  };
  r.readAsText(input.files[0]);

};
$( document ).on('turbolinks:load', function() {
  $("textarea").each(function() {
      CodeMirror.fromTextArea($(this).get(0), {
        lineNumbers: true,
        mode: "htmlmixed"
      });
    });
//allow tabbing in textarea
  // $("textarea").keydown(function(e) {
  //     if(e.keyCode === 9) { // tab was pressed
  //         // get caret position/selection
  //         var start = this.selectionStart;
  //         var end = this.selectionEnd;
  //
  //         var $this = $(this);
  //         var value = $this.val();
  //
  //         // set textarea value to: text before caret + tab + text after caret
  //         $this.val(value.substring(0, start)
  //                     + "\t"
  //                     + value.substring(end));
  //
  //         // put caret at right position again (add one for the tab)
  //         this.selectionStart = this.selectionEnd = start + 1;
  //
  //         // prevent the focus lose
  //         e.preventDefault();
  //     }
  // });
});
