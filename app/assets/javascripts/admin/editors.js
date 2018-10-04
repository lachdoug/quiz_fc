document.addEventListener('turbolinks:load', function() {

  var codemirrorEditors = {};
  var simpleMdeEditors = {};

  document.querySelectorAll(".yaml-editor").forEach( function ( wrapper, i ) {
    codemirrorEditors[i] = CodeMirror.fromTextArea( wrapper.querySelector("textarea"), { lineNumbers: true } );
  } );

  document.querySelectorAll(".markdown-editor").forEach( function ( wrapper, i ) {
    simpleMdeEditors[i] = new SimpleMDE( {
      element: wrapper.querySelector("textarea"),
      toolbar: simpleMdeToolbarIcons,
      autoDownloadFontAwesome: false,
      status: false,
    } );
  } );

} );

var simpleMdeToolbarIcons = [
  {
    name: "bold",
    action: SimpleMDE.toggleBold,
    className: "fa fa-bold",
    title: "Bold",
  },
  {
    name: "italic",
    action: SimpleMDE.toggleItalic,
    className: "fa fa-italic",
    title: "Italic",
  },
  {
    name: "heading",
    action: SimpleMDE.toggleHeadingSmaller,
    className: "fa fa-heading",
    title: "Heading",
  },
  "|",
  {
    name: "quote",
    action: SimpleMDE.toggleBlockquote,
    className: "fa fa-quote-left",
    title: "Quote",
  },
  {
    name: "unordered-list",
    action: SimpleMDE.toggleUnorderedList,
    className: "fa fa-list-ul",
    title: "Generic List",
  },
  {
    name: "ordered-list",
    action: SimpleMDE.toggleOrderedList,
    className: "fa fa-list-ol",
    title: "Numbered List",
  },
  "|",
  {
    name: "link",
    action: SimpleMDE.drawLink,
    className: "fa fa-link",
    title: "Create Link",
  },
  {
    name: "image",
    action: SimpleMDE.drawImage,
    className: "fa fa-image",
    title: "Insert Image",
  },
  {
    name: "table",
    action: SimpleMDE.drawTable,
    className: "fa fa-table",
    title: "Insert Table"
  },
  "|",
  {
    name: "preview",
    action: SimpleMDE.togglePreview,
    className: "fa fa-eye no-disable",
    title: "Toggle Preview",
  },
  {
    name: "side-by-side",
    action: SimpleMDE.toggleSideBySide,
    className: "fa fa-columns no-disable",
    title: "Toggle Side by Side",
  },
  {
    name: "fullscreen",
    action: SimpleMDE.toggleFullScreen,
    className: "fa fa-arrows-alt no-disable",
    title: "Toggle Fullscreen",
  }
];
