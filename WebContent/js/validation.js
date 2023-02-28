function join(){
   
   const password = document.getElementById("password").value;
   console.log(password);
   const repassword = document.getElementById("repassword").value;
   console.log(repassword);
   if (password.value != repassword.value) {
      alert("비밀번호가 일치하지 않습니다.");
      location.href("./join.jsp");
      return;
//      repwd.focus();
   }
   
   var pwdCheck = /^[a-zA-Z0-9]{4,20}$/;
   if(pwdCheck.test(pwd.value)){
      alert("비밀번호는 영문자 + 숫자 조합으로 8~20자리를 사용해야 합니다.");
      pwd.focus();
      return false;
   }
//   숫자 없을때도 넘어감,

   var tel = /[^0-9]/g; //숫자만 입력하는 정규식
   if (tel.test(tel.value)) {
      alert("전화번호는 숫자만 입력할 수 있습니다.");
      tel.focus();
      return false;
   }
   
   
}