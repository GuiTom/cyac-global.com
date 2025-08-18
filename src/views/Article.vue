<template>
  <div class="article-page">
    <!-- 导航栏 -->
    <nav class="navbar">
      <div class="container">
        <div class="nav-brand">
          <router-link to="/" class="brand-link">CYAC Global</router-link>
        </div>
        <div class="nav-links">
          <router-link to="/" class="nav-link">返回首页</router-link>
        </div>
      </div>
    </nav>

    <!-- 文章内容 -->
    <main class="article-main">
      <div class="container">
        <article class="article-content">
          <header class="article-header">
            <div class="article-meta">
              <span class="article-category">{{ article.category }}</span>
              <time class="article-date">{{ article.date }}</time>
            </div>
            <h1 class="article-title">{{ article.title }}</h1>
            <div class="article-excerpt">{{ article.excerpt }}</div>
          </header>
          
          <div class="article-image" v-if="article.image">
            <img :src="article.image" :alt="article.title" />
          </div>
          
          <div class="article-body">
            <div v-html="article.content"></div>
          </div>
          
          <footer class="article-footer">
            <div class="article-tags" v-if="article.tags">
              <span class="tag" v-for="tag in article.tags" :key="tag">{{ tag }}</span>
            </div>
            <div class="article-share">
              <h4>分享文章</h4>
              <div class="share-buttons">
                <button class="share-btn" @click="shareToWeChat">微信</button>
                <button class="share-btn" @click="shareToWeibo">微博</button>
                <button class="share-btn" @click="copyLink">复制链接</button>
              </div>
            </div>
          </footer>
        </article>
        
        <!-- 相关文章 -->
        <section class="related-articles" v-if="relatedArticles.length > 0">
          <h3>相关文章</h3>
          <div class="related-grid">
            <div 
              v-for="related in relatedArticles" 
              :key="related.id"
              class="related-card"
              @click="goToArticle(related.id)"
            >
              <img :src="related.image" :alt="related.title" />
              <div class="related-content">
                <h4>{{ related.title }}</h4>
                <p>{{ related.excerpt }}</p>
                <span class="related-date">{{ related.date }}</span>
              </div>
            </div>
          </div>
        </section>
      </div>
    </main>
  </div>
</template>

