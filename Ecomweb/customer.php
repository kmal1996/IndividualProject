<?php
session_start();
$referer ="";

if (!isset($_SESSION['url'])) {
    $referer = $_SERVER['HTTP_REFERER'];
    $_SESSION['url'] = $referer;
}
else
{
    $referer = $_SESSION['url'];
}
if(isset($_GET['to']))
{
    $referer = "./cart.php";
}
?>
<html>

<head>
    <title>Customer Login</title>
    <link rel="stylesheet" href="mainpagestyle.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.default.min.css"
        integrity="sha512-wUS5ozkpB4c5aUrsfvYhDl6hc2oOC2AZbsKzym3DmOhBvCHs626N/NMxOdarpDKeJ1eq9cwZwNKTc3ELRnJbfQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.core.min.css"
        integrity="sha512-JQUnm7fl0rXYdnCc1hDC9d1lAWnJezXv3unSwUIGWKyD5xl+zj8ekMI/Z2fQKemXmM670/QVe8mNcGOZvuOPjQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body onload='document.form1.text1.focus()'>
    <div class="bgimg1">
        <form class="form_container" method="post" name="form1" action="data_operation.php" id="form1">
            <h1>Customer Login</h1>
            <input type="text" placeholder="Enter username or email" id="ID" name="ID" required >
            <br>
            <input type="hidden" name="action" value="login">
            <input type="hidden" name="url" value="<?php echo $referer;?>">
            <input type="password" placeholder="Enter Password" id="pass" required name="pass"
                pattern="^[a-zA-Z0-9-]+$">
            <br><br>
            <h5><?php if (isset($_SESSION['error'])) {
            echo $_SESSION['error'];
            unset($_SESSION['error']);
            }?></h5>
            <button type="submit" class="btn2">Submit</button>
        </form>
    </div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
    integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/alertify.js/0.3.11/alertify.min.js"
    integrity="sha512-2R8JJ9GapQ1VCvcazWIP4F7rOrMs6mzorqtZlXpvakAU0O/iw4n90CFrmG9+BwI//xxtnHxb5rbpkIF2s6z39w=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
    document.getElementById("form1").addEventListener("submit", function (e) {
        // e.preventDefault();
        // let id = document.getElementById("ID").value;
        // let pass = document.getElementById("pass").value;
        // var numbers = /^[a-zA-Z0-9-]+$/;
        // id == "" ? alertify.error("Please Enter ID") : pass == "" ? alertify.error("Please Enter Pass") : pass.match(numbers) ?
        //     ($.ajax({
        //         url: 'data_operation.php',
        //         type: 'post',
        //         data: { "ID": id, "pass": pass, "action": "login" },
        //         success: function (data) {
        //             console.log(data);
        //             if (data == "0") {
        //                 alertify.error("Incorrect Credentials");
        //             }
        //             else {
        //                 alertify.success("Successfully Logged In");
        //             }
        //         }
        //     }),
        //         document.form1.text1.focus())
        //     :
        //     (alertify.error('Please input numeric and alphabhest only')
        //         , document.form1.text1.focus())



    });
    function allnumeric(inputtxt, inputtxt2) {

    }
</script>

</html>