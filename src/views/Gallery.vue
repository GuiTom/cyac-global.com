<template>
  <div class="gallery-page">
    <!-- 导航栏 -->
    <nav class="navbar">
      <div class="container">
        <div class="nav-brand">
          <router-link to="/" class="brand-link">CYAC Global</router-link>
        </div>
        <div class="nav-links">
          <router-link to="/" class="nav-link">Back to Home</router-link>
        </div>
      </div>
    </nav>

    <!-- 页面标题 -->
    <section class="page-header">
      <div class="container">
        <h1 class="page-title">Works Gallery</h1>
        <p class="page-description">3D Display of Excellent Works</p>
      </div>
    </section>

    <!-- 3D画廊 -->
    <section class="gallery-3d-section">
      <div class="gallery-3d-container">
        <div class="gallery-3d" ref="gallery3d">
          <div 
            v-for="(work, index) in galleryWorks" 
            :key="work.id"
            class="gallery-3d-item"
            :style="getItemStyle(index)"
            @click="selectWork(index)"
          >
            <div class="work-frame">
              <img :src="work.image" :alt="work.title" />
              <div class="work-info">
                <h3>{{ work.title }}</h3>
                <p>{{ work.author }}</p>
              </div>
            </div>
          </div>
        </div>
        
        <!-- 控制按钮 -->
        <div class="gallery-controls">
          <button @click="rotateLeft" class="control-btn">‹</button>
          <button @click="rotateRight" class="control-btn">›</button>
        </div>
        
        <!-- 作品详情 -->
        <div v-if="selectedWork" class="work-details">
          <div class="work-detail-card">
            <img :src="selectedWork.image" :alt="selectedWork.title" class="detail-image" />
            <div class="detail-info">
              <h2>{{ selectedWork.title }}</h2>
              <p><strong>Author:</strong>{{ selectedWork.author }}</p>
              <p><strong>Age Group:</strong>{{ selectedWork.category }}</p>
              <p><strong>Description:</strong>{{ selectedWork.description }}</p>
            </div>
            <button @click="closeDetails" class="close-btn">×</button>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
import { ref, onMounted, computed } from 'vue'

// 导入图片资源
import work1 from '/works/children/1.jpg'
import work2 from '/works/children/2.jpg'
import work3 from '/works/youth/1.jpg'
import work4 from '/works/youth/2.jpg'
import work5 from '/works/adult/1.jpg'
import work6 from '/works/adult/2.jpg'

export default {
  name: 'Gallery',
  setup() {
    const currentRotation = ref(0)
    const selectedWork = ref(null)
    const gallery3d = ref(null)
    
    // 作品数据
    const galleryWorks = ref([
      {
        id: 1,
        title: 'Colors of Dreams',
        author: 'Zhang Xiaoming',
        category: 'Children Group',
        image: work1,
        description: 'This work expresses children\'s beautiful aspirations for the future, using vibrant colors to depict the dream world in their hearts.'
      },
      {
        id: 2,
        title: 'City Impressions',
        author: 'Li Xiaohong',
        category: 'Children Group',
        image: work2,
        description: 'Shows the charm of modern cities through a unique perspective, with smooth lines and innovative composition.'
      },
      {
        id: 3,
        title: 'Beauty of Nature',
        author: 'Wang Xiaohua',
        category: 'Youth Group',
        image: work3,
        description: 'Delicate brushstrokes depict the magnificent scenery of nature, showing the author\'s deep understanding of nature.'
      },
      {
        id: 4,
        title: 'Abstract Thinking',
        author: 'Zhao Xiaogang',
        category: 'Youth Group',
        image: work4,
        description: 'Uses abstract techniques to express the inner emotional world, with unique color combinations and rich creativity.'
      },
      {
        id: 5,
        title: 'Memories of Youth',
        author: 'Chen Xiaomei',
        category: 'Young Adult Group',
        image: work5,
        description: 'Records the beautiful moments of youth, with warm and touching scenes and skillful techniques.'
      },
      {
        id: 6,
        title: 'Future World',
        author: 'Liu Xiaoqiang',
        category: 'Young Adult Group',
        image: work6,
        description: 'An imagined future world full of technology and innovative thinking, showcasing the unlimited imagination of young people.'
      }
    ])
    
    // 计算每个作品的3D位置
    const getItemStyle = (index) => {
      const totalItems = galleryWorks.value.length
      const angle = (360 / totalItems) * index + currentRotation.value
      const radius = 300
      
      const x = Math.sin((angle * Math.PI) / 180) * radius
      const z = Math.cos((angle * Math.PI) / 180) * radius
      
      return {
        transform: `translate3d(${x}px, 0, ${z}px) rotateY(${-angle}deg)`,
        zIndex: Math.round(z)
      }
    }
    
    // 向左旋转
    const rotateLeft = () => {
      currentRotation.value += 60
    }
    
    // 向右旋转
    const rotateRight = () => {
      currentRotation.value -= 60
    }
    
    // 选择作品
    const selectWork = (index) => {
      selectedWork.value = galleryWorks.value[index]
    }
    
    // 关闭详情
    const closeDetails = () => {
      selectedWork.value = null
    }
    
    // 自动旋转
    let autoRotateInterval = null
    
    onMounted(() => {
      // 启动自动旋转
      autoRotateInterval = setInterval(() => {
        if (!selectedWork.value) {
          currentRotation.value -= 1
        }
      }, 50)
    })
    
    return {
      galleryWorks,
      currentRotation,
      selectedWork,
      gallery3d,
      getItemStyle,
      rotateLeft,
      rotateRight,
      selectWork,
      closeDetails
    }
  }
}
</script>

