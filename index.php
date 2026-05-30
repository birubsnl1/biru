<?php 
session_start(); 
// Determine if user is already logged in to change the Login button to 'Dashboard'
$isLoggedIn = isset($_SESSION['user_id']);
$dashboardLink = ($isLoggedIn && $_SESSION['role'] === 'admin') ? 'admin/index.php' : 'student/index.php';

// Include the Universal Header
require_once('includes/header.php');
?>

<!-- Bilingual Running Ticker -->
<div class="ticker-container">
    <div class="ticker-marquee">
        🔥 English Learning Program: Special Admission Batches open for School, College & Working Professionals! Learn • Practice • Communicate • Succeed | हिंदी माध्यम के विद्यार्थियों के लिए विशेष अंग्रेज़ी बैच प्रारंभ! 🔥
    </div>
</div>

<!-- Scroll to Top Button -->
<button id="scrollToTop" class="scroll-to-top" aria-label="Scroll to top">
    <i class="fas fa-chevron-up"></i>
</button>

<!-- Hero Section (Oxford Blue & Gold Gradient) -->
<header class="hero-wrapper text-center text-md-start">
    <div class="container py-5">
        <div class="row align-items-center g-5">
            <div class="col-lg-7">
                <span class="badge rounded-pill bg-gold text-dark mb-3 px-4 py-2 fw-bold text-uppercase" style="font-size: 0.85rem; letter-spacing: 1px;">
                    <i class="fas fa-graduation-cap me-2"></i> Hybrid Learning Program
                </span>
                <h1 class="display-3 fw-extrabold mb-3 text-white lh-sm">
                    हिंदी माध्यम के विद्यार्थियों के लिए अंग्रेज़ी सीखें
                </h1>
                <p class="lead mb-4 text-white opacity-90 fs-4 lh-base">
                    Beginner (A1) से Advanced (C2) तक — आत्मविश्वास के साथ अंग्रेज़ी बोलना, पढ़ना और लिखना सीखें।
                </p>
                <div class="d-flex flex-wrap gap-3 justify-content-center justify-content-md-start mt-4">
                    <a href="#contact" class="btn btn-gold btn-lg px-4 shadow">
                        <i class="fas fa-circle-play me-2"></i> Free Demo Class
                    </a>
                    <a href="registration/reg.php" class="btn btn-outline-light btn-lg px-4 rounded-pill border-2">
                        <i class="fas fa-user-plus me-2"></i> Enroll Now
                    </a>
                    <a href="https://wa.me/919402308316" target="_blank" class="btn btn-whatsapp btn-lg px-4">
                        <i class="fab fa-whatsapp me-2"></i> WhatsApp Inquiry
                    </a>
                </div>
            </div>
            
            <div class="col-lg-5 text-center d-none d-lg-block">
                <!-- Academic Theme Decorative Graphic -->
                <div class="position-relative d-inline-block">
                    <div class="p-4 bg-white bg-opacity-10 rounded-4 border border-white border-opacity-10 shadow-lg backdrop-blur" style="max-width: 420px; border-radius: 24px !important;">
                        <div class="d-flex flex-column gap-3 text-start">
                            <div class="p-3 bg-white bg-opacity-10 rounded-3 d-flex align-items-center gap-3">
                                <div class="fs-1 text-gold"><i class="fas fa-book-open"></i></div>
                                <div>
                                    <h6 class="fw-bold mb-0 text-white">Daily Bilingual Study Notes</h6>
                                    <small class="text-white opacity-75">Concept-wise notes in Hindi & English</small>
                                </div>
                            </div>
                            <div class="p-3 bg-white bg-opacity-10 rounded-3 d-flex align-items-center gap-3">
                                <div class="fs-1 text-gold"><i class="fas fa-comments"></i></div>
                                <div>
                                    <h6 class="fw-bold mb-0 text-white">Spoken Fluency Sessions</h6>
                                    <small class="text-white opacity-75">1-on-1 speaking & pronunciation drill</small>
                                </div>
                            </div>
                            <div class="p-3 bg-white bg-opacity-10 rounded-3 d-flex align-items-center gap-3">
                                <div class="fs-1 text-gold"><i class="fas fa-certificate"></i></div>
                                <div>
                                    <h6 class="fw-bold mb-0 text-white">Certified Level Curriculum</h6>
                                    <small class="text-white opacity-75">Official CEFR mapped certificates</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- About Us Section -->
