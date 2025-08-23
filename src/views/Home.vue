<template>
  <div class="home">
    <!-- 导航栏 -->
    <nav class="navbar">
      <div class="nav-container">
        <div class="nav-logo">
          <h2>CYAC Global</h2>
        </div>
        <ul class="nav-menu" :class="{ active: isMenuOpen }">
          <li class="nav-item">
            <a href="#home" class="nav-link" @click="handleNavClick">Home</a>
          </li>
          <li class="nav-item">
            <a href="#about" class="nav-link" @click="handleNavClick">Competition</a>
          </li>
          <li class="nav-item">
            <a href="#professors" class="nav-link" @click="handleNavClick">Judges</a>
          </li>
          <li class="nav-item">
            <a href="#query" class="nav-link" @click="handleNavClick">Awards Query</a>
          </li>
          <li class="nav-item">
            <a href="#gallery" class="nav-link" @click="handleNavClick">Gallery</a>
          </li>
          <li class="nav-item">
            <a href="#news" class="nav-link" @click="handleNavClick">News</a>
          </li>
          <li class="nav-item">
            <a href="#contact" class="nav-link" @click="handleNavClick">Contact</a>
          </li>
        </ul>
        <div class="hamburger" :class="{ active: isMenuOpen }" @click="toggleMenu">
          <span class="bar"></span>
          <span class="bar"></span>
          <span class="bar"></span>
        </div>
      </div>
    </nav>

    <!-- 轮播图 -->
    <section id="home" class="carousel-section">
      <swiper
        :modules="modules"
        :slides-per-view="1"
        :space-between="0"
        :loop="true"
        :autoplay="{
          delay: 5000,
          disableOnInteraction: false,
        }"
        :pagination="{
          clickable: true,
        }"
        :navigation="true"
        class="swiper-container"
      >
        <swiper-slide v-for="(slide, index) in carouselSlides" :key="index">
          <div class="slide-content">
            <img :src="slide.image" :alt="slide.title" class="slide-image" />
            <div class="slide-overlay"></div>
            <div class="slide-text">
              <h1>{{ slide.title }}</h1>
              <p>{{ slide.description }}</p>
              <a v-if="slide.link" :href="slide.link" class="cta-button">Learn More</a>
            </div>
          </div>
        </swiper-slide>
      </swiper>
    </section>

    <!-- 比赛介绍 -->
    <section id="about" class="about-section">
      <div class="container">
        <h2 class="section-title">Competition Introduction</h2>
        <div class="about-grid">
          <div class="about-card">
            <h3>Exhibition Introduction</h3>
            <p>Art is a universal language! Throughout human history, it is the influence of art that has enabled humanity to enjoy a vibrant and beautiful life and embrace the dazzling world.</p>
            <p>The "Cambridge Youth Art Competition" aims to inspire young people's passion for creation. The exhibition will be held in art museums in China and at the Cambridge campus in the UK.</p>
            <p>Throughout this period, both China and the UK can engage in friendly exchanges, gain mutual inspiration, and pursue a common path in artistic creation!</p>
          </div>
          <div class="about-card">
            <h3>About the Organizing School</h3>
            <p class="school-name">CSVPA stands for Cambridge School of Visual & Performing Arts.</p>
            
            <div class="school-section">
              <h4>School Overview</h4>
              <p>A top art school in the UK, located in Cambridge, UK, and affiliated with the Cambridge Education Group.</p>
            </div>
            
            <div class="school-section">
              <h4>Academic Progression Performance</h4>
              <ul class="achievement-list">
                <li>Over 65% of students in the Art and Design Foundation program are admitted to the University of the Arts London (UAL)</li>
                <li>Other top destinations include the Royal College of Art, Glasgow School of Art, and Parsons School of Design</li>
              </ul>
            </div>
            
            <div class="school-section">
              <h4>Industry Collaboration</h4>
              <p>We will collaborate closely with the London School of Arts, the Royal Academy of Dramatic Art (RADA), and the Hearst Group (including ELLE and Harper's Bazaar), offering scholarships and internship opportunities.</p>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- 教授团队 -->
    <section id="professors" class="professors-section">
      <div class="container">
        <!-- 国内评委 -->
        <div class="faculty-section">
          <div class="faculty-header">
            <div class="faculty-arrow">▶</div>
            <h2 class="faculty-title">DOMESTIC FACULTY</h2>
          </div>
          <div class="faculty-grid">
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/1.jpg" alt="Professor Liang Weizhou" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">LIANG WEIZHOU</h3>
                <p class="faculty-position">Contemporary Renowned Artist & Photographer</p>
                <div class="faculty-bio">
                  <p>Contemporary renowned artist and photographer<br>Former Professor of Fine Arts at East China Normal University<br>Held solo exhibitions at Shanghai Art Museum<br>Invited to exhibit in Germany, Austria, Sweden, Singapore and other countries</p>
                </div>
              </div>
            </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/2.jpg" alt="Professor Sun Yanping" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">SUN YANPING</h3>
                <p class="faculty-position">Contemporary Renowned Calligrapher</p>
                <div class="faculty-bio">
                  <p>Contemporary renowned calligrapher<br>Artist at Shanghai "Jiusan Society Calligraphy and Painting Academy", Director of Jing'an District Calligraphy Association<br>Teacher at Shanghai Huashan Art School<br>Installation work "Chinese Blackboard Writing" selected for Milan International Triennial<br>Unique naive calligraphy style</p>
                </div>
              </div>
            </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/3.jpg" alt="Professor Ni Shihua" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">NI SHIHUA</h3>
                <p class="faculty-position">Vice Chairman of Ningxia Artists Association</p>
                <div class="faculty-bio">
                  <p>Current Vice Chairman of Ningxia Artists Association<br>Director of Yinchuan Calligraphy and Painting Academy<br>National First-Class Artist<br>Mentor at Tsinghua University Academy of Fine Arts Advanced Studies Program<br>Works widely collected by museums at all levels<br>Over thirty years of experience in art education</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 国外评委 -->
        <div class="faculty-section">
          <div class="faculty-header">
            <div class="faculty-arrow">▶</div>
            <h2 class="faculty-title">INTERNATIONAL FACULTY</h2>
          </div>
          <div class="faculty-grid">
            <div class="faculty-member">
               <div class="faculty-photo">
                 <img src="/src/assets/proferssor/foreign/6.jpg" alt="Karin Askham校长" />
               </div>
               <div class="faculty-info">
                 <h3 class="faculty-name">KARIN ASKHAM</h3>
                 <p class="faculty-position">Principal</p>
                 <div class="faculty-bio">
                   <p>Graduated from Royal College of Art with a degree in Humanities and Photography Philosophy<br>Former Deputy Principal of Graduate School at London College of Fashion, UAL, and Principal of Media School at London College of Communication<br>Her photography works have been published in numerous publications including Attitude, iD.The Face, NME and Tank magazine</p>
                 </div>
               </div>
             </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/foreign/5.jpg" alt="Edward Dimsdale教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">EDWARD DIMSDALE</h3>
                <p class="faculty-position">Photographer & Author</p>
                <div class="faculty-bio">
                  <p>Since 1998, he has extensively exhibited his photographic work representing HackelBury Fine Art (London)<br>Published photography publication "Stiled"<br>He worked at London College of Communication, UAL for 10 years, teaching Photography BA and MA degree programs<br>Also taught at The Bartlett School of Architecture and Slade School of Fine Art</p>
                </div>
              </div>
            </div>
             <div class="faculty-member">
               <div class="faculty-photo">
                 <img src="/src/assets/proferssor/foreign/4.jpg" alt="Kevin Hart教授" />
               </div>
               <div class="faculty-info">
                 <h3 class="faculty-name">KEVIN HART</h3>
                 <p class="faculty-position">Artist</p>
                 <div class="faculty-bio">
                   <p>Former Professor of Media Design MA at Central Saint Martins (CSM)<br>Has held multiple solo exhibitions in galleries, museums and churches in London and Cambridge<br>His works have been published by renowned publishing houses including Reed International, Mitchell Beazley and Bloomsbury Books</p>
                 </div>
               </div>
             </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/foreign/3.jpg" alt="Holly Fulton教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">HOLLY FULTON</h3>
                <p class="faculty-position">Founder of Fashion Brand Holly Fulton</p>
                <div class="faculty-bio">
                  <p>The UK Daily Mail commented: She is undoubtedly the most brilliant "3D print and vibrant color" design queen of the past 10 years<br>Not only has her own design brand achieved success<br>Her understanding of the global fashion industry operations and her important position in London Fashion Week have earned her extremely high reputation in the UK</p>
                </div>
              </div>
            </div>
             <div class="faculty-member">
               <div class="faculty-photo">
                 <img src="/src/assets/proferssor/foreign/1.jpg" alt="Neil Ayling教授" />
               </div>
               <div class="faculty-info">
                 <h3 class="faculty-name">NEIL AYLING</h3>
                 <p class="faculty-position">Artist</p>
                 <div class="faculty-bio">
                   <p>He was awarded the Stanley Picker Trust Annual Award in 2009 (Stanley Picker Gallery was established in 1997 with funding from Stanley Picker Trust and became part of the Arts Council England from 2012)<br>His works have been exhibited at the Nixon Art Museum in Munich, Picker Art Gallery, and also at the Royal Academy of Arts</p>
                 </div>
               </div>
             </div>
             <div class="faculty-member">
               <div class="faculty-photo">
                 <img src="/src/assets/proferssor/foreign/2.jpg" alt="Carolyn Timson教授" />
               </div>
               <div class="faculty-info">
                 <h3 class="faculty-name">CAROLYN TIMSON</h3>
                 <p class="faculty-position">Fashion Designer</p>
                 <div class="faculty-bio">
                   <p>Former Vice President and Senior Design Director of Design Department at Tommy Hilfiger<br>Former designer for major brands including FIVE Foxes, SPORTMAX, and Moschino</p>
                 </div>
               </div>
             </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 获奖查询 -->
    <section id="query" class="query-section">
      <div class="container">
        <h2 class="section-title">Awards Query</h2>
        <div class="query-intro">
          <p class="query-description">Enter award number or winner's name to query award information</p>
          <p class="query-note">Supports query by number and by name, view award certificates and related information</p>
          <router-link to="/query" class="query-button">Enter Query Page</router-link>
        </div>
      </div>
    </section>

    <!-- 优秀作品 -->
    <section id="gallery" class="gallery-section">
      <div class="container">
        <h2 class="section-title">Excellent Works</h2>
        <div class="gallery-filters">
          <button 
            v-for="category in categories" 
            :key="category"
            class="filter-button" 
            :class="{ active: activeCategory === category }"
            @click="filterGallery(category)"
          >
            {{ category }}
          </button>
        </div>
        <div class="gallery-grid">
          <div 
            v-for="work in filteredWorks" 
            :key="work.id"
            class="gallery-item"
            @click="goToGallery"
          >
            <img :src="work.image" :alt="work.title" loading="lazy">
            <div class="gallery-overlay">
              <h3>{{ work.title }}</h3>
              <p>{{ work.author }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 动态发布 -->
    <section id="news" class="news-section">
      <div class="container">
        <h2 class="section-title">News & Updates</h2>
        <div class="news-grid">
          <article v-for="news in newsItems" :key="news.id" class="news-card">
            <img :src="news.image" :alt="news.title">
            <div class="news-content">
              <span class="news-category">{{ news.category }}</span>
              <h3>{{ news.title }}</h3>
              <p>{{ news.excerpt }}</p>
              <div class="news-meta">
                <span class="news-date">{{ news.date }}</span>
                <a :href="news.url" target="_blank" class="read-more">Read More</a>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- 联系我们 -->
    <section id="contact" class="contact-section">
      <div class="container">
        <h2 class="section-title">Contact Us</h2>
        <div class="contact-grid">
          <div class="contact-info">
            <h3>Contact Information</h3>
            <div class="contact-item">
              <strong>Email:</strong>
              <span>info@cyac-global.com</span>
            </div>
            <div class="contact-item">
              <strong>Phone:</strong>
              <span>+86 400-123-4567</span>
            </div>
            <div class="contact-item">
              <strong>Address:</strong>
              <span>123 Art Avenue, Chaoyang District, Beijing</span>
            </div>
          </div>
          <div class="contact-qr">
            <h3>Follow Us</h3>
            <div class="qr-code">
              <div class="qr-placeholder">WeChat QR Code</div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 页脚 -->
    <footer class="footer">
      <div class="container">
        <div class="footer-content">
          <div class="footer-section">
            <h3>CYAC Global</h3>
            <p>Official website of Global Youth Art Competition</p>
          </div>
          <div class="footer-section">
            <h4>Quick Links</h4>
            <ul>
              <li><a href="#about">Competition Introduction</a></li>
              <li><a href="#query">Awards Query</a></li>
              <li><a href="#gallery">Excellent Works</a></li>
              <li><a href="#news">News & Updates</a></li>
            </ul>
          </div>
          <div class="footer-section">
            <h4>Contact Information</h4>
            <p>Email: info@cyac-global.com</p>
            <p>Phone: +86 400-123-4567</p>
          </div>
        </div>
        <div class="footer-bottom">
          <p>&copy; 2024 CYAC Global Youth Art Competition. All rights reserved.</p>
        </div>
      </div>
    </footer>

    <!-- 返回顶部按钮 -->
    <button v-show="showBackToTop" @click="scrollToTop" class="back-to-top">
      ↑
    </button>

    <!-- 模态框 -->
    <div v-if="modalWork" class="modal-overlay" @click="closeModal">
      <div class="modal-content" @click.stop>
        <button class="modal-close" @click="closeModal">&times;</button>
        <img :src="modalWork.image" :alt="modalWork.title">
        <div class="modal-info">
          <h3>{{ modalWork.title }}</h3>
          <p><strong>Author:</strong>{{ modalWork.author }}</p>
          <p><strong>Age Group:</strong>{{ modalWork.category }}</p>
          <p><strong>Description:</strong>{{ modalWork.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, onUnmounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import { Swiper, SwiperSlide } from 'swiper/vue'
import { Navigation, Pagination, Autoplay } from 'swiper/modules'
import 'swiper/css'
import 'swiper/css/navigation'
import 'swiper/css/pagination'

export default {
  name: 'Home',
  components: {
    Swiper,
    SwiperSlide
  },
  setup() {
    // 路由
    const router = useRouter()
    
    // 响应式数据
    const isMenuOpen = ref(false)
    const activeCategory = ref('All')
    const showBackToTop = ref(false)
    const modalWork = ref(null)
    const swiperContainer = ref(null)

    // Swiper模块
    const modules = [Navigation, Pagination, Autoplay]

    // 轮播图数据
    const carouselSlides = ref([
      {
        title: 'CYAC Global Youth Art Competition',
        description: 'Inspire creativity, showcase talent, connect the world',
        image: './top_coursels/1.jpg',
        link: '#about'
      },
      {
        title: 'Global Youth Art Festival',
        description: 'Bringing together young artists from around the world',
        image: './top_coursels/2.jpg',
        link: '#gallery'
      },
      {
        title: 'Professional Judging, Authoritative Certification',
        description: 'Professional evaluation by internationally renowned art professors',
        image: './top_coursels/3.jpg',
        link: '#query'
      },
      {
        title: 'Artistic Creation Journey',
        description: 'Begin your artistic creation journey',
        image: './top_coursels/4.jpg',
        link: '#about'
      },
      {
        title: 'International Art Exchange',
        description: 'Exchange and learn with artists from around the world',
        image: './top_coursels/5.jpg',
        link: '#gallery'
      }
    ])

    // 作品分类
    const categories = ref(['All', 'Children', 'Youth', 'Young Adult'])

    // 作品数据
    const galleryWorks = ref([
      {
        id: 1,
        title: 'Colors of Dreams',
        author: 'Zhang Xiaoming',
        category: 'Children',
        image: './works/children/1.jpg',
        description: 'This artwork expresses children\'s beautiful aspirations for the future'
      },
      {
        id: 2,
        title: 'City Impressions',
        author: 'Li Xiaohong',
        category: 'Children',
        image: './works/children/2.jpg',
        description: 'Showcasing the charm of modern cities through a unique perspective'
      },
      {
        id: 3,
        title: 'Beauty of Nature',
        author: 'Wang Xiaohua',
        category: 'Youth',
        image: './works/youth/1.jpg',
        description: 'Delicate brushstrokes depicting the magnificent scenery of nature'
      },
      {
        id: 4,
        title: 'Abstract Thinking',
        author: 'Zhao Xiaogang',
        category: 'Youth',
        image: './works/youth/2.jpg',
        description: 'Using abstract techniques to express the inner emotional world'
      },
      {
        id: 5,
        title: 'Memories of Youth',
        author: 'Chen Xiaomei',
        category: 'Young Adult',
        image: './works/adult/1.jpg',
        description: 'Recording the beautiful moments of youth, with warm and touching imagery'
      },
      {
        id: 6,
        title: 'Future World',
        author: 'Liu Xiaoqiang',
        category: 'Young Adult',
        image: './works/adult/2.jpg',
        description: 'An imagined future world full of technology and innovative thinking'
      }
    ])

    // 新闻数据
    const newsItems = ref([
      {
        id: 1,
        title: '2024 CYAC Competition Officially Launched',
        excerpt: 'The Global Youth Art Competition 2024 registration is now officially open, welcoming young people from all regions to participate.',
        category: 'Competition News',
        date: '2024-01-15',
        image: './images/placeholder-news-1.svg'
      },
      {
        id: 2,
        title: 'Wang Xiaohui Exhibition Successfully Concluded',
        excerpt: 'To promote international youth art exchange, Wang Xiaohui held a large-scale art exhibition.',
        category: 'Exhibition News',
        date: '2024-01-10',
        image: './images/placeholder-news-2.svg',
        url:'https://mp.weixin.qq.com/s/9OaX_DLwBJCAXbX7yEOgyg'
      },
      {
        id: 3,
        title: 'Art Study Tour Program Open for Applications',
        excerpt: 'International art study tour program for award winners is now accepting applications.',
        category: 'Study Tour News',
        date: '2024-01-05',
        image: './images/placeholder-news-3.svg'
      }
    ])

    // 计算属性
    const filteredWorks = computed(() => {
      if (activeCategory.value === 'All') {
        return galleryWorks.value
      }
      return galleryWorks.value.filter(work => work.category === activeCategory.value)
    })

    // 方法
    const toggleMenu = () => {
      isMenuOpen.value = !isMenuOpen.value
    }

    const closeMenu = () => {
      isMenuOpen.value = false
    }

    const handleNavClick = (event) => {
      const targetId = event.currentTarget.getAttribute('href')
      const targetElement = document.querySelector(targetId)
      if (targetElement) {
        event.preventDefault()
        targetElement.scrollIntoView({ behavior: 'smooth' })
        closeMenu()
      }
    }



    const filterGallery = (category) => {
      activeCategory.value = category
    }

    const openModal = (work) => {
      modalWork.value = work
    }

    const closeModal = () => {
      modalWork.value = null
    }

    const scrollToTop = () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      })
    }

    const handleScroll = () => {
      showBackToTop.value = window.pageYOffset > 300
    }
    
    const goToGallery = () => {
      router.push('/gallery')
    }

    // 生命周期
    onMounted(() => {
      window.addEventListener('scroll', handleScroll)
      
      // 初始化Swiper（如果需要的话）
      // 这里可以添加Swiper初始化代码
    })

    onUnmounted(() => {
      window.removeEventListener('scroll', handleScroll)
    })

    return {
      isMenuOpen,
      activeCategory,
      showBackToTop,
      modalWork,
      swiperContainer,
      modules,
      carouselSlides,
      categories,
      galleryWorks,
      newsItems,
      filteredWorks,
      toggleMenu,
      closeMenu,
      handleNavClick,
      filterGallery,
      openModal,
      closeModal,
      scrollToTop,
      goToGallery
    }
  }
}
</script>

<style scoped>
/* 导航栏样式 */
.navbar {
  background-color: #404040;
  padding: 1rem 0;
  height: 70px;
  position: fixed;
  top: 0;
  width: 100%;
  z-index: 1000;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav-logo h2 {
  color: #fff;
  font-size: 1.5rem;
  font-weight: bold;
}

.nav-menu {
  display: flex;
  list-style: none;
  gap: 2rem;
}

.nav-link {
  color: #ccc;
  text-decoration: none;
  font-weight: bold;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: #ffffff;
}

.hamburger {
  display: none;
  flex-direction: column;
  cursor: pointer;
}

.bar {
  width: 25px;
  height: 3px;
  background-color: #fff;
  margin: 3px 0;
  transition: 0.3s;
}

/* 轮播图样式 */
.carousel-section {
  height: 80vw;
  position: relative;
  margin-top: 70px;
}

.swiper-container {
  width: 100%;
  height: 100%;
}

.swiper-slide {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  overflow: hidden;
}

/* Swiper导航按钮样式 */
:deep(.swiper-button-next),
:deep(.swiper-button-prev) {
  color: white;
  background: rgba(0, 0, 0, 0.3);
  width: 50px;
  height: 50px;
  border-radius: 50%;
  transition: all 0.3s ease;
}

:deep(.swiper-button-next):hover,
:deep(.swiper-button-prev):hover {
  background: rgba(45, 90, 39, 0.8);
}

:deep(.swiper-button-next:after),
:deep(.swiper-button-prev:after) {
  font-size: 20px;
  font-weight: bold;
}

/* Swiper分页器样式 */
:deep(.swiper-pagination-bullet) {
  background: rgba(255, 255, 255, 0.5);
  opacity: 1;
  transition: all 0.3s ease;
}

:deep(.swiper-pagination-bullet-active) {
  background: #2f424e;
  transform: scale(1.2);
}

.slide-content {
  position: relative;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.slide-image {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: top;
  z-index: 1;
}

.slide-text {
  position: relative;
  text-align: center;
  color: white;
  z-index: 3;
}

.slide-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.4);
  z-index: 2;
}

.slide-text h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
  font-weight: bold;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.7);
}

