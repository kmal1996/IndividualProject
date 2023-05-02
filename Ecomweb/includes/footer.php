<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"
    integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"></script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.9.2/umd/popper.min.js"></script>
<script type="text/javascript">
    let tags;
    let msg;
    let voices;
    let screenReader = false;
    
    $(document).ready(function () {
        let cart = JSON.parse(localStorage.getItem('cart'));
        cart == null ? (cart = {
            "total": 0,
            "items": []
        }, localStorage.setItem('cart', JSON.stringify(cart))) : cart = JSON.parse(localStorage.getItem('cart'));

        cart.items.length > 0 ? $(".badge").html(cart.items.length) : $(".badge").addClass("d-none")
        $("#btnADefault").on("click", function () {
            // $("h1, p, span, h2, h3, h4, h5, h6").css("transform", "scale(1.2)");
            $(".product").css("border","1px solid black");
            $("body").css("font-size", "62.5%");
            $("body").css("color", "");
            $("body").css("background", "");
            $("h1, h2, h3, h4, h5, h6").css("color", "black");
        });
        $("#btnA1").on("click", function () {
            // $("h1, p, span, h2, h3, h4, h5, h6").css("transform", "scale(1.2)");
            $(".product").css("border","1px solid black");
            $("body").css("font-size", "75%");
            $("body").css("color", "");
            $("body").css("background", "");
            $("h1, h2, h3, h4, h5, h6").css("color", "black");
        });
        $("#btnA2").on("click", function () {
            // $("h1, p, span, h2, h3, h4, h5, h6").css("transform", "scale(1.2)");
            $("body").css("background", "black");
            $("body").css("font-size", "62.5%");
            $("body").css("color", "white");
            $("h1, h2, h3, h4, h5, h6").css("color", "yellow");
            $(".product").css("border","1px solid white");
        });
        $("#btnA3").on("click", function () {
            // $("h1, p, span, h2, h3, h4, h5, h6").css("transform", "scale(1.2)");
            $("body").css("background", "black");
            $("body").css("font-size", "75%");
            $("body").css("color", "white");
            $("h1, h2, h3, h4, h5, h6").css("color", "yellow");
            $(".product").css("border","1px solid white");
        });
        $("label, button, span, a, p, h1, h2, h3, h4, h5, h6").attr("sp", 0);
        msg = new SpeechSynthesisUtterance();
        voices = speechSynthesis.getVoices();
        msg.voice = voices[0];
        // tags = $("h1, h2, h3, h4, h5, h6, span, label, button, a, p");
        // tags.each(function () {
        //     $(this).on("click", function (e) {
        //         msg.text = $(this).text();
        //         $(this).css("background-color", "yellow");
        //         speechSynthesis.speak(msg);

        //         let interval = setInterval(() => {
        //             if (!speechSynthesis.speaking) {
        //                 $(this).css("background-color","");
        //                 // tag.style.removeProperty("background-color");
        //                 clearInterval(interval);
        //             }
        //         }, 100)
        //     })
        // });
        // updateList();

        $(".btnReader").on("click", function () {
            if (screenReader == false) {
                screenReader = true;
                $(this).html("Turn Off Screen Reader");
                // console.log(tags.length)
                updateList();

            }
            else {
                screenReader = false;
                $(this).html("Turn On Screen Reader");
            }
        })    


    

    });

    function updateList(call) {
        tags = [];
        tags = document.querySelectorAll("label, button, span, a, p, h1, h2, h3, h4, h5, h6");
        tags.forEach((tag) => {
            let val = tag.getAttribute("sp");
            console.log(val);
            if (val == 0 || val == null) {
                tag.setAttribute("sp", 1);
                tag.addEventListener("click", function (e) {
                    speakText(e, tag);
                });
            }

        })
    }

    function speakText(e, tag) {
        if (screenReader == true) {
            msg.text = e.target.innerText;
            if (e.target.innerText != "Turn Off Screen Reader" && e.target.innerText != "Turn On Screen Reader") {
                tag.style.backgroundColor = "yellow";
                speechSynthesis.speak(msg);

                let interval = setInterval(() => {
                    if (!speechSynthesis.speaking) {
                        tag.style.removeProperty("background-color");
                        clearInterval(interval);
                    }
                }, 100)
            }
        }
    }
    window.updateList = updateList;
    window.tags = tags;

</script>
<?php if (strpos($title, "Products") !== false) {
    // This will check if products page is opened then following scripts will be executed otherwise will not be included in the page.
    echo '<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/js/all.min.js" integrity="sha512-2bMhOkE/ACz21dJT8zBOMgMecNxx0d37NND803ExktKiKdSzdwn+L7i9fdccw/3V06gM/DBWKbYmQvKMdAA9Nw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>';
    echo '<script src="logic.js"></script>';
} ?>
<?php if (strpos($title, "Cart") !== false) {
    // This will include following scripts in cart page only.
    echo '<script src="./cart.js"></script>
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>';
    
} ?>
</body>

</html>

<script>
    
$(".btnAccessibility").on('click',function(){
    $(".accessibilityBox").slideToggle();
})
</script>