<script>
import { ref, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'

export default {
  name: 'Article',
  setup() {
    const route = useRoute()
    const router = useRouter()
    const article = ref({})
    const relatedArticles = ref([])
    
    // 模拟文章数据
    const articlesData = {
      1: {
        id: 1,
        title: '2024年度CYAC大赛正式启动',
        excerpt: '全球青少年艺术大赛2024年度比赛正式开始报名，欢迎各地青少年踊跃参与。',
        category: '比赛信息',
        date: '2024-01-15',
        image: './images/placeholder-news-1.svg',
        content: `
          <p>全球青少年艺术大赛（CYAC Global Youth Art Competition）2024年度比赛正式启动！这是一个面向全球青少年艺术爱好者的重要平台，旨在发现和培养下一代艺术人才。</p>
          
          <h3>比赛详情</h3>
          <p>本次比赛分为以下几个年龄组：</p>
          <ul>
            <li>少儿组（6-12岁）</li>
            <li>青少年组（13-17岁）</li>
            <li>青年组（18-25岁）</li>
          </ul>
          
          <h3>参赛类别</h3>
          <p>参赛者可以选择以下任一类别进行创作：</p>
          <ul>
            <li>绘画类：油画、水彩、素描、国画等</li>
            <li>设计类：平面设计、产品设计、服装设计等</li>
            <li>数字艺术类：数字绘画、3D建模、动画等</li>
            <li>摄影类：艺术摄影、纪实摄影等</li>
          </ul>
          
          <h3>奖项设置</h3>
          <p>本次比赛设置丰厚奖项：</p>
          <ul>
            <li>金奖：奖金10000元 + 证书 + 国际艺术游学机会</li>
            <li>银奖：奖金5000元 + 证书 + 艺术用品大礼包</li>
            <li>铜奖：奖金2000元 + 证书</li>
            <li>优秀奖：证书 + 纪念品</li>
          </ul>
          
          <h3>报名方式</h3>
          <p>请访问我们的官方网站进行在线报名，或联系当地合作机构。报名截止日期为2024年3月31日。</p>
          
          <p>我们期待看到来自世界各地青少年的精彩作品！</p>
        `,
        tags: ['比赛', '艺术', '青少年', '2024']
      },
      2: {
        id: 2,
        title: '国际艺术交流展览即将举办',
        excerpt: '为促进国际青少年艺术交流，我们将举办大型艺术作品展览活动。',
        category: '展览信息',
        date: '2024-01-10',
        image: './images/placeholder-news-2.svg',
        content: `
          <p>CYAC Global将于2024年4月在北京举办大型国际青少年艺术交流展览，这是一次汇聚全球优秀青少年艺术作品的盛会。</p>
          
          <h3>展览亮点</h3>
          <p>本次展览将展出来自50多个国家和地区的优秀作品，涵盖传统绘画、现代设计、数字艺术等多个领域。</p>
          
          <h3>特色活动</h3>
          <ul>
            <li>艺术家现场创作表演</li>
            <li>国际艺术教育论坛</li>
            <li>青少年艺术工作坊</li>
            <li>文化交流晚会</li>
          </ul>
          
          <h3>参观信息</h3>
          <p>展览时间：2024年4月15日-25日<br>
          展览地点：北京国际艺术中心<br>
          门票：免费（需提前预约）</p>
        `,
        tags: ['展览', '国际交流', '艺术', '北京']
      },
      3: {
        id: 3,
        title: '艺术游学项目开放申请',
        excerpt: '面向获奖选手开放的国际艺术游学项目现已开始接受申请。',
        category: '游学信息',
        date: '2024-01-05',
        image: './images/placeholder-news-3.svg',
        content: `
          <p>CYAC Global国际艺术游学项目正式开放申请！这是一个专为获奖选手设计的深度艺术学习体验项目。</p>
          
          <h3>游学目的地</h3>
          <ul>
            <li>法国巴黎 - 卢浮宫艺术研修</li>
            <li>意大利佛罗伦萨 - 文艺复兴艺术探索</li>
            <li>英国伦敦 - 现代艺术与设计</li>
            <li>美国纽约 - 当代艺术与博物馆学习</li>
          </ul>
          
          <h3>项目内容</h3>
          <p>为期两周的深度艺术学习之旅，包括：</p>
          <ul>
            <li>世界顶级博物馆参观学习</li>
            <li>知名艺术院校交流访问</li>
            <li>国际艺术大师工作坊</li>
            <li>文化遗产实地考察</li>
            <li>创作实践与作品展示</li>
          </ul>
          
          <h3>申请条件</h3>
          <ul>
            <li>CYAC比赛金奖、银奖获得者</li>
            <li>年龄13-25岁</li>
            <li>具备基本英语交流能力</li>
            <li>身体健康，适合国际旅行</li>
          </ul>
          
          <p>申请截止日期：2024年2月29日</p>
        `,
        tags: ['游学', '国际', '获奖选手', '艺术教育']
      }
    }
    
    const loadArticle = () => {
      const articleId = parseInt(route.params.id)
      if (articlesData[articleId]) {
        article.value = articlesData[articleId]
        
        // 加载相关文章（排除当前文章）
        relatedArticles.value = Object.values(articlesData)
          .filter(item => item.id !== articleId)
          .slice(0, 2)
      } else {
        // 文章不存在，跳转到首页
        router.push('/')
      }
    }
    
    const goToArticle = (id) => {
      router.push(`/article/${id}`)
    }
    
    const shareToWeChat = () => {
      // 微信分享逻辑
      alert('微信分享功能开发中')
    }
    
    const shareToWeibo = () => {
      // 微博分享逻辑
      alert('微博分享功能开发中')
    }
    
    const copyLink = () => {
      // 复制链接
      const url = window.location.href
      navigator.clipboard.writeText(url).then(() => {
        alert('链接已复制到剪贴板')
      })
    }
    
    onMounted(() => {
      loadArticle()
    })
    
    return {
      article,
      relatedArticles,
      goToArticle,
      shareToWeChat,
      shareToWeibo,
      copyLink
    }
  }
}
</script>

<style scoped>
/* 导航栏样式 */
.navbar {
  background: #ffffff;
  box-shadow: 0 2px 10px rgba(0,0,0,0.1);
  position: sticky;
  top: 0;
  z-index: 1000;
}

.navbar .container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 70px;
}

