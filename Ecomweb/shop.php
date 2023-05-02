<?php
session_start();
if (isset($_SESSION['success'])) {
    echo "<script>alert('" . $_SESSION['success'] . "');</script>";
    unset($_SESSION['success']);
}
$title = "Products";
// if user has come here with no categories selected or search query, then all products will be shown other wise category based products will be shown or search query based.
if (isset($_GET['cat'])) {
    $title = $_GET['cat'] . " - Products";
}
include "./includes/header.php";
?>
<div class="container-prod">
    <div class="header">
        <h1>Products</h1>
    </div>
    <div class="products">
       
            <div class="image">
                <img src="images/image3.jpg" alt="">
            </div>
            <div class="namePrice">
                <h1>Smart Watch</h1>
                <span>$ 15.99</span>
            </div>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
            <div class="Add">
                <button class="prod4" onclick="checkCart(4)">Add to cart</button>
            </div>
        </div>
    </div>
</div>



<?php include "./includes/footer.php"; ?>