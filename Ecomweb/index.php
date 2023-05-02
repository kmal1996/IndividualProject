<?php
session_start();
if (isset($_SESSION['success'])) {
    echo "<script>alert('" . $_SESSION['success'] . "');</script>";
    unset($_SESSION['success']);
}
$title = "Index";
// to keep header and footer same in every page and reduce number of lines of code, header and footer is sliced into separate files, and included in every file.
include "./includes/header.php";

?>



<!-- Banner Start -->

<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active" data-bs-interval="10000">
            <img src="./1.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" data-bs-interval="2000">
            <img src="./3.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./4.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./img4.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./img5.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./img6.jpg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item">
            <img src="./img7.jpg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-12">
            <h2>Ecommerce Business </h2>
            <p>
                Welcome to our E-Commerce Business 

                Looking for stylish and functional Furniture, Kitchen Accessories, Auto Parts, Laptops, Watches, and Glasses?
                look no further! our online store offers a wide range of products to meet your needs and exceed your expectations
                we have everything you need to make your office look and feel great, need a new laptop or a stylish watch to keep
                your busy schedule? We've got you covered. We take pride in providing high-quality products at competitive prices,
                along with exceptional customer service.
                
                
            </p>
        </div>
    </div>
</div>



<?php include "./includes/footer.php" ?>