<section id="about" class="py-5 bg-light-gray" style="background-color: var(--bg-secondary);">
    <div class="container py-4">
        <div class="row align-items-center g-5">
            <div class="col-lg-6">
                <div class="row g-3">
                    <div class="col-6">
                        <div class="p-4 text-center custom-card stat-card">
                            <span class="fs-1 text-gold"><i class="fas fa-users-viewfinder"></i></span>
                            <h3 class="fw-bold mt-2"><span class="counter">5000</span>+</h3>
                            <p class="text-muted small mb-0">Students Trained</p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4 text-center custom-card stat-card" style="margin-top: 20px;">
                            <span class="fs-1 text-gold"><i class="fas fa-chalkboard-user"></i></span>
                            <h3 class="fw-bold mt-2">12+</h3>
                            <p class="text-muted small mb-0">Expert Faculty</p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4 text-center custom-card stat-card">
                            <span class="fs-1 text-gold"><i class="fas fa-face-smile"></i></span>
                            <h3 class="fw-bold mt-2">99%</h3>
                            <p class="text-muted small mb-0">Success Rate</p>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="p-4 text-center custom-card stat-card" style="margin-top: 20px;">
                            <span class="fs-1 text-gold"><i class="fas fa-laptop-house"></i></span>
                            <h3 class="fw-bold mt-2">Hybrid</h3>
                            <p class="text-muted small mb-0">Online & Offline</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-6">
                <span class="badge rounded-pill bg-gold text-dark mb-3 px-3 py-2 fw-bold">BR SQUARE ADVANTAGE</span>
                <h2 class="display-5 fw-extrabold mb-4">हम समझते हैं आपकी भाषा की चुनौतियां</h2>
                <p class="text-secondary mb-4 lh-lg fs-5">
                    हमारा विशेष शिक्षण पाठ्यक्रम विशेष रूप से उन विद्यार्थियों के लिए डिज़ाइन किया गया है जिन्होंने अपनी शिक्षा हिंदी माध्यम से पूरी की है। हम प्रत्यक्ष व्याकरण अनुवाद (Direct Translation), शब्दावली निर्माण, और व्यावहारिक स्पोकन अभ्यास के माध्यम से आपकी अंग्रेज़ी के प्रति हिचकिचाहट को दूर करते हैं।
                </p>
                <div class="d-flex flex-column gap-3 mb-4">
                    <div class="d-flex align-items-center gap-3">
                        <span class="text-gold fs-4"><i class="fas fa-square-check"></i></span>
                        <span class="fw-semibold text-secondary">हिंदी से अंग्रेज़ी में सरल अनुवाद तकनीकों का अभ्यास</span>
                    </div>
                    <div class="d-flex align-items-center gap-3">
                        <span class="text-gold fs-4"><i class="fas fa-square-check"></i></span>
                        <span class="fw-semibold text-secondary">बिना रटे व्याकरण नियमों को समझने का आसान तरीका</span>
                    </div>
                    <div class="d-flex align-items-center gap-3">
                        <span class="text-gold fs-4"><i class="fas fa-square-check"></i></span>
                        <span class="fw-semibold text-secondary">दैनिक जीवन की व्यावहारिक बातचीत से आत्मविश्वास जगाना</span>
                    </div>
                </div>
                <a href="registration/reg.php" class="btn btn-gold btn-lg">Explore Batches</a>
            </div>
        </div>
    </div>
</section>

