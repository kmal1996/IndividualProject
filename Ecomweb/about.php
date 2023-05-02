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

  <div class="container">
    <div class="row mt-4 pt-4 mb-0">
        <div class="col-md-12">
            <h2>Ecommerce Business  </h2>
            <p>
            Welcome to our E-Commerce Business 

            Looking for stylish and functional Furniture, Kitchen Accessories, Auto Parts, Laptops, Watches, and Glasses?
            look no further! our online store offers a wide range of products to meet your needs and exceed your expectations
            we have everything you need to make your office look and feel great, need a new laptop or a stylish watch to keep
            your busy schedule? We've got you covered. We take pride in providing high-quality products at competitive prices,
            along with exceptional customer service.

            so why wait? browse our selection today and discover the perfect pieces to enhance your spance and your life
            </p>
            <h3>About</h3>
            <p>
            About our E-Commerce Business 

            At our e-commerce business, we believe in offering our customers the best products they need and services 
            at the most competitive prices. That's why we've carefully selected the best software to help us manage returns
            and ensure that every customer is satisfied with their purchase.  
            </p>
        
      
    </div>
  </div>











<?php include "./includes/footer.php" ?>