.slide-text p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  opacity: 0.95;
  text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.7);
}

.cta-button {
  display: inline-block;
  padding: 12px 30px;
  background-color: #2f424e;
  color: white;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
  transition: all 0.3s ease;
}

.cta-button:hover {
  background-color: #1a3d1a;
  transform: translateY(-2px);
}

/* 通用容器和标题样式 */
.section-title {
  font-size: 2.5rem;
  text-align: center;
  margin-bottom: 3rem;
  color: black;
  font-weight: bold;
}

/* 比赛介绍样式 */
.about-section {
  padding: 5rem 0;
  background-color: #fff;
}

.about-section .section-title {
  color: #333;
}

.about-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.about-card {
  background: #f8f9fa;
  padding: 1rem;
  border-radius: 10px;
  text-align: center;
  transition: all 0.3s ease;
  border: 1px solid #e9ecef;
}

.about-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 10px 30px rgba(45, 90, 39, 0.1);
}

.about-card h3 {
  color: #2f424e;
  margin-bottom: 1rem;
  font-size: 1.6rem;
}

.about-card p {
  color: #666;
  line-height: 1.6;
  text-align: start;
  margin-bottom: 1rem;
}

.school-name {
  font-style: italic;
  color: #2f424e;
  margin-bottom: 1.5rem;
  font-size: 1.1rem;
}