<style scoped>
/* 通用样式 */
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

/* 导航栏样式 */
.navbar {
  background: #ffffff;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
}

.navbar .container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 1rem 2rem;
}

.brand-link {
  font-size: 1.5rem;
  font-weight: bold;
  color: #333333;
  text-decoration: none;
}

.nav-link {
  color: #666666;
  text-decoration: none;
  font-weight: 400;
  transition: color 0.2s ease;
}

.nav-link:hover {
  color: #333333;
}

/* 页面标题样式 */
.page-header {
  padding: 4rem 0 2rem;
  background: #fafafa;
  text-align: center;
}

.page-title {
  font-size: 3rem;
  color: #333333;
  margin-bottom: 1rem;
  font-weight: 400;
  letter-spacing: 0.5px;
}

.page-description {
  font-size: 1.1rem;
  color: #666666;
  font-weight: 300;
  letter-spacing: 0.3px;
}

/* 3D画廊样式 */
.gallery-3d-section {
  padding: 4rem 0;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  min-height: 80vh;
  position: relative;
  overflow: hidden;
}

.gallery-3d-container {
  position: relative;
  width: 100%;
  height: 600px;
  perspective: 1000px;
  display: flex;
  justify-content: center;
  align-items: center;
}

.gallery-3d {
  position: relative;
  width: 200px;
  height: 300px;
  transform-style: preserve-3d;
  transition: transform 0.5s ease;
}

.gallery-3d-item {
  position: absolute;
  width: 200px;
  height: 300px;
  cursor: pointer;
  transition: all 0.5s ease;
}

.gallery-3d-item:hover {
  /* 移除缩放效果，只保留画框的外发光 */
}

.work-frame {
  width: 100%;
  height: 100%;
  background: #ffffff;
  border: 7.5px solid #8B4513;
  border-radius: 5px;
  box-shadow: 
    0 0 0 3px #D2691E,
    0 0 0 6px #8B4513,
    0 15px 30px rgba(0,0,0,0.4),
    inset 0 0 0 2px #F5DEB3;
  overflow: hidden;
  transition: all 0.3s ease;
  position: relative;
  background: 
    repeating-linear-gradient(
      90deg,
      #8B4513 0px,
      #A0522D 2px,
      #CD853F 4px,
      #D2B48C 6px,
      #DEB887 8px,
      #F5DEB3 10px,
      #DEB887 12px,
      #D2B48C 14px,
      #CD853F 16px,
      #A0522D 18px,
      #8B4513 20px
    ),
    repeating-linear-gradient(
      0deg,
      rgba(139,69,19,0.1) 0px,
      rgba(160,82,45,0.1) 1px,
      rgba(205,133,63,0.1) 2px,
      rgba(222,184,135,0.1) 3px,
      transparent 4px,
      transparent 8px
    ),
    radial-gradient(
      ellipse 200% 100% at 50% 0%,
      rgba(139,69,19,0.3) 0%,
      rgba(160,82,45,0.2) 20%,
      transparent 40%,
      rgba(205,133,63,0.1) 60%,
      transparent 80%,
      rgba(139,69,19,0.2) 100%
    ),
    repeating-conic-gradient(
      from 0deg at 50% 50%,
      rgba(139,69,19,0.05) 0deg,
      rgba(160,82,45,0.05) 15deg,
      rgba(205,133,63,0.05) 30deg,
      rgba(222,184,135,0.05) 45deg,
      rgba(139,69,19,0.05) 60deg
    );
}

.work-frame::before {
  content: '';
  position: absolute;
  top: -7.5px;
  left: -7.5px;
  right: -7.5px;
  bottom: -7.5px;
  background: 
    repeating-linear-gradient(
      45deg,
      #654321 0px,
      #8B4513 3px,
      #A0522D 6px,
      #CD853F 9px,
      #D2B48C 12px,
      #DEB887 15px,
      #F5DEB3 18px,
      #DEB887 21px,
      #D2B48C 24px,
      #CD853F 27px,
      #A0522D 30px,
      #8B4513 33px,
      #654321 36px
    ),
    radial-gradient(
      ellipse at center,
      rgba(139,69,19,0.2) 0%,
      rgba(160,82,45,0.1) 50%,
      transparent 100%
    );
  z-index: -1;
  border-radius: 5px;
}

