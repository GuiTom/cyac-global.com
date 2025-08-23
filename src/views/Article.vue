<template>
  <div class="article-page">
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
              <h4>Share Article</h4>
              <div class="share-buttons">
                <button class="share-btn" @click="shareToWeChat">WeChat</button>
                <button class="share-btn" @click="shareToWeibo">Weibo</button>
                <button class="share-btn" @click="copyLink">Copy Link</button>
              </div>
            </div>
          </footer>
        </article>
        
        <!-- 相关文章 -->
        <section class="related-articles" v-if="relatedArticles.length > 0">
          <h3>Related Articles</h3>
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
        title: '2024 CYAC Competition Officially Launched',
        excerpt: 'The Global Youth Art Competition 2024 registration is now open. Young artists from around the world are welcome to participate.',
        category: 'Competition News',
        date: '2024-01-15',
        image: './images/placeholder-news-1.svg',
        content: `
          <p>The Global Youth Art Competition (CYAC Global Youth Art Competition) 2024 is officially launched! This is an important platform for young art enthusiasts worldwide, aimed at discovering and nurturing the next generation of artistic talent.</p>
          
          <h3>Competition Details</h3>
          <p>This competition is divided into the following age groups:</p>
          <ul>
            <li>Children's Group (6-12 years old)</li>
            <li>Youth Group (13-17 years old)</li>
            <li>Young Adult Group (18-25 years old)</li>
          </ul>
          
          <h3>Competition Categories</h3>
          <p>Participants can choose from any of the following categories:</p>
          <ul>
            <li>Painting: Oil painting, watercolor, sketching, Chinese painting, etc.</li>
            <li>Design: Graphic design, product design, fashion design, etc.</li>
            <li>Digital Art: Digital painting, 3D modeling, animation, etc.</li>
            <li>Photography: Artistic photography, documentary photography, etc.</li>
          </ul>
          
          <h3>Awards</h3>
          <p>This competition offers generous prizes:</p>
          <ul>
            <li>Gold Award: 10,000 RMB + Certificate + International Art Study Tour</li>
            <li>Silver Award: 5,000 RMB + Certificate + Art Supplies Gift Package</li>
            <li>Bronze Award: 2,000 RMB + Certificate</li>
            <li>Excellence Award: Certificate + Commemorative Gift</li>
          </ul>
          
          <h3>Registration</h3>
          <p>Please visit our official website for online registration, or contact local partner institutions. Registration deadline is March 31, 2024.</p>
          
          <p>We look forward to seeing wonderful works from young people around the world!</p>
        `,
        tags: ['Competition', 'Art', 'Youth', '2024']
      },
      2: {
        id: 2,
        title: 'International Art Exchange Exhibition Coming Soon',
        excerpt: 'To promote international youth art exchange, we will host a large-scale art exhibition.',
        category: 'Exhibition News',
        date: '2024-01-10',
        image: './images/placeholder-news-2.svg',
        content: `
          <p>CYAC Global will host a large-scale international youth art exchange exhibition in Beijing in April 2024, bringing together outstanding youth artworks from around the world.</p>
          
          <h3>Exhibition Highlights</h3>
          <p>This exhibition will showcase excellent works from over 50 countries and regions, covering traditional painting, modern design, digital art, and many other fields.</p>
          
          <h3>Special Activities</h3>
          <ul>
            <li>Live artist creation performances</li>
            <li>International art education forum</li>
            <li>Youth art workshops</li>
            <li>Cultural exchange evening</li>
          </ul>
          
          <h3>Visitor Information</h3>
          <p>Exhibition dates: April 15-25, 2024<br>
          Venue: Beijing International Art Center<br>
          Tickets: Free (advance reservation required)</p>
        `,
        tags: ['Exhibition', 'International Exchange', 'Art', 'Beijing']
      },
      3: {
        id: 3,
        title: 'Art Study Tour Program Now Open for Applications',
        excerpt: 'The international art study tour program for award winners is now accepting applications.',
        category: 'Study Tour News',
        date: '2024-01-05',
        image: './images/placeholder-news-3.svg',
        content: `
          <p>The CYAC Global international art study tour program is officially open for applications! This is an in-depth art learning experience program designed specifically for award winners.</p>
          
          <h3>Study Tour Destinations</h3>
          <ul>
            <li>Paris, France - Louvre Art Studies</li>
            <li>Florence, Italy - Renaissance Art Exploration</li>
            <li>London, UK - Modern Art and Design</li>
            <li>New York, USA - Contemporary Art and Museum Studies</li>
          </ul>
          
          <h3>Program Content</h3>
          <p>A two-week intensive art learning journey, including:</p>
          <ul>
            <li>Visits to world-class museums</li>
            <li>Exchange visits to renowned art schools</li>
            <li>International master artist workshops</li>
            <li>Cultural heritage site visits</li>
            <li>Creative practice and artwork exhibitions</li>
          </ul>
          
          <h3>Application Requirements</h3>
          <ul>
            <li>CYAC competition gold or silver award winners</li>
            <li>Age 13-25 years old</li>
            <li>Basic English communication skills</li>
            <li>Good health, suitable for international travel</li>
          </ul>
          
          <p>Application deadline: February 29, 2024</p>
        `,
        tags: ['Study Tour', 'International', 'Award Winners', 'Art Education']
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
      alert('WeChat sharing feature under development')
    }
    
    const shareToWeibo = () => {
      // 微博分享逻辑
      alert('Weibo sharing feature under development')
    }
    
    const copyLink = () => {
      // 复制链接
      const url = window.location.href
      navigator.clipboard.writeText(url).then(() => {
        alert('Link copied to clipboard')
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
  font-weight: bold;
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
  font-weight: bold;
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
  font-weight: bold;
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