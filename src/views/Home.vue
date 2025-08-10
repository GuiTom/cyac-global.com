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
            <a href="#home" class="nav-link" @click="closeMenu">首页</a>
          </li>
          <li class="nav-item">
            <a href="#about" class="nav-link" @click="closeMenu">比赛介绍</a>
          </li>
          <li class="nav-item">
            <a href="#query" class="nav-link" @click="closeMenu">获奖查询</a>
          </li>
          <li class="nav-item">
            <a href="#gallery" class="nav-link" @click="closeMenu">优秀作品</a>
          </li>
          <li class="nav-item">
            <a href="#news" class="nav-link" @click="closeMenu">动态发布</a>
          </li>
          <li class="nav-item">
            <a href="#contact" class="nav-link" @click="closeMenu">联系我们</a>
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
            <div class="slide-overlay"></div>
            <div class="slide-text">
              <h1>{{ slide.title }}</h1>
              <p>{{ slide.description }}</p>
              <a v-if="slide.link" :href="slide.link" class="cta-button">了解更多</a>
            </div>
          </div>
        </swiper-slide>
      </swiper>
    </section>

    <!-- 比赛介绍 -->
    <section id="about" class="about-section">
      <div class="container">
        <h2 class="section-title">比赛介绍</h2>
        <div class="about-grid">
          <div class="about-card">
            <h3>起源历史</h3>
            <p>CYAC全球青少年艺术大赛始于2018年，致力于为全球青少年艺术家提供展示才华的平台。</p>
          </div>
          <div class="about-card">
            <h3>主办方介绍</h3>
            <p>由国际知名艺术学院联合主办，汇聚全球顶尖艺术教育资源。</p>
          </div>
          <div class="about-card">
            <h3>教授团队</h3>
            <p>评审团由来自世界各地的知名艺术教授和专业人士组成。</p>
          </div>
        </div>
      </div>
    </section>

    <!-- 获奖查询 -->
    <section id="query" class="query-section">
      <div class="container">
        <h2 class="section-title">获奖查询</h2>
        <div class="query-form">
          <div class="query-tabs">
            <button 
              class="tab-button" 
              :class="{ active: queryType === 'number' }"
              @click="queryType = 'number'"
            >
              按奖项编号查询
            </button>
            <button 
              class="tab-button" 
              :class="{ active: queryType === 'name' }"
              @click="queryType = 'name'"
            >
              按姓名查询
            </button>
          </div>
          <div class="query-input">
            <input 
              v-if="queryType === 'number'"
              v-model="queryNumber"
              type="text" 
              placeholder="请输入奖项编号"
              class="input-field"
            >
            <input 
              v-if="queryType === 'name'"
              v-model="queryName"
              type="text" 
              placeholder="请输入获奖者姓名"
              class="input-field"
            >
            <button @click="searchAward" class="search-button">查询</button>
          </div>
          <div v-if="queryResult" class="query-result">
            <h3>查询结果</h3>
            <div class="result-card">
              <p><strong>获奖者：</strong>{{ queryResult.name }}</p>
              <p><strong>奖项：</strong>{{ queryResult.award }}</p>
              <p><strong>编号：</strong>{{ queryResult.number }}</p>
              <p><strong>年份：</strong>{{ queryResult.year }}</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 优秀作品 -->
    <section id="gallery" class="gallery-section">
      <div class="container">
        <h2 class="section-title">优秀选手作品</h2>
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
            @click="openModal(work)"
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
        <h2 class="section-title">动态发布</h2>
        <div class="news-grid">
          <article v-for="news in newsItems" :key="news.id" class="news-card">
            <img :src="news.image" :alt="news.title">
            <div class="news-content">
              <span class="news-category">{{ news.category }}</span>
              <h3>{{ news.title }}</h3>
              <p>{{ news.excerpt }}</p>
              <div class="news-meta">
                <span class="news-date">{{ news.date }}</span>
                <a href="#" class="read-more">阅读更多</a>
              </div>
            </div>
          </article>
        </div>
      </div>
    </section>

    <!-- 联系我们 -->
    <section id="contact" class="contact-section">
      <div class="container">
        <h2 class="section-title">联系我们</h2>
        <div class="contact-grid">
          <div class="contact-info">
            <h3>联系方式</h3>
            <div class="contact-item">
              <strong>邮箱：</strong>
              <span>info@cyac-global.com</span>
            </div>
            <div class="contact-item">
              <strong>电话：</strong>
              <span>+86 400-123-4567</span>
            </div>
            <div class="contact-item">
              <strong>地址：</strong>
              <span>北京市朝阳区艺术大道123号</span>
            </div>
          </div>
          <div class="contact-qr">
            <h3>扫码关注</h3>
            <div class="qr-code">
              <div class="qr-placeholder">微信二维码</div>
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
            <p>全球青少年艺术大赛官方网站</p>
          </div>
          <div class="footer-section">
            <h4>快速链接</h4>
            <ul>
              <li><a href="#about">比赛介绍</a></li>
              <li><a href="#query">获奖查询</a></li>
              <li><a href="#gallery">优秀作品</a></li>
              <li><a href="#news">动态发布</a></li>
            </ul>
          </div>
          <div class="footer-section">
            <h4>联系信息</h4>
            <p>邮箱：info@cyac-global.com</p>
            <p>电话：+86 400-123-4567</p>
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
          <p><strong>作者：</strong>{{ modalWork.author }}</p>
          <p><strong>年龄组：</strong>{{ modalWork.category }}</p>
          <p><strong>描述：</strong>{{ modalWork.description }}</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import { ref, onMounted, onUnmounted, computed } from 'vue'
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
    // 响应式数据
    const isMenuOpen = ref(false)
    const queryType = ref('number')
    const queryNumber = ref('')
    const queryName = ref('')
    const queryResult = ref(null)
    const activeCategory = ref('全部')
    const showBackToTop = ref(false)
    const modalWork = ref(null)
    const swiperContainer = ref(null)

    // Swiper模块
    const modules = [Navigation, Pagination, Autoplay]

    // 轮播图数据
    const carouselSlides = ref([
      {
        title: 'CYAC Global Youth Art Competition',
        description: '激发创意，展现才华，连接世界',
        link: '#about'
      },
      {
        title: '全球青少年艺术盛典',
        description: '汇聚世界各地的青少年艺术家',
        link: '#gallery'
      },
      {
        title: '专业评审，权威认证',
        description: '国际知名艺术教授专业评审',
        link: '#query'
      }
    ])

    // 作品分类
    const categories = ref(['全部', '6-8岁', '9-12岁', '13-15岁', '16-18岁'])

    // 作品数据
    const galleryWorks = ref([
      {
        id: 1,
        title: '梦想的色彩',
        author: '张小明',
        category: '6-8岁',
        image: '/images/placeholder-work-1.svg',
        description: '这幅作品表达了孩子对未来的美好憧憬'
      },
      {
        id: 2,
        title: '城市印象',
        author: '李小红',
        category: '9-12岁',
        image: '/images/placeholder-work-2.svg',
        description: '通过独特的视角展现现代城市的魅力'
      },
      {
        id: 3,
        title: '自然之美',
        author: '王小华',
        category: '13-15岁',
        image: '/images/placeholder-work-3.svg',
        description: '细腻的笔触描绘了大自然的壮美景色'
      },
      {
        id: 4,
        title: '抽象思维',
        author: '赵小刚',
        category: '16-18岁',
        image: '/images/placeholder-work-4.svg',
        description: '运用抽象手法表达内心的情感世界'
      }
    ])

    // 新闻数据
    const newsItems = ref([
      {
        id: 1,
        title: '2024年度CYAC大赛正式启动',
        excerpt: '全球青少年艺术大赛2024年度比赛正式开始报名，欢迎各地青少年踊跃参与。',
        category: '比赛信息',
        date: '2024-01-15',
        image: '/images/placeholder-news-1.svg'
      },
      {
        id: 2,
        title: '国际艺术交流展览即将举办',
        excerpt: '为促进国际青少年艺术交流，我们将举办大型艺术作品展览活动。',
        category: '展览信息',
        date: '2024-01-10',
        image: '/images/placeholder-news-2.svg'
      },
      {
        id: 3,
        title: '艺术游学项目开放申请',
        excerpt: '面向获奖选手开放的国际艺术游学项目现已开始接受申请。',
        category: '游学信息',
        date: '2024-01-05',
        image: '/images/placeholder-news-3.svg'
      }
    ])

    // 计算属性
    const filteredWorks = computed(() => {
      if (activeCategory.value === '全部') {
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

    const searchAward = () => {
      // 模拟查询结果
      if (queryType.value === 'number' && queryNumber.value) {
        queryResult.value = {
          name: '张三',
          award: '金奖',
          number: queryNumber.value,
          year: '2023'
        }
      } else if (queryType.value === 'name' && queryName.value) {
        queryResult.value = {
          name: queryName.value,
          award: '银奖',
          number: 'CYAC2023001',
          year: '2023'
        }
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
      queryType,
      queryNumber,
      queryName,
      queryResult,
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
      searchAward,
      filterGallery,
      openModal,
      closeModal,
      scrollToTop
    }
  }
}
</script>

<style scoped>
/* 导航栏样式 */
.navbar {
  background-color: #404040;
  padding: 1rem 0;
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
  font-weight: 500;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: #2d5a27;
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
  height: 100vh;
  position: relative;
  margin-top: 80px;
}

.swiper-container {
  width: 100%;
  height: 100%;
}

.swiper-slide {
  background: linear-gradient(135deg, #2d5a27 0%, #1a3d1a 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
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
  background: #2d5a27;
  transform: scale(1.2);
}

.slide-content {
  text-align: center;
  color: white;
  z-index: 2;
}

.slide-overlay {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(0, 0, 0, 0.3);
}

.slide-text h1 {
  font-size: 3rem;
  margin-bottom: 1rem;
  font-weight: bold;
}

.slide-text p {
  font-size: 1.2rem;
  margin-bottom: 2rem;
  opacity: 0.9;
}

.cta-button {
  display: inline-block;
  padding: 12px 30px;
  background-color: #2d5a27;
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
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.section-title {
  font-size: 2.5rem;
  text-align: center;
  margin-bottom: 3rem;
  color: #fff;
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
  padding: 2rem;
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
  color: #2d5a27;
  margin-bottom: 1rem;
  font-size: 1.3rem;
}

.about-card p {
  color: #666;
  line-height: 1.6;
}

/* 查询系统样式 */
.query-section {
  padding: 5rem 0;
  background-color: #1a1a1a;
}

.query-form {
  max-width: 600px;
  margin: 0 auto;
  background: #2a2a2a;
  padding: 2rem;
  border-radius: 10px;
}

.query-tabs {
  display: flex;
  margin-bottom: 2rem;
  border-radius: 5px;
  overflow: hidden;
}

.tab-button {
  flex: 1;
  padding: 1rem;
  background: #404040;
  color: #ccc;
  border: none;
  cursor: pointer;
  transition: all 0.3s ease;
}

.tab-button.active {
  background: #2d5a27;
  color: white;
}

.query-input {
  display: flex;
  gap: 1rem;
  margin-bottom: 2rem;
}

.input-field {
  flex: 1;
  padding: 1rem;
  border: 1px solid #555;
  border-radius: 5px;
  background: #333;
  color: white;
  font-size: 1rem;
}

.input-field::placeholder {
  color: #999;
}

.search-button {
  padding: 1rem 2rem;
  background: #2d5a27;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
  transition: background 0.3s ease;
}

.search-button:hover {
  background: #1a3d1a;
}

.query-result {
  margin-top: 2rem;
}

.query-result h3 {
  color: #2d5a27;
  margin-bottom: 1rem;
}

.result-card {
  background: #333;
  padding: 1.5rem;
  border-radius: 5px;
  border-left: 4px solid #2d5a27;
}

.result-card p {
  color: #ccc;
  margin-bottom: 0.5rem;
}

.result-card strong {
  color: white;
}

/* 作品展示样式 */
.gallery-section {
  padding: 5rem 0;
  background-color: #1a1a1a;
}

.gallery-filters {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin-bottom: 3rem;
  flex-wrap: wrap;
}

.filter-button {
  padding: 0.8rem 1.5rem;
  background: #404040;
  color: #ccc;
  border: none;
  border-radius: 25px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.filter-button.active,
.filter-button:hover {
  background: #2d5a27;
  color: white;
}

.gallery-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
}

.gallery-item {
  position: relative;
  border-radius: 10px;
  overflow: hidden;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.gallery-item:hover {
  transform: scale(1.05);
}

.gallery-item img {
  width: 100%;
  height: 250px;
  object-fit: cover;
}

.gallery-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  background: linear-gradient(transparent, rgba(0, 0, 0, 0.8));
  color: white;
  padding: 2rem 1rem 1rem;
  transform: translateY(100%);
  transition: transform 0.3s ease;
}

.gallery-item:hover .gallery-overlay {
  transform: translateY(0);
}

.gallery-overlay h3 {
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
}

.gallery-overlay p {
  opacity: 0.8;
  font-size: 0.9rem;
}

/* 新闻动态样式 */
.news-section {
  padding: 5rem 0;
  background-color: #1a1a1a;
}

.news-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
  gap: 2rem;
}

.news-card {
  background: #2a2a2a;
  border-radius: 10px;
  overflow: hidden;
  transition: transform 0.3s ease;
}

.news-card:hover {
  transform: translateY(-5px);
}

.news-card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.news-content {
  padding: 1.5rem;
}

.news-category {
  display: inline-block;
  background: #2d5a27;
  color: white;
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.8rem;
  margin-bottom: 1rem;
}

.news-card h3 {
  color: white;
  margin-bottom: 1rem;
  font-size: 1.2rem;
}

.news-card p {
  color: #ccc;
  line-height: 1.6;
  margin-bottom: 1rem;
}

.news-meta {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.news-date {
  color: #999;
  font-size: 0.9rem;
}

.read-more {
  color: #2d5a27;
  text-decoration: none;
  font-weight: bold;
  transition: color 0.3s ease;
}

.read-more:hover {
  color: #1a3d1a;
}

/* 联系我们样式 */
.contact-section {
  padding: 5rem 0;
  background-color: #404040;
}

.contact-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 3rem;
}

.contact-info h3,
.contact-qr h3 {
  color: #2d5a27;
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
  background-color: #404040;
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
  color: #2d5a27;
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
  color: #2d5a27;
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
  background: #2d5a27;
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
  color: #2d5a27;
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
    top: 80px;
    flex-direction: column;
    background-color: #404040;
    width: 100%;
    text-align: center;
    transition: 0.3s;
    box-shadow: 0 10px 27px rgba(0, 0, 0, 0.05);
    padding: 2rem 0;
  }

  .nav-menu.active {
    left: 0;
  }

  .hamburger {
    display: flex;
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
  }

  .container {
    padding: 0 1rem;
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
</style>