<!-- English Levels Section -->
<section id="levels" class="py-5">
    <div class="container py-4 text-center">
        <span class="badge rounded-pill bg-gold text-dark mb-2 px-3 py-2 fw-bold">CEFR MAPPED CURRICULUM</span>
        <h2 class="display-5 fw-extrabold mb-2 section-title">English Proficiency Levels</h2>
        <p class="text-secondary max-width-600 mx-auto mb-5">
            हमारे विशेष स्तर आपके वर्तमान ज्ञान का आकलन कर आपको धाराप्रवाह अंग्रेज़ी के मुकाम तक ले जाते हैं।
        </p>
        
        <div class="row g-4 text-start">
            <!-- Level 1 -->
            <div class="col-md-6 col-lg-3">
                <div class="card custom-card h-100 p-4 d-flex flex-column justify-content-between">
                    <div>
                        <div class="level-badge mb-3">Level A1–A2</div>
                        <h4 class="fw-bold mb-3">Beginner Level</h4>
                        <p class="text-muted small mb-4">
                            बुनियादी शब्दावली, दैनिक अभिवादन और सरल व्याकरण सीखें। अंग्रेज़ी की शुरुआत करने वालों के लिए सर्वश्रेष्ठ।
                        </p>
                        <h6 class="fw-bold small mb-2 text-uppercase text-gold">Skills Covered:</h6>
                        <ul class="list-icon-check mb-4">
                            <li>Self Introductions</li>
                            <li>Basic Grammar Rules</li>
                            <li>Daily Greeting Formats</li>
                        </ul>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-4 pt-3 border-top border-light">
                            <span class="small text-muted"><i class="far fa-clock me-1"></i> Duration:</span>
                            <span class="fw-bold text-gold">3 Months</span>
                        </div>
                        <a href="registration/reg.php" class="btn btn-outline-gold w-100">Enroll Level</a>
                    </div>
                </div>
            </div>
            
            <!-- Level 2 -->
            <div class="col-md-6 col-lg-3">
                <div class="card custom-card h-100 p-4 d-flex flex-column justify-content-between border-primary border-opacity-20">
                    <div>
                        <div class="level-badge mb-3">Level B1–B2</div>
                        <h4 class="fw-bold mb-3">Intermediate Level</h4>
                        <p class="text-muted small mb-4">
                            प्रवाह निर्माण, व्यवस्थित बातचीत और बिना किसी हिचकिचाहट के अंग्रेज़ी में विचार व्यक्त करने का अभ्यास।
                        </p>
                        <h6 class="fw-bold small mb-2 text-uppercase text-gold">Skills Covered:</h6>
                        <ul class="list-icon-check mb-4">
                            <li>Structured Conversations</li>
                            <li>Tense Mastery</li>
                            <li>Fluency Training</li>
                        </ul>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-4 pt-3 border-top border-light">
                            <span class="small text-muted"><i class="far fa-clock me-1"></i> Duration:</span>
                            <span class="fw-bold text-gold">4 Months</span>
                        </div>
                        <a href="registration/reg.php" class="btn btn-gold w-100">Enroll Level</a>
                    </div>
                </div>
            </div>
            
            <!-- Level 3 -->
            <div class="col-md-6 col-lg-3">
                <div class="card custom-card h-100 p-4 d-flex flex-column justify-content-between">
                    <div>
                        <div class="level-badge mb-3">Level C1–C2</div>
                        <h4 class="fw-bold mb-3">Advanced Level</h4>
                        <p class="text-muted small mb-4">
                            उन्नत शब्दावली, धाराप्रवाह भाषण, उच्चारण में सुधार और जटिल शैक्षणिक व व्यावसायिक विषयों पर बोलने का कौशल।
                        </p>
                        <h6 class="fw-bold small mb-2 text-uppercase text-gold">Skills Covered:</h6>
                        <ul class="list-icon-check mb-4">
                            <li>Advanced Vocabulary</li>
                            <li>Accent Correction</li>
                            <li>Debates & Discussions</li>
                        </ul>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-4 pt-3 border-top border-light">
                            <span class="small text-muted"><i class="far fa-clock me-1"></i> Duration:</span>
                            <span class="fw-bold text-gold">4 Months</span>
                        </div>
                        <a href="registration/reg.php" class="btn btn-outline-gold w-100">Enroll Level</a>
                    </div>
                </div>
            </div>
            
            <!-- Level 4 -->
            <div class="col-md-6 col-lg-3">
                <div class="card custom-card h-100 p-4 d-flex flex-column justify-content-between">
                    <div>
                        <div class="level-badge mb-3">Executive Level</div>
                        <h4 class="fw-bold mb-3">Advanced Communication</h4>
                        <p class="text-muted small mb-4">
                            वर्किंग प्रोफेशनल्स के लिए इंटरव्यू तैयारी, ईमेल राइटिंग, कॉर्पोरेट पत्राचार और प्रभावी पब्लिक स्पीकिंग ट्रेनिंग।
                        </p>
                        <h6 class="fw-bold small mb-2 text-uppercase text-gold">Skills Covered:</h6>
                        <ul class="list-icon-check mb-4">
                            <li>Interview Preparation</li>
                            <li>Corporate Correspondence</li>
                            <li>Public Speaking</li>
                        </ul>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-4 pt-3 border-top border-light">
                            <span class="small text-muted"><i class="far fa-clock me-1"></i> Duration:</span>
                            <span class="fw-bold text-gold">2 Months</span>
                        </div>
                        <a href="registration/reg.php" class="btn btn-outline-gold w-100">Enroll Level</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Special Batches Section -->
