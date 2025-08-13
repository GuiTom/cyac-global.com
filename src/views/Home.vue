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
            <a href="#home" class="nav-link" @click="handleNavClick">首页</a>
          </li>
          <li class="nav-item">
            <a href="#about" class="nav-link" @click="handleNavClick">比赛介绍</a>
          </li>
          <li class="nav-item">
            <a href="#query" class="nav-link" @click="handleNavClick">获奖查询</a>
          </li>
          <li class="nav-item">
            <a href="#gallery" class="nav-link" @click="handleNavClick">优秀作品</a>
          </li>
          <li class="nav-item">
            <a href="#news" class="nav-link" @click="handleNavClick">动态发布</a>
          </li>
          <li class="nav-item">
            <a href="#contact" class="nav-link" @click="handleNavClick">联系我们</a>
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
          <div class="query-filter">
            <span class="filter-label">查询类型：</span>
            <div class="filter-buttons">
              <button 
                class="filter-button" 
                :class="{ active: awardFilter === 'finalist' }"
                @click="awardFilter = 'finalist'"
              >
                入围
              </button>
              <button 
                class="filter-button" 
                :class="{ active: awardFilter === 'winner' }"
                @click="awardFilter = 'winner'"
              >
                获奖
              </button>
            </div>
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
              <p><strong>状态：</strong>{{ queryResult.status }}</p>
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
    const awardFilter = ref('winner') // 默认选择获奖
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
        image: './images/placeholder-work-1.svg',
        description: '这幅作品表达了孩子对未来的美好憧憬'
      },
      {
        id: 2,
        title: '城市印象',
        author: '李小红',
        category: '9-12岁',
        image: './images/placeholder-work-2.svg',
        description: '通过独特的视角展现现代城市的魅力'
      },
      {
        id: 3,
        title: '自然之美',
        author: '王小华',
        category: '13-15岁',
        image: './images/placeholder-work-3.svg',
        description: '细腻的笔触描绘了大自然的壮美景色'
      },
      {
        id: 4,
        title: '抽象思维',
        author: '赵小刚',
        category: '16-18岁',
        image: './images/placeholder-work-4.svg',
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
        image: './images/placeholder-news-1.svg'
      },
      {
        id: 2,
        title: '国际艺术交流展览即将举办',
        excerpt: '为促进国际青少年艺术交流，我们将举办大型艺术作品展览活动。',
        category: '展览信息',
        date: '2024-01-10',
        image: './images/placeholder-news-2.svg'
      },
      {
        id: 3,
        title: '艺术游学项目开放申请',
        excerpt: '面向获奖选手开放的国际艺术游学项目现已开始接受申请。',
        category: '游学信息',
        date: '2024-01-05',
        image: './images/placeholder-news-3.svg'
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

    const handleNavClick = (event) => {
      const targetId = event.currentTarget.getAttribute('href')
      const targetElement = document.querySelector(targetId)
      if (targetElement) {
        event.preventDefault()
        targetElement.scrollIntoView({ behavior: 'smooth' })
        closeMenu()
      }
    }

    const searchAward = () => {
      // 模拟查询结果
      if (queryType.value === 'number' && queryNumber.value) {
        const status = awardFilter.value === 'winner' ? '获奖' : '入围'
        const award = awardFilter.value === 'winner' ? '金奖' : '入围奖'
        queryResult.value = {
          name: '张三',
          status: status,
          award: award,
          number: queryNumber.value,
          year: '2023'
        }
      } else if (queryType.value === 'name' && queryName.value) {
        const status = awardFilter.value === 'winner' ? '获奖' : '入围'
        const award = awardFilter.value === 'winner' ? '银奖' : '入围奖'
        queryResult.value = {
          name: queryName.value,
          status: status,
          award: award,
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
      awardFilter,
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
  font-weight: 500;
  transition: color 0.3s ease;
}

.nav-link:hover {
  color: #2f424e;
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
  background-color: #2f424e;
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
  background: #2f424e;
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
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

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
  color: #2f424e;
  margin-bottom: 1rem;
  font-size: 1.3rem;
}

.about-card p {
  color: #666;
  line-height: 1.6;
}

/* 获奖查询样式 - 性冷淡风格 */
.query-section {
  padding: 8rem 0;
  background: #fafafa;
  position: relative;
}

.query-form {
  background: #ffffff;
  padding: 4rem;
  border-radius: 2px;
  box-shadow: 0 1px 3px rgba(0,0,0,0.05);
  border: 1px solid #f0f0f0;
  max-width: 800px;
  margin: 0 auto;
}

.query-tabs {
  display: flex;
  margin-bottom: 3rem;
  border-bottom: 1px solid #e8e8e8;
}

.tab-button {
  flex: 1;
  padding: 1.5rem 0;
  background: transparent;
  color: #999999;
  border: none;
  cursor: pointer;
  transition: all 0.2s ease;
  font-weight: 400;
  font-size: 0.95rem;
  letter-spacing: 0.5px;
  border-bottom: 2px solid transparent;
}

.tab-button.active {
  color: #333333;
  border-bottom-color: #333333;
}

.tab-button:hover {
  color: #666666;
}

.query-filter {
  display: flex;
  align-items: center;
  gap: 2rem;
  margin-bottom: 3rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #f0f0f0;
}

.filter-label {
  font-weight: 400;
  color: #666666;
  font-size: 0.9rem;
  letter-spacing: 0.3px;
}

.filter-buttons {
  display: flex;
  gap: 1rem;
}

.filter-button {
  padding: 0.8rem 1.5rem;
  background: #ffffff;
  color: #999999;
  border: 1px solid #e8e8e8;
  border-radius: 0;
  cursor: pointer;
  transition: all 0.2s ease;
  font-weight: 400;
  font-size: 0.85rem;
  letter-spacing: 0.3px;
}

.filter-button.active {
  background: #333333;
  color: #ffffff;
  border-color: #333333;
}

.filter-button:hover {
  background: #f8f8f8;
  color: #666666;
}

.query-input {
  display: flex;
  gap: 0;
  align-items: stretch;
  margin-bottom: 3rem;
}

.input-field {
  flex: 1;
  padding: 1.2rem 1.5rem;
  border: 1px solid #e8e8e8;
  border-right: none;
  border-radius: 0;
  font-size: 0.9rem;
  transition: all 0.2s ease;
  background: #ffffff;
  color: #333333;
  font-weight: 300;
}

.input-field:focus {
  outline: none;
  border-color: #cccccc;
  background: #fafafa;
}

.input-field::placeholder {
  color: #cccccc;
  font-weight: 300;
}

.search-button {
  padding: 1.2rem 2.5rem;
  background: #333333;
  color: white;
  border: 1px solid #333333;
  border-radius: 0;
  cursor: pointer;
  font-weight: 400;
  font-size: 0.85rem;
  transition: all 0.2s ease;
  letter-spacing: 0.5px;
  min-width: 100px;
}

.search-button:hover {
  background: #555555;
  border-color: #555555;
}

.query-result {
  margin-top: 3rem;
  padding: 2.5rem 0;
  border-top: 1px solid #f0f0f0;
}

.query-result h3 {
  color: #333333;
  margin-bottom: 2rem;
  font-size: 1.1rem;
  font-weight: 400;
  letter-spacing: 0.3px;
}

.result-card {
  background: #fafafa;
  padding: 2rem;
  border: none;
  border-radius: 0;
}

.result-card p {
  margin-bottom: 1rem;
  color: #666666;
  line-height: 1.8;
  font-size: 0.9rem;
  font-weight: 300;
}

.result-card strong {
  color: #333333;
  font-weight: 400;
  margin-right: 1rem;
  display: inline-block;
  min-width: 80px;
}

/* 作品展示样式 - 性冷淡风格 */
.gallery-section {
  padding: 8rem 0;
  background: #ffffff;
  position: relative;
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
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
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
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
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
  font-weight: 400;
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
    color:black;
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