.school-section {
  margin-bottom: 1.5rem;
  text-align: left;
}

.school-section h4 {
  color: #2f424e;
  font-size: 1.1rem;
  margin-bottom: 0.8rem;
  font-weight: bold;
  border-bottom: 2px solid #e9ecef;
  padding-bottom: 0.3rem;
}

.achievement-list {
  list-style: none;
  padding-left: 0;
}

.achievement-list li {
  position: relative;
  padding-left: 1.2rem;
  margin-bottom: 0.5rem;
  color: #666;
  line-height: 1.6;
}

.achievement-list li:before {
  content: "•";
  color: #2f424e;
  font-weight: bold;
  position: absolute;
  left: 0;
}

/* 教授团队样式 - 简洁黑白风格 */
.professors-section {
  padding: 8rem 0;
  background-color: #ffffff;
}

.faculty-section {
  margin-bottom: 6rem;
}

.faculty-header {
  display: flex;
  align-items: center;
  margin-bottom: 4rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #000000;
}

.faculty-arrow {
  font-size: 1.2rem;
  color: #000000;
  margin-right: 1rem;
  font-weight: bold;
}

.faculty-title {
  color: #000000;
  font-size: 1.8rem;
  font-weight: normal;
  letter-spacing: 2px;
  margin: 0;
  text-transform: uppercase;
}

