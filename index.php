<?php

session_start();

require_once __DIR__ . '/config/connect.php';

if (isset($_GET['logout'])) {
    session_unset();
    session_destroy();
}

// print_r($_SESSION);

?>

<!doctype html>
<html>
    <head>
        <title>Fizika Szertár 2026</title>
     
        <meta charset="utf-8"> 
        
        <link rel="stylesheet" href="./assets/css/00-tokens-base.css">
        <link rel="stylesheet" href="./assets/css/30-layout.css">
        <link rel="stylesheet" href="./assets/css/10-header.css">
        <link rel="stylesheet" href="./assets/css/20-category-bar.css">
        <link rel="stylesheet" href="./assets/css/40-lesson.css">
        <link rel="stylesheet" href="./assets/css/50-footer.css">
        <link rel="stylesheet" href="./assets/css/90-responsive.css">
        <!--
        <link rel="stylesheet" type="text/css" href="assets/css/workshop_clean.css">

        -->
        

        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

        <script type="module" src="assets/js/app.js"></script>

      
    </head>
    
    <body>
        <header class="site-header">
            <div class="site-header__inside" id="site-header__inside">
             <!-- dynamic content will be generated here -->              
            </div>
        </header>
         
                        
        <main class="app-main main-content" id="app-main">

            <aside class="main-content__left left-rail" id="left-rail">
                    <!-- TODO: dynamic content will be generated here -->
                    <img src="assets/images/logo2.svg" alt="Molnár Botond Fizika Szertára">
            </aside>

            <section class="main-content__mid main-stage" id="main-stage">
            
                <section class="hero" id="hero">
                                    
                    <div class="hero__inside" id="hero__inside">
                        <!-- TODO: dynamic content will be generated here -->
                        <h1>Üdvözlöm a Fizika Szertárban!</h1>
                        <h2>Ingyenes ismeretterjesztő tartalmak és tanagyagok fizikából és matematikából!</h2>
                        <h2>A házigazda: Molnár Botond</h2>
                        <button>Vendégkönyv</button>
                    </div>		
                    
                </section>

                <nav class="category-bar" id="category-bar">
                    
                    <div class="category-bar__inside" id="category-bar__inside">
                        
                        <ul class="category-bar__list horizontal-list" id="category-bar__list">
                        <!-- dynamic content will be generated here engine-> category-bar.js-->   
                        </ul>	

                    </div>
                </nav>

                <section class="learning-stage" id="learning-stage">
                    <!-- TODO: dynamic content will be generated here -->
                    <img src="assets/images/laboratory_hu.jpg">
                    <img src="assets/images/laboratory_hu.jpg">
                    <img src="assets/images/laboratory_hu.jpg">
                </section>

            </section>    
        
            <aside class="main-content__right right-rail" id="right-rail">
                    <!-- TODO: dynamic content will be generated here -->
                    Jobb oldalsáv
            </aside>		
                
        </main>

        <footer class="footer" id="footer">
            <!-- TODO: dynamic content will be generated here -->
            <p>© 2025 Oktatási honlap</p>
            <p>Támogatás</p>
            <p>kapcsolat, névjegy</p>
        </footer>
    </body>
</html>