<section id="batches" class="py-5 bg-light-gray" style="background-color: var(--bg-secondary);">
    <div class="container py-4 text-center">
        <span class="badge rounded-pill bg-gold text-dark mb-2 px-3 py-2 fw-bold">CUSTOMIZED BATCHES</span>
        <h2 class="display-5 fw-extrabold mb-2 section-title">Special Batches Available</h2>
        <p class="text-secondary max-width-600 mx-auto mb-5">
            हर पृष्ठभूमि के विद्यार्थियों के लिए उनकी आवश्यकतानुसार विशेष शिक्षण कक्षाएं।
        </p>
        
        <div class="row g-4 text-start">
            <!-- Batch Cards -->
            <?php
            $batches = [
                ["icon" => "fa-child", "title" => "Class 1 to 5 Students", "desc" => "बच्चों के लिए बुनियादी अंग्रेज़ी की नींव, खेल-खेल में शब्दों की पहचान और वाक्य निर्माण।"],
                ["icon" => "fa-children", "title" => "Class 6 to 8 Students", "desc" => "स्कूल पाठ्यक्रम के साथ-साथ बुनियादी व्याकरण सुदृढीकरण और शुरुआती बातचीत का अभ्यास।"],
                ["icon" => "fa-school", "title" => "Class 9 to 10 Students", "desc" => "बोर्ड परीक्षाओं में अच्छे अंक हेतु लिखित अंग्रेज़ी और आत्मविश्वास से बोलने की तैयारी।"],
                ["icon" => "fa-school-flag", "title" => "Class 11 to 12 Students", "desc" => "उच्चतर माध्यमिक छात्रों के लिए प्रतियोगी परीक्षाओं और कॉलेज जीवन हेतु अंग्रेज़ी सुधार।"],
                ["icon" => "fa-user-graduate", "title" => "BA Students", "desc" => "ग्रेजुएशन स्तर के छात्रों के लिए निबंध लेखन, विश्लेषणात्मक अंग्रेज़ी और सेमिनार भाषण तैयारी।"],
                ["icon" => "fa-graduation-cap", "title" => "MA Students", "desc" => "उच्च शिक्षा के छात्रों के लिए शोध पत्र लेखन, साहित्यिक शब्दकोश और उन्नत व्याकरण कौशल।"],
                ["icon" => "fa-clipboard-question", "title" => "JTET / CTET Aspirants", "desc" => "शिक्षक पात्रता परीक्षाओं के अंग्रेज़ी पाठ्यक्रम और शिक्षाशास्त्र (CDP & Pedagogy) की पूर्ण तैयारी।"],
                ["icon" => "fa-award", "title" => "Competitive Exams", "desc" => "SSC, Banking, Railway और अन्य परीक्षाओं के अंग्रेज़ी खण्ड की स्मार्ट ट्रिक्स के साथ तैयारी।"],
                ["icon" => "fa-briefcase", "title" => "Working Professionals", "desc" => "दफ्तरों में धाराप्रवाह प्रस्तुतीकरण (Presentations), ईमेल लेखन और बैठकों में प्रभावी बातचीत।"]
            ];
            foreach ($batches as $batch):
            ?>
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas <?= $batch['icon'] ?>"></i></div>
                        <h5 class="fw-bold mb-0"><?= $batch['title'] ?></h5>
                    </div>
                    <p class="text-muted small mb-0 lh-base">
                        <?= $batch['desc'] ?>
                    </p>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<!-- Course Features Section -->