.faculty-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 3rem;
  max-width: 1000px;
  margin: 0 auto;
}

.faculty-member {
  text-align: center;
  transition: all 0.2s ease;
}

.faculty-member:hover {
  transform: translateY(-3px);
}

.faculty-photo {
  margin-bottom: 1.5rem;
  position: relative;
}

.faculty-photo img {
  width: 150px;
  height: 150px;
  object-fit: cover;
  border-radius: 50%;
  border: 2px solid #000000;
  transition: all 0.2s ease;
}

.faculty-member:hover .faculty-photo img {
  border-color: #666666;
}

.faculty-info {
  text-align: center;
}

.faculty-name {
  color: #000000;
  font-size: 1.1rem;
  font-weight: 600;
  margin-bottom: 0.5rem;
  letter-spacing: 1px;
  text-transform: uppercase;
}

.faculty-position {
   color: #666666;
   font-size: 0.9rem;
   font-weight: normal;
   line-height: 1.4;
   letter-spacing: 0.3px;
   margin: 0;
 }

 .faculty-bio {
   margin-top: 12px;
   padding-top: 12px;
   border-top: 1px solid #e0e0e0;
 }

 .faculty-bio p {
   margin: 0;
   font-size: 15px;
   line-height: 1.7;
   color: #666;
   text-align: left;
 }
 
 /* 响应式设计 */
 @media (max-width: 768px) {
   .faculty-grid {
     grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
     gap: 2rem;
   }
   
   .faculty-photo img {
     width: 120px;
     height: 120px;
   }
   
   .faculty-title {
     font-size: 1.4rem;
     letter-spacing: 1px;
   }
   
   .faculty-name {
     font-size: 1rem;
   }
   
   .faculty-position {
     font-size: 0.8rem;
   }
   
   .faculty-bio {
     margin-top: 10px;
     padding-top: 10px;
   }
   
   .faculty-bio p {
     font-size: 14px;
     line-height: 1.6;
   }
   
   .professors-section {
     padding: 4rem 0;
   }
   
   .faculty-section {
     margin-bottom: 4rem;
   }
 }
 
 @media (max-width: 480px) {
   .faculty-grid {
     grid-template-columns: 1fr;
     gap: 1.5rem;
   }
   
   .faculty-photo img {
     width: 100px;
     height: 100px;
   }
   
   .faculty-title {
     font-size: 1.2rem;
   }
   
   .faculty-name {
     font-size: 0.9rem;
   }
   
   .faculty-position {
     font-size: 0.75rem;
   }
   
   .faculty-bio {
     margin-top: 8px;
     padding-top: 8px;
   }
   
   .faculty-bio p {
     font-size: 13px;
     line-height: 1.5;
   }
 }

