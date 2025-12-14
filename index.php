<?php

session_start();

require_once __DIR__ . '/config/connect.php';
//include("connect.php");

if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
}

// print_r($_SESSION);

?>

<!doctype html>
<html>
    <head>
        <title>Fizika Szertár 2025</title>
     
        <meta charset="utf-8"> 
        
        <link rel="stylesheet" type="text/css" href="style/workshop.css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <!--<script type="text/javascript" src="js/load-topics.js"></script>	
        <script type="text/javascript" src="js/render-topics.js"></script>	
        <script type="text/javascript" src="js/header-menu.js"></script>	
        <script type="text/javascript" src="js/category-bar.js"></script>	
        <script type="text/javascript" src="js/registry-controller.js"></script>
        <script type="text/javascript" src="js/login-controller.js"></script>
        -->
    </head>
    
    <body>
        <header class="site-header">
            <div class="site-header__inside" id="site-header__inside">
             <!-- dynamic content will be generated here -->              
            </div>
        </header>
            
                
        <main class="main-content" id="main-content">

            <section class="hero" id="hero">
                
                <div class="hero__left">
                    <!-- TODO: dynamic content will be generated here -->
                    <img src="images/logo2.svg" alt="Molnár Botond Fizika Szertára">
                </div>	
                <div class="hero__mid">
                    <!-- TODO: dynamic content will be generated here -->
                    <h1>Üdvözlöm a Fizika Szertárban!</h1>
                    <h2>Ingyenes ismeretterjesztő tartalmak és tanagyagok fizikából és matematikából!</h2>
                    <h2>A házigazda: Molnár Botond</h2>
                    <button>Vendégkönyv</button>
                </div>	
                <div class="hero__right">
                    <!-- TODO: dynamic content will be generated here -->
                    Jobb oldalsáv
                </div>					
                
            </section>

            <nav class="category-bar" id="category-bar">
                <!-- <div class="category-menu_label" id="category-menu_label" ></div> -->
                <div class="category-bar__inside" id="category-bar__inside">
                    
                    <ul class="category-bar__list horizontal-list" id="category-bar__list">
                     <!-- dynamic content will be generated here engine-> category-bar.js-->   
                    </ul>	

                </div>
            </nav>

            <section class="form-box" id="form-box">
            </section>	

            <section class="topic-box" id="topic-box">
                <!-- TODO: dynamic content will be generated here -->
                <div class="topic-box__left">
                    Bal oldalsáv
                </div>	
                <div class="topic-box__mid">
                    <img src="images/laboratory_en.jpg">
                    <img src="images/laboratory_en.jpg">
                </div>	
                <div class="topic-box__right">
                    Jobb oldalsáv
                </div>					
            </section>	
        
            <section class="content-box" id="content-box">
                <!-- TODO: dynamic content will be generated here -->
                <img src="images/laboratory_hu.jpg">
                <img src="images/laboratory_hu.jpg">
                <img src="images/laboratory_hu.jpg">
                <img src="images/laboratory_hu.jpg">
                <img src="images/laboratory_hu.jpg">
                <img src="images/laboratory_hu.jpg">
            </section>
            
        </main>

        <footer class="footer" id="footer">
            <!-- TODO: dynamic content will be generated here -->
            <p>© 2025 Oktatási honlap</p>
            <p>Támogatás</p>
            <p>kapcsolat, névjegy</p>
        </footer>
    </body>
</html>