<section id="features" class="py-5">
    <div class="container py-4 text-center">
        <span class="badge rounded-pill bg-gold text-dark mb-2 px-3 py-2 fw-bold">PROVEN LEARNING SYLLABUS</span>
        <h2 class="display-5 fw-extrabold mb-2 section-title">English Course Features</h2>
        <p class="text-secondary max-width-600 mx-auto mb-5">
            हमारा संतुलित पाठ्यक्रम आपको अंग्रेज़ी के हर क्षेत्र में निपुण बनाता है।
        </p>
        
        <div class="row g-4 text-start">
            <?php
            $features = [
                ["icon" => "fa-spell-check", "title" => "Grammar Mastery", "desc" => "बिना किसी रटंत प्रणाली के, व्यावहारिक उदाहरणों से अंग्रेज़ी व्याकरण के सभी मूलभूत और अग्रिम नियमों की स्पष्ट समझ।"],
                ["icon" => "fa-book-atlas", "title" => "Vocabulary Building", "desc" => "दैनिक जीवन में उपयोग होने वाले 3000 से अधिक महत्वपूर्ण शब्दों और मुहावरों का व्यवस्थित अभ्यास।"],
                ["icon" => "fa-book-reader", "title" => "Reading & Writing Skills", "desc" => "लिखित अभिव्यक्ति, निबंध लेखन, पत्र लेखन और समाचार पत्रों को आसानी से पढ़ने और समझने की क्षमता का विकास।"],
                ["icon" => "fa-volume-high", "title" => "Listening & Speaking Practice", "desc" => "वास्तविक बातचीत, ऑडियो-विजुअल सत्रों और बोलने के दैनिक अभ्यासों से अंग्रेज़ी सुनने व सहजता से बोलने का विकास।"],
                ["icon" => "fa-circle-user", "title" => "Personality Development", "desc" => "बॉडी लैंग्वेज, शिष्टाचार, सकारात्मक दृष्टिकोण और आत्मविश्वास से युक्त व्यक्तित्व का संपूर्ण निर्माण।"],
                ["icon" => "fa-comments-dollar", "title" => "Public Speaking", "desc" => "मंच पर चढ़कर बिना किसी संकोच या डर के बड़ी सभाओं के सामने अपने विचार प्रभावी ढंग से रखने की व्यावहारिक कला।"],
                ["icon" => "fa-id-card-clip", "title" => "Interview Preparation", "desc" => "नौकरियों के लिए मॉक इंटरव्यू, अक्सर पूछे जाने वाले प्रश्नों के उत्तर और आकर्षक परिचय तैयार करने की विशेष तकनीकें।"],
                ["icon" => "fa-users-rectangle", "title" => "Group Discussion Training", "desc" => "सामूहिक चर्चाओं में भागीदारी, तार्किक रूप से असहमति जताना और बहस में तार्किक दृष्टिकोण प्रस्तुत करने की विशेषज्ञ ट्रेनिंग।"],
                ["icon" => "fa-globe", "title" => "International Communication", "desc" => "वैश्विक मानकों के अनुसार शिष्टाचार, ईमेल पत्राचार और अंतरराष्ट्रीय परिवेश में सहज बातचीत का अभ्यास।"],
                ["icon" => "fa-language", "title" => "Hindi to English Translation", "desc" => "हिंदी माध्यम के छात्रों के लिए विशेष अनुवाद सत्र, जिससे मन में तुरंत हिंदी से अंग्रेज़ी वाक्यों का निर्माण हो सके।"]
            ];
            foreach ($features as $feat):
            ?>
            <div class="col-md-6 col-lg-6">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-start gap-4">
                        <div class="fs-1 text-gold mt-1"><i class="fas <?= $feat['icon'] ?>"></i></div>
                        <div>
                            <h5 class="fw-bold mb-2"><?= $feat['title'] ?></h5>
                            <p class="text-muted small mb-0 lh-lg"><?= $feat['desc'] ?></p>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>
</section>

