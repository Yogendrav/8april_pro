$(document).ready(function(){
    $('#uname_i').val('');
    $('#uname_i').on('blur',function(){
        var uname = $('#uname_i').val();
        uname = uname.toLowerCase();
        var flag = false;
        if(uname != ''){
            $.ajax({
                url:'register/register/check_username',
                type:'post',
                data:{"user_name": uname},
                success:function(data){
                    if(data != '')
                    {
                        data = $.parseJSON(data);
                        var size = data.length;
                        for(i = 0; i < size ; i++)
                        {
                            if(uname != data[i]['user_name'].toLowerCase())
                            {
                                console.log(uname+" != "+data[i]['user_name'].toLowerCase());
                                $('#username_info').addClass('hide').removeClass('in');
                            }
                            else{
                                console.log(uname+" == "+data[i]['user_name']);
                                $('#username_info').addClass('in').removeClass('hide');
                                $('#uname_i').focus();
                                return false;
                                break;
                            }
                        }
                    }
                }
            });
        }
    });
});
function register()
{
    if($("#registration_form").validate()){
        if($('#username_info').hasClass('in'))
            return false;
        else
            return true;
    }
    else{
        return false;
    }
}
function back()
{
    window.location.href = 'login';
}