.work-frame::after {
  content: '';
  position: absolute;
  top: 2.5px;
  left: 2.5px;
  right: 2.5px;
  bottom: 2.5px;
  border: 2px solid rgba(139,69,19,0.3);
  border-radius: 3px;
  pointer-events: none;
  background: 
    repeating-conic-gradient(
      from 0deg at 50% 50%,
      rgba(139,69,19,0.05) 0deg,
      rgba(160,82,45,0.05) 30deg,
      rgba(205,133,63,0.05) 60deg,
      rgba(222,184,135,0.05) 90deg,
      rgba(139,69,19,0.05) 120deg,
      rgba(160,82,45,0.05) 150deg,
      rgba(205,133,63,0.05) 180deg,
      rgba(222,184,135,0.05) 210deg,
      rgba(139,69,19,0.05) 240deg,
      rgba(160,82,45,0.05) 270deg,
      rgba(205,133,63,0.05) 300deg,
      rgba(222,184,135,0.05) 330deg,
      rgba(139,69,19,0.05) 360deg
    ),
    linear-gradient(
      135deg,
      rgba(245,222,179,0.3) 0%,
      transparent 25%,
      rgba(139,69,19,0.1) 50%,
      transparent 75%,
      rgba(245,222,179,0.2) 100%
    );
}

.work-frame:hover {
  box-shadow: 
    0 0 0 3px #F5DEB3,
    0 0 0 6px #8B4513,
    0 0 20px rgba(139,69,19,0.6),
    0 0 40px rgba(245,222,179,0.4),
    0 20px 40px rgba(0,0,0,0.5),
    inset 0 0 0 2px #F5DEB3,
    inset 0 0 20px rgba(245,222,179,0.4);
}

.work-frame img {
  width: calc(100% - 10px);
  height: calc(70% - 5px);
  object-fit: cover;
  margin: 5px 5px 0 5px;
  border: 2px solid #F5DEB3;
  box-shadow: inset 0 0 10px rgba(0,0,0,0.1);
}

.work-info {
  padding: 0.8rem;
  text-align: center;
  background: linear-gradient(to bottom, #F5F5DC 0%, #F0E68C 100%);
  border-top: 1px solid #D2691E;
  margin: 0 5px 5px 5px;
  border-radius: 0 0 3px 3px;
}

.work-info h3 {
  font-size: 1rem;
  color: #8B4513;
  margin-bottom: 0.5rem;
  font-weight: 600;
  text-shadow: 1px 1px 2px rgba(255,255,255,0.8);
}

.work-info p {
  font-size: 0.9rem;
  color: #A0522D;
  font-weight: 500;
  text-shadow: 1px 1px 2px rgba(255,255,255,0.6);
}

/* 控制按钮 */
.gallery-controls {
  position: absolute;
  bottom: 2rem;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 1rem;
  z-index: 100;
}

.control-btn {
  width: 50px;
  height: 50px;
  border: none;
  border-radius: 50%;
  background: rgba(255,255,255,0.9);
  color: #333;
  font-size: 1.5rem;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(0,0,0,0.2);
}

.control-btn:hover {
  background: #ffffff;
  transform: scale(1.1);
  box-shadow: 0 6px 20px rgba(0,0,0,0.3);
}

/* 作品详情 */
.work-details {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0,0,0,0.8);
  display: flex;
  justify-content: center;
  align-items: center;
  z-index: 2000;
  animation: fadeIn 0.3s ease;
}

.work-detail-card {
  background: #ffffff;
  border-radius: 15px;
  max-width: 800px;
  max-height: 90vh;
  overflow: auto;
  position: relative;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3);
  display: flex;
  animation: slideUp 0.3s ease;
}

.detail-image {
  width: 400px;
  height: 500px;
  object-fit: cover;
  border-radius: 15px 0 0 15px;
}

.detail-info {
  padding: 2rem;
  flex: 1;
}

.detail-info h2 {
  font-size: 2rem;
  color: #333;
  margin-bottom: 1rem;
  font-weight: 600;
}

.detail-info p {
  font-size: 1.1rem;
  color: #666;
  margin-bottom: 1rem;
  line-height: 1.6;
}

.close-btn {
  position: absolute;
  top: 1rem;
  right: 1rem;
  width: 40px;
  height: 40px;
  border: none;
  border-radius: 50%;
  background: #f0f0f0;
  color: #333;
  font-size: 1.5rem;
  cursor: pointer;
  transition: all 0.3s ease;
}

.close-btn:hover {
  background: #e0e0e0;
  transform: scale(1.1);
}

/* 动画 */
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}

@keyframes slideUp {
  from { 
    opacity: 0;
    transform: translateY(50px);
  }
  to { 
    opacity: 1;
    transform: translateY(0);
  }
}

/* 响应式设计 */
@media (max-width: 768px) {
  .gallery-3d-container {
    height: 400px;
  }
  
  .gallery-3d-item {
    width: 150px;
    height: 200px;
  }
  
  .work-detail-card {
    flex-direction: column;
    margin: 1rem;
    max-width: none;
  }
  
  .detail-image {
    width: 100%;
    height: 300px;
    border-radius: 15px 15px 0 0;
  }
  
  .detail-info {
    padding: 1.5rem;
  }
  
  .page-title {
    font-size: 2rem;
  }
}
</style>