    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="java.util.Optional" %>
    <%@ page import="nsbm.dea.web.dao.UserDAO" %>
    <%@ page import="nsbm.dea.web.models.User" %>
    <html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            @import url("https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap");
            * { font-family: "Poppins", sans-serif !important; }
            li { list-style: none !important; }
            a { text-decoration: none; }

            table {
                border-collapse: collapse;
                border-spacing: 0;
                width: 100%;
            }

            th,
            td {
                text-align: center;
                padding: 8px;
                color: #ffffff;
                font-size: 16px;
            }
            .clearButton:hover {
                box-shadow: 2px 2px 0px #ffffff !important;
                transform: scale(0.99);
            }
            .checkoutButton:hover {
                box-shadow: 4px 4px 0px #ffffff !important;
                transform: scale(0.99);
            }
        </style>
        <title>Title</title>

    </head>
    <body>
    <%@include file="header.html"%>

    <section
            style="width: 100%; background-color: #e7e7e7; padding: 60px 0px 60px 0px"
    >
        <div
                style="
          width: 80%;
          background-color: #203c55;
          box-shadow: 10px 10px 0px #ffffff;
          margin: auto;
          padding: 40px 40px 40px 60px;
        "
        >
            <p
                    style="
            color: #ffffff;
            font-size: 40px;
            width: 100%;
            text-align: left;
            font-weight: 600;
          "
            >
                Shopping Cart
            </p>
            <p
                    style="
            color: #ffffff;
            font-size: 20px;
            width: 100%;
            text-align: left;
            font-weight: normal;
            letter-spacing: 6px;
            margin-top: -15px;
          "
            >
                Checkout your cart
            </p>
            <div style="width: 100%; height: 3px; background-color: #ffffff"></div>
            <div class="cart" style="overflow-x: auto; margin-top: 25px">
                <table id="cart-table">
                    <thead>
                    <tr>
                        <th style="width: 20px !important">Id</th>
                        <th>Product Name</th>
                        <th style="width: 120px !important">Quantity</th>
                        <th style="width: 120px !important">Size</th>
                        <th style="width: 200px !important">Price</th>
                        <th style="width: 200px !important">Ordered Date</th>
                        <th style="width: 50px !important">Action</th>
                    </tr>
                    </thead>
                    <tbody id="cart-container"></tbody>
                </table>
            </div>
            <div
                    style="
            width: 100%;
            height: 3px;
            background-color: #ffffff;
            margin-top: 40px;
          "
            ></div>
            <div
                    style="
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
          "
            >
                <p style="color: #ffffff; font-size: 20px; font-weight: 600">
                    Total price
                </p>
                <p
                        id="totalPrice"
                        style="color: #ffffff; font-size: 20px; font-weight: 600"
                ></p>
            </div>
            <div style="width: 100%; height: 3px; background-color: #ffffff"></div>
            <div
                    style="
            width: 100%;
            display: flex;
            justify-content: end;
            padding-right: 5px;
          "
            >
                <div
                        id="clear-cart"
                        class="clearButton"
                        style="
              padding: 5px 20px 5px 20px;
              background-color: #e7e7e7;
              margin-top: 10px;
              box-shadow: 5px 5px 0px #ffffff;
              transition: 0.4s ease-in-out;
            "
                >
                    <p
                            class="pe-none"
                            style="
                color: #203c55;
                font-size: 20px;
                margin: auto;
                font-weight: 600;
              "
                    >
                        Clear cart
                    </p>
                </div>
            </div>

            <p style="font-size: 35px; color: #ffffff; font-weight: 600">Note :</p>
            <p
                    style="
            font-size: 16px;
            color: #ffffff;
            font-weight: 500;
            margin-top: -10px;
          "
            >
                Payment method : Cash on Delivery ( COD )
            </p>
            <p
                    style="
            font-size: 16px;
            color: #ffffff;
            font-weight: 500;
            margin-top: -16px;
          "
            >
                Order will delivered within 3 to 4 business days across island wide.
            </p>
            <div
                    style="
            width: 100%;
            height: 3px;
            background-color: #ffffff;
            margin-top: 40px;
          "
            ></div>
            <div
                    style="
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 40px;
          "
            >
                <div
                        id="proceed-to-checkout"
                        class="checkoutButton"
                        style="
              padding: 5px 20px 5px 20px;
              width: 60%;
              background-color: #e7e7e7;
              margin-top: 10px;
              box-shadow: 8px 8px 0px #ffffff;
              transition: 0.4s ease-in-out;
            "
                >
                    <p
                            class="pe-none"
                            style="
                color: #203c55;
                font-size: 20px;
                margin: auto;
                text-align: center;
                font-weight: 600;
              "
                    >
                        Proceed to checkout
                    </p>
                </div>
            </div>
        </div>

        <script>
            function redirectToProductDetails() {
                window.location.href = "productDetails.jsp";
            }

            function addToCart(product) {
                let cart = JSON.parse(localStorage.getItem("cart")) || {
                    subTotal: 0,
                    totalQuty: 0,
                    cart: [],
                };
                let existingProductIndex = cart.cart.findIndex(
                    (item) =>
                        item.id === product.id &&
                        item.categoy.id === product.categoy.id &&
                        item.color.id === product.color.id
                );
                if (existingProductIndex >= 0) {
                    cart.cart[existingProductIndex].quantity += product.quantity;
                    cart.cart[existingProductIndex].subTotal =
                        cart.cart[existingProductIndex].price *
                        cart.cart[existingProductIndex].quantity;
                } else {
                    product.subTotal = product.price * product.quantity;
                    cart.cart.push(product);
                    cart.totalQuty += 1;
                }
                cart.subTotal = cart.cart.reduce(
                    (total, item) => total + item.subTotal,
                    0
                );
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartDisplay(cart);
            }
            function updateCartDisplay(cart) {
                const cartContainer = document.getElementById("cart-container");
                cartContainer.innerHTML = "";
                let totalPrice = 0;

                if (cart.cart.length > 0) {
                    cart.cart.forEach((item) => {
                        totalPrice += item.price * item.quantity;

                        let row = document.createElement("tr");
                        row.innerHTML = `
                            <td>1</td>
                            <td>${item.title}</td>
                            <td>${item.quantity}</td>
                            <td>${item.categoy.title}</td>
                            <td>$${item.price}</td>
                            <td>2024/04/01</td>
                            <td>
                              <center>
                                  <div onclick="removeFromCart(${item.id})"><img src="assets/delete.svg" alt="" /></div>
                              </center>
                            </td>`;
                        cartContainer.appendChild(row);
                    });
                    document.getElementById(
                        "totalPrice"
                    ).textContent = `Total: $${totalPrice.toFixed(2)}`;
                } else {
                    let row = document.createElement("tr");
                    row.innerHTML = `<td colspan="7">Your cart is empty.</td>`;
                    cartContainer.appendChild(row);
                }

                document.getElementById(
                    "totalPrice"
                ).textContent = `Total Price: $${totalPrice.toFixed(2)}`;
            }
            function removeFromCart(productId) {
                let cart = JSON.parse(localStorage.getItem("cart")) || { cart: [] };
                cart.cart = cart.cart.filter((item) => item.id !== productId);
                localStorage.setItem("cart", JSON.stringify(cart));
                updateCartDisplay(JSON.parse(localStorage.getItem("cart")));
            }

            function clearCart() {
                localStorage.removeItem("cart");
                updateCartDisplay({ subTotal: 0, totalQuty: 0, cart: [] });
            }

            document.addEventListener("DOMContentLoaded", () => {
                fetch("product.json")
                    .then((response) => {
                        if (!response.ok) {
                            throw new Error("Failed to fetch cart data");
                        }
                        return response.json();
                    })
                    .then((product) => {
                        addToCart(product);
                        updateCartDisplay(JSON.parse(localStorage.getItem("cart")));
                    })
                    .catch((error) => {
                        console.error("Error loading cart:", error);
                        alert("Failed to load cart data");
                    });
            });

            document
                .getElementById("clear-cart")
                .addEventListener("click", clearCart);

            document
                .getElementById("proceed-to-checkout")
                .addEventListener("click", function () {
                    const cart = JSON.parse(localStorage.getItem("cart")) || {
                        cart: [],
                    };
                    const cartItems = cart.cart
                        .map((item) => `item=${encodeURIComponent(JSON.stringify(item))}`)
                        .join("&");

                    window.location.href = `checkout.jsp?${cartItems}`;
                });
        </script>
    </section>

    <%@include file="footer.html"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
    </html>