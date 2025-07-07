<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="About-Us.ascx.cs" Inherits="ProjectSem6.About_Us1" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Nail TrendZ</title>
    <style>
 /* General Styles */
body {
    font-family: 'Montserrat', sans-serif;
    margin: 0;
    padding: 0;
    background: #fbe9ef; /* Light pink background */
    color: black;
}

/* Container */
.container {
    width: 90%;
    max-width: 1200px;
    margin: auto;
    text-align: center;
}

 /* Section Title with Logo */
        .section-title {
            display: flex;
            font-weight: bold;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }

        .section-title img {
            max-width: 300px; /* Adjust the logo size */
            height: 80px;
        }

/* About Us Section */
.about-section {
    padding-top: 200px;
    padding-bottom: 50px;
    background: #fbe9ef;
    border-radius: 20px;
    box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease-in-out;
}

.about-text {
    font-size: 18px;
    line-height: 1.8;
    max-width: 850px;
    margin: 0 auto;
    color: #444;
}

/* Expertise Section */
.expertise-section {
    padding: 80px 0;
    background: #f6d3e0; /* Softer Pink */
}

.expertise-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 25px;
    justify-content: center;
}

.expertise-box {
    background: #fff;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 7px 20px rgba(0, 0, 0, 0.08);
    text-align: center;
    position: relative;
    transition: all 0.3s ease-in-out;
    border-left: 5px solid #e57ea4; /* Left border accent */
}

.expertise-box h3 {
    color: #e57ea4;
    font-size: 22px;
    margin-bottom: 12px;
    font-weight: bold;
}

/* Certifications Section */
.certification-section {
    padding: 80px 0;
    background: #fbe9ef;
}

.certification-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 30px;
    justify-content: center;
}

.certification-box {
    background: #fbe9ef;
    padding: 20px;
    border-radius: 12px;
    box-shadow: 0px 8px 20px rgba(0, 0, 0, 0.1);
    max-width: 320px;
    text-align: center;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease-in-out;
    border-top: 5px solid #e57ea4; /* Top border accent */
}

.certification-box img {
    margin-top: 10px;
    width: 100%;
    max-width: 250px;
    border-radius: 10px;
    margin-bottom: 30px;
    transition: transform 0.3s ease-in-out;
}

.certification-box:hover img {
    transform: scale(1.25);
}

.certification-box h3 {
    color: #e57ea4;
    font-size: 20px;
    margin-bottom: 8px;
    font-weight: bold;
}

.certification-box p {
    font-size: 16px;
    color: #555;
}

/* Hover Effects */
.expertise-box:hover {
    border-left: 5px solid black;
}

.certification-box:hover {
    border-top: 5px solid black;
}
</style>

</head>
<body>

    <!-- About Us Section -->
    <section class="about-section">
        <div class="container">
            <div class="section-title">
                <img src="images/logo.jpg" alt="Nail TrendZ Logo">
            </div>
            <p class="about-text">
                Welcome to <strong>Nail TrendZ</strong>, your destination for the most innovative and stylish nail services.  
                We specialize in **customized nail enhancements, nail health treatments, and trendsetting designs**  
                that bring beauty and confidence to your fingertips. Our skilled artists are dedicated to precision  
                and creativity, ensuring each client receives a **unique and luxurious experience**.
            </p>
        </div>
    </section>

    <!-- Expertise Section -->
    <section class="expertise-section">
        <div class="container">
            <h1 class="section-title">Our Expertise</h1>
            <div class="expertise-grid">
                <div class="expertise-box">
                    <h3>Acrylic & Gel Extensions</h3>
                    <p>We create elegant and durable nail extensions tailored to your style preferences.</p>
                </div>
                <div class="expertise-box">
                    <h3>Custom Nail Art</h3>
                    <p>From classic to modern designs, we bring your vision to life with detailed artistry.</p>
                </div>
                <div class="expertise-box">
                    <h3>Nail Strengthening Treatments</h3>
                    <p>Protect and rejuvenate your natural nails with our professional strengthening solutions.</p>
                </div>
                <div class="expertise-box">
                    <h3>Cuticle & Nail Care</h3>
                    <p>Maintain healthy, nourished nails with our advanced care treatments.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Certifications Section -->
    <section class="certification-section">
        <div class="container">
            <h1 class="section-title">Our Certifications</h1>
            <div class="certification-grid">
                <div class="certification-box">
                    <img src="images/Certificate1.png" alt="Certified Nail Technician">
                    <h3>Certified Nail Technician</h3>
                    <p>Accredited by International Nail Academy.</p>
                </div>
                <div class="certification-box">
                    <img src="images/Certificate2.png" alt="Advanced Nail Art Specialist">
                    <h3>Advanced Nail Art Specialist</h3>
                    <p>Recognized for excellence in custom nail designs.</p>
                </div>
                <div class="certification-box">
                    <img src="images/Certificate3.png" alt="Sanitation & Hygiene Certified">
                    <h3>Sanitation & Hygiene Certified</h3>
                    <p>Ensuring the highest standards of cleanliness and safety.</p>
                </div>
            </div>
        </div>
    </section>
</body>
</html>