/* 获奖查询样式 - 性冷淡风格 */
.query-section {
  padding: 4rem 0;
  background: #fafafa;
  position: relative;
}

.query-intro {
  text-align: center;
  max-width: 600px;
  margin: 0 auto;
}

.query-description {
  font-size: 1.2rem;
  color: #333333;
  margin-bottom: 1.5rem;
  font-weight: normal;
  letter-spacing: 0.3px;
}

.query-note {
  font-size: 0.95rem;
  color: #666666;
  margin-bottom: 3rem;
  font-weight: normal;
  letter-spacing: 0.2px;
  line-height: 1.6;
}

.query-button {
  display: inline-block;
  padding: 1.2rem 3rem;
  background: #333333;
  color: white;
  text-decoration: none;
  font-weight: normal;
  font-size: 0.9rem;
  transition: all 0.2s ease;
  letter-spacing: 0.5px;
  border: 1px solid #333333;
}

.query-button:hover {
  background: #555555;
  border-color: #555555;
  color: white;
}

/* 作品展示样式 - 性冷淡风格 */
.gallery-section {
  padding: 8rem 0;
  background: #ffffff;
  position: relative;
  overflow: auto;
}

.gallery-filters {
  display: flex;
  justify-content: center;
  gap: 0;
  margin-bottom: 5rem;
  border-bottom: 1px solid #f0f0f0;
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
}