<!-- Success Stories / Testimonials Section -->
<section id="testimonials" class="py-5 bg-light-gray" style="background-color: var(--bg-secondary);">
    <div class="container py-4 text-center">
        <span class="badge rounded-pill bg-gold text-dark mb-2 px-3 py-2 fw-bold">SUCCESS STORIES</span>
        <h2 class="display-5 fw-extrabold mb-2 section-title">What Our Students Say</h2>
        <p class="text-secondary max-width-600 mx-auto mb-5">
            हमारे सफल विद्यार्थियों के वास्तविक अनुभव जिन्होंने हिंदी माध्यम से होने के बावजूद अंग्रेज़ी पर पूर्ण अधिकार प्राप्त किया।
        </p>
        
        <div class="row g-4 text-start">
            <div class="col-md-4">
                <div class="testimonial-card">
                    <div class="d-flex align-items-center gap-3 mb-4">
                        <img src="assets/images/logo-1.png" alt="Student Profile" class="testimonial-avatar" onerror="this.src='https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=100&h=100&q=80'">
                        <div>
                            <h6 class="fw-bold mb-0">प्रियंका सिंह</h6>
                            <small class="text-muted">एमए छात्रा (MA Student)</small>
                            <div class="text-warning small mt-1">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <p class="text-secondary small lh-lg mb-0 italic">
                        "हिंदी माध्यम से पढ़ाई करने के कारण मैं हमेशा कॉलेज सेमिनार में बोलने से डरती थी। बीआर स्क्वायर के स्पेशल लेवल-2 कोर्स ने मेरी हिचकिचाहट को पूरी तरह से समाप्त कर दिया। आज मैं बिना डरे अंग्रेज़ी बोल सकती हूँ।"
                    </p>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="testimonial-card border-primary border-opacity-25">
                    <div class="d-flex align-items-center gap-3 mb-4">
                        <img src="assets/images/logo.png" alt="Student Profile" class="testimonial-avatar" onerror="this.src='https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=100&h=100&q=80'">
                        <div>
                            <h6 class="fw-bold mb-0">अमित महतो</h6>
                            <small class="text-muted">सॉफ्टवेयर डेवलपर (Professional)</small>
                            <div class="text-warning small mt-1">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <p class="text-secondary small lh-lg mb-0 italic">
                        "आईटी कंपनी में आने के बाद क्लाइंट्स से अंग्रेज़ी में बात करना मेरे लिए एक बुरा सपना था। कॉर्पोरेट अंग्रेज़ी बैच में जो मेल पत्राचार और शिष्टाचार सिखाया गया, उसने मेरे करियर को एक नई दिशा दी।"
                    </p>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="testimonial-card">
                    <div class="d-flex align-items-center gap-3 mb-4">
                        <img src="assets/images/logo-1.png" alt="Student Profile" class="testimonial-avatar" onerror="this.src='https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=100&h=100&q=80'">
                        <div>
                            <h6 class="fw-bold mb-0">रोशनी कुमारी</h6>
                            <small class="text-muted">शिक्षिका (JTET Aspirant)</small>
                            <div class="text-warning small mt-1">
                                <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                            </div>
                        </div>
                    </div>
                    <p class="text-secondary small lh-lg mb-0 italic">
                        "जेटीईटी अंग्रेज़ी खण्ड की व्याकरण मेरे लिए सबसे कठिन थी। बीआर स्क्वायर के शिक्षकों ने व्याकरण के नियमों को इतने आसान तरीकों से समझाया कि इस बार मैंने परीक्षा में सर्वोच्च अंक प्राप्त किए।"
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Learning Resources Section -->
<section id="resources" class="py-5">
    <div class="container py-4 text-center">
        <span class="badge rounded-pill bg-gold text-dark mb-2 px-3 py-2 fw-bold">FREE REVISION KITS</span>
        <h2 class="display-5 fw-extrabold mb-2 section-title">Free Study Materials & Resources</h2>
        <p class="text-secondary max-width-600 mx-auto mb-5">
            बिना किसी शुल्क के हमारे प्रीमियम अंग्रेज़ी अध्ययन संकलन का लाभ उठाएं।
        </p>
        
        <div class="row g-4 text-start">
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas fa-file-pdf"></i></div>
                        <h5 class="fw-bold mb-0">Free Notes & E-Books</h5>
                    </div>
                    <p class="text-muted small mb-3">
                        हिंदी अनुवादों के साथ सभी महत्वपूर्ण व्याकरण विषयों पर हस्तलिखित और मुद्रित पीडीएफ नोट्स।
                    </p>
                    <a href="registration/reg.php" class="text-gold fw-bold text-decoration-none small hover-gold">Download PDFs <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas fa-circle-play"></i></div>
                        <h5 class="fw-bold mb-0">Bilingual Video Lessons</h5>
                    </div>
                    <p class="text-muted small mb-3">
                        अग्रणी शिक्षकों द्वारा तैयार किए गए शार्ट वीडियो लेक्चर जो कठिन नियमों को मिनटों में समझाते हैं।
                    </p>
                    <a href="https://youtube.com/@BRSquareClasses" target="_blank" class="text-gold fw-bold text-decoration-none small hover-gold">Watch Playlist <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas fa-file-signature"></i></div>
                        <h5 class="fw-bold mb-0">Practice Worksheets</h5>
                    </div>
                    <p class="text-muted small mb-3">
                        दैनिक जीवन के वाक्यों के अनुवाद अभ्यास हेतु समाधान सहित विशेष अनुवाद कार्यपत्रक।
                    </p>
                    <a href="registration/reg.php" class="text-gold fw-bold text-decoration-none small hover-gold">Get Worksheets <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas fa-laptop-code"></i></div>
                        <h5 class="fw-bold mb-0">Bilingual Mock Tests</h5>
                    </div>
                    <p class="text-muted small mb-3">
                        ऑनलाइन पोर्टल पर अंग्रेज़ी व्याकरण और समझ (Comprehension) की जांच हेतु वास्तविक परीक्षण श्रृंखला।
                    </p>
                    <a href="login.php" class="text-gold fw-bold text-decoration-none small hover-gold">Attempt Test <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas fa-spell-check"></i></div>
                        <h5 class="fw-bold mb-0">Vocabulary Builder</h5>
                    </div>
                    <p class="text-muted small mb-3">
                        दैनिक आधार पर 5 नए शब्द, उनके अर्थ, वाक्य प्रयोग और उच्चारण ऑडियो क्लिप्स।
                    </p>
                    <a href="registration/reg.php" class="text-gold fw-bold text-decoration-none small hover-gold">Unlock words <i class="fas fa-arrow-right ms-1"></i></a>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4">
                <div class="card custom-card h-100 p-4 border-gold border-dashed bg-gold bg-opacity-5">
                    <div class="d-flex align-items-center gap-3 mb-3">
                        <div class="fs-2 text-gold"><i class="fas fa-circle-check"></i></div>
                        <h5 class="fw-bold mb-0">Full Premium Bundle</h5>
                    </div>
                    <p class="text-muted small mb-3">
                        यदि आप संपूर्ण व्यवस्थित मार्गदर्शन और मेंटरशिप चाहते हैं, तो आज ही पंजीकरण पूर्ण करें।
                    </p>
                    <a href="registration/reg.php" class="btn btn-gold btn-sm w-100 py-2">Join Premium</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Contact Us / Inquiry Form Section -->
