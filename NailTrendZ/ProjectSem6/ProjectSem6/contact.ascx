<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="contact.ascx.cs" Inherits="ProjectSem6.contact1" %>
<!-- contact section start -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
    /* Styling for Social Media Icons */
.social_icons {
    margin-top: 15px;
    text-align: center;
}

.social_icons a {
    display: inline-block;
    margin: 0 10px;
    font-size: 26px;
    color: black; /* Default color */
}

.social_icons a:hover {
    color: white; /* Change color on hover */
}

</style>
<div class="contact_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3 class="contact_taital">Book Now for Beautiful, Trendy Nails!</h3>
                <p class="contact_text">
                    Turn your nail goals into reality with our stunning designs and expert care. 
                    Whether you’re looking for a chic minimalist look, elegant French tips, or bold, artistic nail art, 
                    we have something for everyone. Our experienced nail technicians use high-quality products to 
                    ensure long-lasting beauty and care for your nails. Book now and let Nail TrendZ transform your nails 
                    into a work of art! Your perfect nails are just an appointment away.
                </p>
            </div>
            <div class="col-md-6">
                <div class="appointment_button">
                    <a href="Appointments.aspx" class="submit_button">Book Appointment</a>
                </div>
                <!-- Social Media Icons -->
                <div class="social_icons">
                    <a href="https://www.whatsapp.com/" target="_blank"><i class="fab fa-whatsapp"></i></a>
                    <a href="https://www.facebook.com/messenger" target="_blank"><i class="fab fa-facebook-messenger"></i></a>
                    <a href="mailto:info@nailtrendz.com" target="_blank"><i class="fas fa-envelope"></i></a>
                    <a href="tel:+011234567890" target="_blank"><i class="fas fa-phone-alt"></i></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- contact section end -->