.brand-link {
  font-size: 1.5rem;
  font-weight: bold;
  color: #2f424e;
  text-decoration: none;
}

.nav-link {
  color: #666;
  text-decoration: none;
  padding: 0.5rem 1rem;
  border-radius: 5px;
  transition: all 0.3s ease;
}

.nav-link:hover {
  background: #f5f5f5;
  color: #2f424e;
}

/* 主要内容样式 */
.article-main {
  padding: 2rem 0;
  background: #fafafa;
  min-height: calc(100vh - 70px);
}

.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 0 2rem;
}

.article-content {
  background: #ffffff;
  border-radius: 10px;
  padding: 3rem;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
  margin-bottom: 3rem;
}

/* 文章头部 */
.article-header {
  margin-bottom: 2rem;
  padding-bottom: 2rem;
  border-bottom: 1px solid #eee;
}

.article-meta {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
  align-items: center;
}

.article-category {
  background: #2f424e;
  color: white;
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.9rem;
  font-weight: 500;
}

.article-date {
  color: #666;
  font-size: 0.9rem;
}

.article-title {
  font-size: 2.5rem;
  color: #333;
  margin-bottom: 1rem;
  line-height: 1.3;
  font-weight: bold;
}

.article-excerpt {
  font-size: 1.2rem;
  color: #666;
  line-height: 1.6;
  font-style: italic;
}

/* 文章图片 */
.article-image {
  margin: 2rem 0;
  text-align: center;
}

.article-image img {
  max-width: 100%;
  height: auto;
  border-radius: 10px;
  box-shadow: 0 4px 15px rgba(0,0,0,0.1);
}

/* 文章正文 */
.article-body {
  font-size: 1.1rem;
  line-height: 1.8;
  color: #333;
}

.article-body h3 {
  color: #2f424e;
  margin: 2rem 0 1rem 0;
  font-size: 1.5rem;
  font-weight: 600;
}

.article-body p {
  margin-bottom: 1.5rem;
}

.article-body ul {
  margin: 1rem 0;
  padding-left: 2rem;
}

.article-body li {
  margin-bottom: 0.5rem;
}

/* 文章底部 */
.article-footer {
  margin-top: 3rem;
  padding-top: 2rem;
  border-top: 1px solid #eee;
}

.article-tags {
  margin-bottom: 2rem;
}

.tag {
  display: inline-block;
  background: #f0f0f0;
  color: #666;
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.9rem;
  margin-right: 0.5rem;
  margin-bottom: 0.5rem;
}

.article-share h4 {
  color: #333;
  margin-bottom: 1rem;
  font-size: 1.2rem;
}

.share-buttons {
  display: flex;
  gap: 1rem;
}

.share-btn {
  padding: 0.5rem 1rem;
  border: 1px solid #ddd;
  background: #ffffff;
  color: #666;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.share-btn:hover {
  background: #2f424e;
  color: white;
  border-color: #2f424e;
}

/* 相关文章 */
.related-articles {
  background: #ffffff;
  border-radius: 10px;
  padding: 2rem;
  box-shadow: 0 4px 20px rgba(0,0,0,0.1);
}

.related-articles h3 {
  color: #333;
  margin-bottom: 1.5rem;
  font-size: 1.5rem;
  font-weight: 600;
}

.related-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
}

.related-card {
  border: 1px solid #eee;
  border-radius: 10px;
  overflow: hidden;
  cursor: pointer;
  transition: all 0.3s ease;
}

.related-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 25px rgba(0,0,0,0.15);
}

.related-card img {
  width: 100%;
  height: 150px;
  object-fit: cover;
}

.related-content {
  padding: 1rem;
}

.related-content h4 {
  color: #333;
  margin-bottom: 0.5rem;
  font-size: 1.1rem;
  font-weight: 600;
}

.related-content p {
  color: #666;
  font-size: 0.9rem;
  line-height: 1.5;
  margin-bottom: 0.5rem;
}

.related-date {
  color: #999;
  font-size: 0.8rem;
}

/* 响应式设计 */
@media (max-width: 768px) {
  .container {
    padding: 0 1rem;
  }
  
  .article-content {
    padding: 2rem 1.5rem;
  }
  
  .article-title {
    font-size: 2rem;
  }
  
  .related-grid {
    grid-template-columns: 1fr;
  }
  
  .share-buttons {
    flex-wrap: wrap;
  }
}
</style>