$(function() {
  function buildHTML(comment){
    var html = '<div class="comment">' +
                  '<p class="comment__name">' +
                    comment.user_name +
                  '</p>' +
                  '<p class="comment__date">' +
                    comment.date +
                  '</p>' +
                  '<p class="comment__text">' +
                    comment.text +
                  '</p>' +
                '</div>';
    return html;
  }

  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    var button = $('.btn')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
      beforeSend: function(xhr, setting){
        button.attr('disabled', true);
      },
      complete: function(xhr, setting){
        button.attr('disabled', false);
      }
    })
    .done(function(comment){
      console.log('通信成功');
      var html = buildHTML(comment);
      console.log(html);
      $('.comment_heigth_block').append(html)
    })
    .fail(function(){
      alert('error');
    })
    return false;
  })
})