.gallery-filters .filter-button {
  padding: 1.2rem 2rem;
  background: transparent;
  color: #999999;
  border: none;
  border-bottom: 2px solid transparent;
  cursor: pointer;
  transition: all 0.2s ease;
  font-weight: 400;
  font-size: 0.9rem;
  letter-spacing: 0.3px;
  border-radius: 0;
}

.gallery-filters .filter-button.active {
  color: #333333;
  border-bottom-color: #333333;
  background: transparent;
}

.gallery-filters .filter-button:hover {
  color: #666666;
  background: transparent;
}

.gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1px;
  max-width: 1000px;
  margin: 0 auto;
}

.gallery-item {
  position: relative;
  background: #fafafa;
  cursor: pointer;
  transition: all 0.2s ease;
  aspect-ratio: 4/3;
  overflow: hidden;
  border-radius: 0;
}

.gallery-item:hover {
  background: #f0f0f0;
  transform: none;
}

.gallery-item img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  opacity: 0.8;
  transition: opacity 0.2s ease;
}

.gallery-item:hover img {
  opacity: 0.6;
}

.gallery-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(255, 255, 255, 0.95);
  color: #333333;
  padding: 2rem;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  opacity: 0;
  transition: opacity 0.2s ease;
  transform: none;
}

.gallery-item:hover .gallery-overlay {
  opacity: 1;
}

