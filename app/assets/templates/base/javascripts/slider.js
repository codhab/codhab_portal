$(document).ready(function() {
    $('.bxslide').bxSlider({
      slideWidth: 390,
      minSlides: 1,
      maxSlides: 3,
      slideMargin: 0
    });
    $('.bxslide2').bxSlider({
      slideMargin: 0,
      controls: false
    });
    $('.bxslide3').bxSlider({
      slideMargin: 0,
      controls: false
    });
    $('.bxslide4').bxSlider({
      slideMargin: 0,
      controls: false,
      pagerCustom: '#slider_meses'
    });
    $('.bxslide_action').bxSlider({
      slideMargin: 0,
      controls: false
    });
    // Inicio do count do habita brasilia
    $('.count').each(function () {
      $(this).prop('Counter',0).animate({
          Counter: $(this).text()
      }, {
          duration: 2000,
          easing: 'swing',
          step: function (now) {
              $(this).text(Math.ceil(now));
          }
      });
    });

    $('.menu_acesso_info').click(function(){
      $('.info_content').hide();
      botao = $(this).attr('acesso');
      $('.'+botao).show();
    })

    /*funções da página acesso a informação*/

    $('.aumentar-fonte').click(function(){
      fonte = parseInt($('.box p').css('font-size'));
      fonte = fonte +1;
      $('.box p').css('font-size',fonte +'px');
    })
    $('.diminuir-fonte').click(function(){
      fonte = parseInt($('.box p').css('font-size'));
      fonte = fonte -1;
      $('.box p').css('font-size',fonte +'px');
    })
    $('.imprimir-tela').click(function(){
        window.print();
    })
});
