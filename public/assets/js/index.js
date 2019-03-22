/* Hover animations Navbar */
lis=document.querySelectorAll("nav li");
for(var i=0;i<lis.length-3;i++){
lis[i].addEventListener("mouseover",function(){
    this.style.backgroundColor="steelblue";
});
lis[i].addEventListener("mouseout",function(){
    this.style.backgroundColor="#28328c";
    this.style.color="#555";
});
}
/* Hover animations Navbar end*/

/*Login/Signup window animations*/
$(function () {
    $('#register-form-link').click(function(e) {
        $("#register-form").delay(100).fadeIn(100);
        $("#login-form").fadeOut(100);
        $('#login-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });
    $('#login-form-link').click(function(e) {
        $("#login-form").delay(100).fadeIn(100);
        $("#register-form").fadeOut(100);
        $('#register-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });
});
$("#window1").click(function(){
    $('#modal-wrapper').css('display','block');
    $('#register-form').css('display','block');
    $('#login-form').css('display','none');
    $("#login-form-link").removeClass("active");
    $("#register-form-link").addClass("active");
});
$("#window2").click(function(){
    $('#modal-wrapper').css('display','block');
    $('#register-form').css('display','none');
    $('#login-form').css('display','block');
    $("#login-form-link").addClass("active");
    $("#register-form-link").removeClass("active");
});
$("#closebtn").click(function(){
    $('#modal-wrapper').fadeOut(600,function(){
        $('this').css('display','none');
    })
})
/*Login/Signup window animations end*/

/* Validations start*/
function lvalidate()
{
    var un = document.getElementById("lusername").value;
    var pw = document.getElementById("lpassword").value;
    var sun = "user"; 
    var spw = "12345";
    if ((un == sun) && (pw == spw)) {
        alert("Login Success!");           
        return true;}
    else {
        alert ("Login failed.Please check your username and password!");
        return false;}
}
function checkPassword(str)
{
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;
    return re.test(str);
}
function checkForm(form)
{
    re = /^\w+$/;
    if(!re.test(form.username.value)) {
        alert("Error: Username must contain only letters, numbers and underscores!");
        form.username.focus();
        return false;
    }
    re=/^[\w]+@[\w]+(.)com$/;
    if(!re.test(form.email.value)) {
        alert("Error: Email must contain only numbers,('@','.')-symbols,letters!");
        form.email.focus();
        return false;
    }
    re=/^[1-9]{1}[0-9]{9}$/;
    if(!re.test(form.mobile.value)) {
        alert("Error: Phone number must contain only numbers!");
        form.mobile.focus();
        return false;
    }
    if(!checkPassword(form.password.value)) {
        alert("The password you have entered is not valid!");
        form.password.focus();
        return false;
    }
    if(form.password.value != form.confirmpassword.value) {
        alert("Error: Please check that you've entered and confirmed your password!");
        form.confirmpassword.focus();
        return false;
    }
return true;
}
/*Validations end */