.gallery-overlay h3 {
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
  font-weight: 400;
  letter-spacing: 0.3px;
}

.gallery-overlay p {
  font-size: 0.85rem;
  color: #666666;
  font-weight: 300;
  letter-spacing: 0.2px;
  opacity: 1;
}

/* 新闻动态样式 - 性冷淡风格 */
.news-section {
  padding: 8rem 0;
  background: #ffffff;
}

.news-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1px;
  max-width: 1200px;
  margin: 0 auto;
}

.news-card {
  background: #fafafa;
  border: 1px solid #f0f0f0;
  transition: all 0.2s ease;
  cursor: pointer;
}

.news-card:hover {
  background: #f5f5f5;
}

.news-card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
  opacity: 0.8;
  transition: opacity 0.2s ease;
}

.news-card:hover img {
  opacity: 0.6;
}

.news-content {
  padding: 2rem;
}

.news-category {
  display: inline-block;
  background: transparent;
  color: #666666;
  padding: 0.5rem 0;
  font-size: 0.75rem;
  margin-bottom: 1.5rem;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  font-weight: 400;
  border-bottom: 1px solid #e0e0e0;
}

.news-card h3 {
  color: #333333;
  margin-bottom: 1rem;
  font-size: 1.1rem;
  font-weight: 400;
  letter-spacing: 0.3px;
  line-height: 1.4;
}

.news-card p {
  color: #666666;
  line-height: 1.6;
  margin-bottom: 2rem;
  font-size: 0.9rem;
  font-weight: 300;
  letter-spacing: 0.2px;
}

.news-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-top: 1rem;
  border-top: 1px solid #f0f0f0;
}

.news-date {
  color: #999999;
  font-size: 0.8rem;
  font-weight: 300;
  letter-spacing: 0.2px;
}

.read-more {
  color: #333333;
  text-decoration: none;
  font-weight: normal;
  font-size: 0.8rem;
  letter-spacing: 0.3px;
  text-transform: uppercase;
  transition: color 0.2s ease;
}

.read-more:hover {
  color: #666666;
}

/* 联系我们样式 */
.contact-section {
  padding: 5rem 0;
  background-color: #171717;
}
.contact-section .section-title {
  color: white;
}
.contact-info h3{
  color: white;
  margin-bottom: 2rem;
  font-size: 1.5rem;
}

.contact-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 3rem;
}


