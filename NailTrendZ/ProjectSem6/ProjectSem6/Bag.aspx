<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bag.aspx.cs" Inherits="ProjectSem6.Bag" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Bag</title>
    <style>
       /* Ensures the page scrolls if more items are added */
body {
    font-family: 'Poppins', sans-serif;
    background-color: #f8f8f8;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: flex-start; /* Adjusted to allow scrolling */
    min-height: 100vh;
    overflow-x: hidden; /* Prevents horizontal scrolling */
}

/* Keeps the container responsive */
.container {
    margin-top: 5px;
    width: 100%;
    max-width: 900px;
    background: #fff;
    padding: 20px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 10px;
    text-align: center;
    overflow: hidden;
}

/* Ensures cart items do not overflow */
.cart-container {
    max-height: 400px; /* Allows scrolling when many items are added */
    overflow-y: auto; /* Adds vertical scroll if needed */
    margin-top: 20px;
    padding-right: 5px; /* Avoids content clipping */
}

/* Keeps table responsive */
table {
    width: 100%;
    border-collapse: collapse;
    background: white;
}

th, td {
    text-align: left;
    padding: 12px;
    border-bottom: 1px solid #ddd;
    white-space: nowrap; /* Prevents text wrapping */
}

/* Ensures images and content scale properly */
.cart-item {
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid #ddd;
    padding: 15px 0;
    flex-wrap: wrap; /* Allows items to adjust on smaller screens */
}

.cart-item img {
    width: 80px;
    height: 80px;
    object-fit: cover;
    border-radius: 8px;
    margin-right: 15px;
}

/* Adjusts cart layout on smaller screens */
@media (max-width: 768px) {
    .cart-item {
        flex-direction: column;
        align-items: center;
        text-align: center;
    }

    .cart-item img {
        margin-bottom: 10px;
    }

    .cart-container {
        max-height: 300px;
    }

    .button-container {
        flex-direction: column;
    }

    .btn {
        width: 100%;
        margin-bottom: 10px;
    }

    th, td {
        font-size: 14px; /* Adjust font size for better readability */
    }
}
/* Buttons */
.button-container {
    display: flex;
    justify-content: center; /* Centering the buttons */
    gap: 20px; /* Space between buttons */
    margin-top: 30px;
}

.btn {
    padding: 14px 24px; /* Increased padding */
    font-size: 18px; /* Larger font for better readability */
    font-weight: 600;
    border: none;
    border-radius: 8px; /* Softer rounded corners */
    cursor: pointer;
    transition: background 0.3s ease-in-out, transform 0.2s;
    text-decoration: none;
    display: inline-block;
}

/* Back Button */
.btn-back {
    background: #444;
    color: white;
}

.btn-back:hover {
    background: #333;
    transform: scale(1.05);
}

/* Proceed Button */
.btn-proceed {
    background: #e91e63;
    color: white;
}

.btn-proceed:hover {
    background: #c2185b;
    transform: scale(1.05);
}

/* Styling for the Remove Button */
.remove-btn {
    background-color: #e91e63; /* Attractive pink-red color */
    color: white; /* White text for contrast */
    border: none;
    padding: 10px 15px;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    outline: none;
}

/* Hover Effect */
.remove-btn:hover {
    background-color: #c2185b; /* Darker shade for hover */
    transform: scale(1.05); /* Slightly enlarges */
}

/* Active (Click) Effect */
.remove-btn:active {
    background-color: #ad1457; /* Even darker when clicked */
    transform: scale(0.95); /* Slightly shrinks */
}

/* Responsive: Ensures button scales well on small screens */
@media (max-width: 768px) {
    .remove-btn {
        width: 100%; /* Full width on small screens */
        padding: 12px;
        font-size: 16px;
    }
}
 </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>👜 Your Bag</h1>
            <asp:Label ID="lblMessage" runat="server" CssClass="empty-message"></asp:Label>
            
            <asp:Repeater ID="RepeaterCart" runat="server">
                <ItemTemplate>
                    <div class="cart-item">
                        <img src='<%# Eval("ImageURL") %>' class="cart-image" />
                        <h3>&#8377;<%# Eval("Price") %></h3>
                        <asp:Button ID="btnRemove" runat="server" Text="Remove" CssClass="remove-btn" OnClick="btnRemove_Click" CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            
            <div class="button-container">
                <a href="moreproducts.aspx" class="btn btn-back">Back to Gallery</a>
                <asp:Button ID="btnProceed" runat="server" Text="Proceed to Further" CssClass="btn btn-proceed" OnClick="btnProceed_Click" />
            </div>
        </div>
    </form>
</body>
</html>
