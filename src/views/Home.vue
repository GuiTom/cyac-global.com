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
            <a href="#professors" class="nav-link" @click="handleNavClick">教授团队</a>
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
            <img :src="slide.image" :alt="slide.title" class="slide-image" />
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
            <h3>展览介绍</h3>
            <p>艺术是全球通用的语言！在人类社会长长的历史进程中，因为有艺术的介入，人类才拥有万紫千红的美好生活，才能拥抱流光溢彩的大千世界。</p>
            <p>本次“剑桥青少年艺术大赛”，旨在激发青少年创作的热情。本次展览将先后在国内的美术馆和英国剑桥校区举办。</p>
            <p>借此，中英双方可以友好交流，相互启发，共同追求艺术创作之路！</p>
          </div>
          <div class="about-card">
            <h3>主办方学校介绍</h3>
            <p class="school-name">CSVPA 是 （Cambridge School of Visual & Performing Arts）的缩写。</p>
            
            <div class="school-section">
              <h4>学校概况</h4>
              <p>英国顶级艺术院校，位于英国剑桥市，隶属于剑桥教育集团（Cambridge Education Group）。</p>
            </div>
            
            <div class="school-section">
              <h4>升学表现</h4>
              <ul class="achievement-list">
                <li>艺术设计预科生升入伦敦艺术大学（UAL）的比例超过65%</li>
                <li>其他顶尖去向包括皇家艺术学院、格拉斯哥艺术学院、帕森斯设计学院等</li>
              </ul>
            </div>
            
            <div class="school-section">
              <h4>行业合作</h4>
              <p>与伦艺、皇家戏剧学院（RADA）、赫斯特集团（旗下《ELLE》《Harper's Bazaar》等）深度合作，提供奖学金及实习机会。</p>
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
                <img src="/src/assets/proferssor/1.jpg" alt="梁卫洲教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">梁卫洲</h3>
                <p class="faculty-position">当代著名大家、摄影家</p>
              </div>
            </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/2.jpg" alt="孙燕平教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">孙燕平</h3>
                <p class="faculty-position">当代知名书法家</p>
              </div>
            </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/3.jpg" alt="倪士华教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">倪士华</h3>
                <p class="faculty-position">现任宁夏美术家协会副主席</p>
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
                <img src="/src/assets/proferssor/foreign/1.jpg" alt="Edward Dimsdale教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">EDWARD DIMSDALE</h3>
                <p class="faculty-position">摄影家、作家</p>
              </div>
            </div>
            <div class="faculty-member">
              <div class="faculty-photo">
                <img src="/src/assets/proferssor/foreign/2.jpg" alt="Holly Fulton教授" />
              </div>
              <div class="faculty-info">
                <h3 class="faculty-name">HOLLY FULTON</h3>
                <p class="faculty-position">时尚品牌霍莉-富尔顿创始人</p>
              </div>
            </div>
            <div class="faculty-member">
               <div class="faculty-photo">
                 <img src="/src/assets/proferssor/foreign/3.jpg" alt="Karin Askham校长" />
               </div>
               <div class="faculty-info">
                 <h3 class="faculty-name">KARIN ASKHAM</h3>
                 <p class="faculty-position">CSVPA 校长</p>
               </div>
             </div>
             <div class="faculty-member">
               <div class="faculty-photo">
                 <img src="/src/assets/proferssor/foreign/5.jpg" alt="Neil Ayling教授" />
               </div>
               <div class="faculty-info">
                 <h3 class="faculty-name">NEIL AYLING</h3>
                 <p class="faculty-position">艺术家</p>
               </div>
             </div>
          </div>
        </div>
      </div>
    </section>

    <!-- 获奖查询 -->
    <section id="query" class="query-section">
      <div class="container">
        <h2 class="section-title">获奖查询</h2>
        <div class="query-intro">
          <p class="query-description">输入奖项编号或获奖者姓名查询获奖信息</p>
          <p class="query-note">支持按编号查询和按姓名查询，可查看获奖证书和相关信息</p>
          <router-link to="/query" class="query-button">进入查询页面</router-link>
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
                <a :href="news.url" target="_blank" class="read-more">阅读更多</a>
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
        image: './top_coursels/1.jpg',
        link: '#about'
      },
      {
        title: '全球青少年艺术盛典',
        description: '汇聚世界各地的青少年艺术家',
        image: './top_coursels/2.jpg',
        link: '#gallery'
      },
      {
        title: '专业评审，权威认证',
        description: '国际知名艺术教授专业评审',
        image: './top_coursels/3.jpg',
        link: '#query'
      },
      {
        title: '艺术创作之旅',
        description: '开启你的艺术创作之旅',
        image: './top_coursels/4.jpg',
        link: '#about'
      },
      {
        title: '国际艺术交流',
        description: '与世界各地的艺术家交流学习',
        image: './top_coursels/5.jpg',
        link: '#gallery'
      }
    ])

    // 作品分类
    const categories = ref(['全部', '少儿组', '少年组', '青年组'])

    // 作品数据
    const galleryWorks = ref([
      {
        id: 1,
        title: '梦想的色彩',
        author: '张小明',
        category: '少儿组',
        image: './works/children/1.jpg',
        description: '这幅作品表达了孩子对未来的美好憧憬'
      },
      {
        id: 2,
        title: '城市印象',
        author: '李小红',
        category: '少儿组',
        image: './works/children/2.jpg',
        description: '通过独特的视角展现现代城市的魅力'
      },
      {
        id: 3,
        title: '自然之美',
        author: '王小华',
        category: '少年组',
        image: './works/youth/1.jpg',
        description: '细腻的笔触描绘了大自然的壮美景色'
      },
      {
        id: 4,
        title: '抽象思维',
        author: '赵小刚',
        category: '少年组',
        image: './works/youth/2.jpg',
        description: '运用抽象手法表达内心的情感世界'
      },
      {
        id: 5,
        title: '青春记忆',
        author: '陈小美',
        category: '青年组',
        image: './works/adult/1.jpg',
        description: '记录青春年华的美好时光，画面温馨感人'
      },
      {
        id: 6,
        title: '未来世界',
        author: '刘小强',
        category: '青年组',
        image: './works/adult/2.jpg',
        description: '想象中的未来世界，充满科技感和创新思维'
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
        title: '王小慧展览，圆满闭幕',
        excerpt: '为促进国际青少年艺术交流，王小慧举办了大型艺术作品展览活动。',
        category: '展览信息',
        date: '2024-01-10',
        image: './images/placeholder-news-2.svg',
        url:'https://mp.weixin.qq.com/s/9OaX_DLwBJCAXbX7yEOgyg'
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
  font-weight: 500;
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
  font-weight: 600;
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
  font-weight: 400;
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
   font-weight: 300;
   line-height: 1.4;
   letter-spacing: 0.3px;
   margin: 0;
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
   
   .professors-section {
     padding: 4rem 0;
   }
   
   .faculty-section {
     margin-bottom: 4rem;
   }
 }
 
 @media (max-width: 480px) {
   .faculty-grid {
     grid-template-columns: 1fr 1fr;
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
  font-weight: 400;
  letter-spacing: 0.3px;
}

.query-note {
  font-size: 0.95rem;
  color: #666666;
  margin-bottom: 3rem;
  font-weight: 300;
  letter-spacing: 0.2px;
  line-height: 1.6;
}

.query-button {
  display: inline-block;
  padding: 1.2rem 3rem;
  background: #333333;
  color: white;
  text-decoration: none;
  font-weight: 400;
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