.contact-qr h3 {
  color: white;
  margin-bottom: 2rem;
  font-size: 1.5rem;
}

.contact-item {
  margin-bottom: 1rem;
  color: #ccc;
}

.contact-item strong {
  color: white;
  display: inline-block;
  width: 60px;
}

.qr-code {
  text-align: center;
}

.qr-placeholder {
  width: 150px;
  height: 150px;
  background: #555;
  border: 2px dashed #777;
  display: flex;
  align-items: center;
  justify-content: center;
  margin: 0 auto;
  color: #999;
  border-radius: 10px;
}

/* 页脚样式 */
.footer {
  background-color: #171717;
  padding: 3rem 0 1rem;
  border-top: 1px solid #555;
}

.footer-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-bottom: 2rem;
}

.footer-section h3,
.footer-section h4 {
  color: white;
  margin-bottom: 1rem;
}

.footer-section p,
.footer-section li {
  color: #ccc;
  line-height: 1.6;
}

.footer-section ul {
  list-style: none;
}

.footer-section a {
  color: #ccc;
  text-decoration: none;
  transition: color 0.3s ease;
}

.footer-section a:hover {
  color: #2f424e;
}

.footer-bottom {
  text-align: center;
  padding-top: 2rem;
  border-top: 1px solid #555;
  color: #999;
}

/* 返回顶部按钮 */
.back-to-top {
  position: fixed;
  bottom: 2rem;
  right: 2rem;
  width: 50px;
  height: 50px;
  background: #2f424e;
  color: white;
  border: none;
  border-radius: 50%;
  cursor: pointer;
  font-size: 1.2rem;
  transition: all 0.3s ease;
  z-index: 1000;
}

.back-to-top:hover {
  background: #1a3d1a;
  transform: translateY(-2px);
}

/* 模态框样式 */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.8);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2000;
}

.modal-content {
  background: #2a2a2a;
  border-radius: 10px;
  max-width: 90vw;
  max-height: 90vh;
  overflow: auto;
  position: relative;
}

.modal-close {
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: none;
  border: none;
  color: white;
  font-size: 2rem;
  cursor: pointer;
  z-index: 1;
}

.modal-content img {
  width: 100%;
  max-width: 600px;
  height: auto;
  display: block;
}

.modal-info {
  padding: 2rem;
  color: white;
}

.modal-info h3 {
  color: #2f424e;
  margin-bottom: 1rem;
}

.modal-info p {
  margin-bottom: 0.5rem;
  line-height: 1.6;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .nav-menu {
    position: fixed;
    left: -100%;
    top: 70px;
    flex-direction: column;
    background-color: #404040;
    width: 100vw;
    text-align: center;
    transition: 0.3s;
    box-shadow: 0 10px 27px rgba(0, 0, 0, 0.05);
    padding: 2rem 0;
    margin: 0;
    box-sizing: border-box;
  }

  .nav-menu.active {
    left: 0;
  }

  .hamburger {
    display: flex;
  }

  .nav-container {
    padding: 0 1rem;
  }

  .professors-info {
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  }

  .gallery-grid {
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  }

  .news-grid {
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  }

  .hamburger.active .bar:nth-child(2) {
    opacity: 0;
  }

  .hamburger.active .bar:nth-child(1) {
    transform: translateY(8px) rotate(45deg);
  }

  .hamburger.active .bar:nth-child(3) {
    transform: translateY(-8px) rotate(-45deg);
  }

  .slide-text h1 {
    font-size: 2rem;
  }

  .slide-text p {
    font-size: 1rem;
  }

  .section-title {
    font-size: 2rem;
    color:black;
  }

  .query-input {
    flex-direction: column;
  }

  .gallery-filters {
    justify-content: center;
  }

  .filter-button {
    font-size: 0.9rem;
    padding: 0.6rem 1rem;
  }

  .gallery-grid {
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  }

  .news-grid {
    grid-template-columns: 1fr;
  }

  .contact-grid {
    grid-template-columns: 1fr;
  }

  .footer-content {
    grid-template-columns: 1fr;
    text-align: center;
  }

  .modal-content {
    margin: 1rem;
  }

  .modal-info {
    padding: 1rem;
  }
}

@media (max-width: 480px) {
  .nav-container {
    padding: 0 1rem;
  }

  .slide-text h1 {
    font-size: 1.5rem;
  }

  .section-title {
    font-size: 1.8rem;
    color: black;
  }

  .about-grid {
    grid-template-columns: 1fr;
  }

  .gallery-grid {
    grid-template-columns: 1fr;
  }

  .back-to-top {
    bottom: 1rem;
    right: 1rem;
    width: 45px;
    height: 45px;
  }
}

@media (min-width: 769px) {
  .carousel-section {
    height: 576px;
  }
}
</style>