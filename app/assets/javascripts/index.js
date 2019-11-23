$(function(){
  $("#new_user.new_user").validate({
    rules: {
      "user[username]": {
        required: true,
      },
      "user[email]": {
        required: true,
        email: true
      },
      "user[password]": {
        required: true,
        rangelength: [6, 128]
      },
      "user[password_confirmation]": {
        required: true,
        equalTo: 'input[name="user[password]"]'
        }
      },
    messages: {
      "user[username]": {
        required: 'ニックネームを入力してください'
      },
      "user[email]": {
        required: 'メールアドレスを入力してください', 
        email: 'フォーマットが不適切です'
      },
      "user[password]": {
        required: 'パスワード を入力してください',
        rangelength: 'パスワードは6文字以上128文字以下で入力してください'
      },
      "user[password_confirmation]": {
        required: 'パスワード (確認) を入力してください',
        equalTo: 'パスワードとパスワード (確認) が一致しません'
      }
      },
    errorPlacement: function(error, element){
      error.insertAfter(element);
    }
  });  
});