<section id="contact" class="py-5 bg-light-gray" style="background-color: var(--bg-secondary);">
    <div class="container py-4">
        <div class="row g-5">
            <!-- Form Card -->
            <div class="col-lg-6">
                <div class="card custom-card p-4 p-md-5">
                    <span class="badge rounded-pill bg-gold text-dark mb-3 px-3 py-2 fw-bold align-self-start">GET IN TOUCH</span>
                    <h3 class="fw-bold mb-2">Inquiry Form / पूछताछ फॉर्म</h3>
                    <p class="text-muted small mb-4">
                        अंग्रेज़ी सीखने से संबंधित किसी भी सहायता या बैच जानकारी के लिए हमें संदेश भेजें।
                    </p>
                    
                    <form action="registration/reg.php" method="GET">
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Student Name / छात्र का नाम</label>
                            <input type="text" name="name" class="form-control" placeholder="Enter Full Name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Mobile Number / मोबाइल नंबर</label>
                            <div class="input-group">
                                <span class="input-group-text bg-light text-muted border-end-0 border" style="border-radius: 10px 0 0 10px;">+91</span>
                                <input type="tel" name="phone" class="form-control border-start-0" placeholder="10 Digit Number" required style="border-radius: 0 10px 10px 0;">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">Selected Level / रुचि का स्तर</label>
                            <select name="level" class="form-select" required>
                                <option value="">Select Level</option>
                                <option value="Level-1">Beginner Level (A1-A2)</option>
                                <option value="Level-2">Intermediate Level (B1-B2)</option>
                                <option value="Both">Advanced & Professional (C1-C2)</option>
                            </select>
                        </div>
                        <div class="mb-4">
                            <label class="form-label small fw-bold text-secondary">Message / संदेश (यदि कोई हो)</label>
                            <textarea class="form-control" rows="3" placeholder="Tell us about your learning goals..."></textarea>
                        </div>
                        
                        <button type="submit" class="btn btn-gold w-100 py-3">Submit Inquiry (पूछताछ सबमिट करें)</button>
                    </form>
                </div>
            </div>
            
            <!-- Contact Details & Map Integration -->
            <div class="col-lg-6 d-flex flex-column justify-content-between">
                <div>
                    <h3 class="fw-bold mb-4">Contact Information</h3>
                    
                    <div class="d-flex flex-column gap-4 mb-4">
                        <div class="d-flex align-items-center gap-3">
                            <div class="fs-3 text-gold"><i class="fas fa-location-dot"></i></div>
                            <div>
                                <h6 class="fw-bold mb-0">Head Office Location:</h6>
                                <p class="text-secondary small mb-0">Chakradharpur Center, West Singhbhum, Jharkhand</p>
                            </div>
                        </div>
                        
                        <div class="d-flex align-items-center gap-3">
                            <div class="fs-3 text-gold"><i class="fas fa-phone-volume"></i></div>
                            <div>
                                <h6 class="fw-bold mb-0">Support Desk:</h6>
                                <p class="text-secondary small mb-0">+91 9402308316 | +91 7004274431</p>
                            </div>
                        </div>
                        
                        <div class="d-flex align-items-center gap-3">
                            <div class="fs-3 text-gold"><i class="fas fa-envelope-open-text"></i></div>
                            <div>
                                <h6 class="fw-bold mb-0">Official Email:</h6>
                                <p class="text-secondary small mb-0">ceobrsquare@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Beautifully styled Google Map placeholder frame -->
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14749.629377467657!2d85.61334812607873!3d22.675848777085732!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1m3!1d2000!2d85.618348!3d22.675848!2m2!1f0!2f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1700000000000!5m2!1sen!2sin" 
                            width="100%" height="250" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" title="BR Square classes Location map"></iframe>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Floating WhatsApp Shortcut Button -->
