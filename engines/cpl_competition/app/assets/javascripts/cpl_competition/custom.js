ready = function () {
  js_update();
}

$(document).on('turbolinks:request-start', function () {
  Turbolinks.clearCache();
})


$(document).on('turbolinks:load', ready);
$(document).ready(ready);


function js_update() {
  initTinyMCE();

  $(".datetime").mask("00/00/0000 00:00", { placeholder: "__/__/____ 00:00" });
  $('.date').mask("00/00/0000", { placeholder: "__/__/____" });
  $('.hour').mask("00:00", { placeholder: "00:00" });
  $('.cpf').mask("###.###.###-##", { placeholder: "000.000.000-00" });
  $('.cnpj').mask("##.###.###/####-##", { placeholder: "00.00.000/0000-00" });
  $('.coin').mask("######0.00", { reverse: true });
}

function initTinyMCE() {
  //tinymce.remove();
  tinymce.init({
    selector: 'textarea.tinymce',
    language: 'pt_BR',
    indentation: '20pt',
    indent_use_margin: true,
    fontsize_formats: '8pt 10pt 12pt 14pt 18pt 24pt 36pt',
    toolbar: [
      "styleselect | bold italic | alignleft aligncenter alignright alignjustify",
      "bullist numlist outdent indent | link image | code | codesample | fontsizeselect"
    ],
    plugins: "image,link,code,codesample,imagetools,media,table,insertdatetime,charmap,print,preview,anchor,searchreplace,visualblocks,fullscreen",

    setup: function (editor) {
      editor.on('change', function () {
        editor.save();
      });
    }
  });

}