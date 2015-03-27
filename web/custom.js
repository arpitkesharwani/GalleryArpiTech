
function logout()
{
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.open("GET", "logout", true);
    xmlhttp.send();
    window.location.reload();
}