<div class="floating-whatsapp">
    <a href="https://wa.me/919402308316?text=Hello%20BR%20Square%20Classes,%20I%20am%20interested%20in%20the%20English%20Learning%20Program." class="whatsapp-float-btn shadow" target="_blank" aria-label="WhatsApp support channel">
        <i class="fab fa-whatsapp"></i>
    </a>
</div>

<?php 
// Include the Universal Footer
require_once('includes/footer.php');
?>

<script>
// Scroll to Top Button Functionality
document.addEventListener('DOMContentLoaded', function() {
    const scrollToTopBtn = document.getElementById('scrollToTop');
    
    // Show/Hide scroll to top button
    window.addEventListener('scroll', function() {
        if (window.pageYOffset > 300) {
            scrollToTopBtn.classList.add('show');
        } else {
            scrollToTopBtn.classList.remove('show');
        }
    });
    
    // Scroll to top on click
    scrollToTopBtn.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
    
    // Enhanced counter animations for statistics
    const counterElements = document.querySelectorAll('.counter');
    const observerOptions = {
        threshold: 0.5,
        rootMargin: '0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting && !entry.target.classList.contains('counted')) {
                const target = parseInt(entry.target.textContent);
                animateCounter(entry.target, 0, target, 1500);
                entry.target.classList.add('counted');
            }
        });
    }, observerOptions);
    
    counterElements.forEach(el => observer.observe(el));
    
    function animateCounter(element, start, end, duration) {
        const range = end - start;
        const increment = end > 1000 ? range / (duration / 16) : range / (duration / 100);
        let current = start;
        
        const timer = setInterval(() => {
            current += increment;
            if ((increment > 0 && current >= end) || (increment < 0 && current <= end)) {
                element.textContent = end.toLocaleString();
                clearInterval(timer);
            } else {
                element.textContent = Math.floor(current).toLocaleString();
            }
        }, 16);
    }
    
    // Smooth scroll for internal links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href !== '#' && document.querySelector(href)) {
                e.preventDefault();
                document.querySelector(href).scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    // Testimonial carousel auto-rotate
    const testimonialsCarousel = document.getElementById('testimonialsCarousel');
    if (testimonialsCarousel) {
        const carousel = new bootstrap.Carousel(testimonialsCarousel, {
            interval: 6000,
            wrap: true
        });
    }
});
</script>