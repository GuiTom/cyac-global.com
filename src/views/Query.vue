<template>
  <div class="query-page">
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
        <h1 class="page-title">Awards Query</h1>
        <p class="page-description">Enter award number or winner's name to query award information</p>
      </div>
    </section>

    <!-- 查询功能 -->
    <section class="query-section">
      <div class="container">
        <div class="query-form">
          <div class="query-tabs">
            <button 
              class="tab-button" 
              :class="{ active: queryType === 'number' }"
              @click="queryType = 'number'"
            >
              Query by Award Number
            </button>
            <button 
              class="tab-button" 
              :class="{ active: queryType === 'name' }"
              @click="queryType = 'name'"
            >
              Query by Name
            </button>
          </div>
          <div class="query-filter">
            <span class="filter-label">Query Type:</span>
            <div class="filter-buttons">
              <button 
                class="filter-button" 
                :class="{ active: awardFilter === 'finalist' }"
                @click="awardFilter = 'finalist'"
              >
                Finalist
              </button>
              <button 
                class="filter-button" 
                :class="{ active: awardFilter === 'winner' }"
                @click="awardFilter = 'winner'"
              >
                Winner
              </button>
            </div>
          </div>
          <div class="query-input">
            <input 
              v-if="queryType === 'number'"
              v-model="queryNumber"
              type="text" 
              placeholder="Please enter award number"
              class="input-field"
            >
            <input 
              v-if="queryType === 'name'"
              v-model="queryName"
              type="text" 
              placeholder="Please enter winner's name"
              class="input-field"
            >
            <button @click="searchAward" class="search-button">Search</button>
          </div>
          <div class="query-result" v-if="queryResult">
            <h3>Query Results</h3>
            <div class="result-card">
              <div class="result-info">
                <table class="result-table">
                  <tbody>
                    <tr>
                      <td class="label">Winner:</td>
                      <td class="value">{{ queryResult.name }}</td>
                    </tr>
                    <tr>
                      <td class="label">Status:</td>
                      <td class="value">{{ queryResult.status }}</td>
                    </tr>
                    <tr>
                      <td class="label">Award:</td>
                      <td class="value">{{ queryResult.award }}</td>
                    </tr>
                    <tr>
                      <td class="label">Number:</td>
                      <td class="value">{{ queryResult.number }}</td>
                    </tr>
                    <tr>
                      <td class="label">Year:</td>
                      <td class="value">{{ queryResult.year }}</td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="certificate-section">
                <div class="certificate-preview">
                  <img :src="certificateImg" alt="Award Certificate" class="certificate-thumbnail" />
                  <p class="certificate-label">Award Certificate</p>
                </div>
                <button @click="downloadCertificate" class="download-button">
                  <span class="download-icon">⬇</span>
                  Download Certificate
                </button>
              </div>
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
  </div>
</template>

<script>
import { ref } from 'vue'

// 导入证书资源
import certificateImg from '/certificates/1.jpg'
import certificatePdf from '/certificates/1.pdf'

export default {
  name: 'Query',
  setup() {
    // 响应式数据
    const queryType = ref('number')
    const queryNumber = ref('')
    const queryName = ref('')
    const queryResult = ref(null)
    const awardFilter = ref('winner') // 默认选择获奖

    // 查询功能
    const searchAward = () => {
      // 模拟查询结果
      if (queryType.value === 'number' && queryNumber.value) {
        queryResult.value = {
          name: 'Zhang Xiaoming',
          status: awardFilter.value === 'winner' ? 'Winner' : 'Finalist',
          award: 'Gold Award',
          number: queryNumber.value,
          year: '2024'
        }
      } else if (queryType.value === 'name' && queryName.value) {
        queryResult.value = {
          name: queryName.value,
          status: awardFilter.value === 'winner' ? 'Winner' : 'Finalist',
          award: 'Silver Award',
          number: 'CYAC2024001',
          year: '2024'
        }
      } else {
        alert('Please enter query content')
      }
    }

    // 下载证书功能
    const downloadCertificate = () => {
      const link = document.createElement('a')
      link.href = certificatePdf
      link.download = `CYAC_Certificate_${queryResult.value.number}.pdf`
      document.body.appendChild(link)
      link.click()
      document.body.removeChild(link)
    }

    return {
      queryType,
      queryNumber,
      queryName,
      queryResult,
      awardFilter,
      searchAward,
      downloadCertificate,
      certificateImg
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
  padding: 6rem 0 4rem;
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

/* 获奖查询样式 - 性冷淡风格 */
.query-section {
  padding: 20px 0;
  background: #ffffff;
}

.query-form {
  background: #fafafa;
  padding: 12px;
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
  gap: 10px;
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
  gap: 4px;
}

.filter-button {
  padding: 0.8rem 1.5rem;
  background: #ffffff;
  color: #999999;
  border: 1px solid #e8e8e8;
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
  padding: 12px 24px;
  background: #333333;
  color: white;
  border: 1px solid #333333;
  border-radius: 0;
  cursor: pointer;
  font-weight: 400;
  font-size: 0.85rem;
  transition: all 0.2s ease;
  letter-spacing: 0.5px;

  align-self: stretch;
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
  background: #ffffff;
  padding: 12px;
  border: 1px solid #f0f0f0;
  display: flex;
  gap: 8px;
  flex-direction: column;

  justify-content: space-between;
}

.result-info {
  flex: 1;
}

.result-table {
  width: 100%;
  border-collapse: collapse;
}

.result-table tr {
  border-bottom: 1px solid #f5f5f5;
}

.result-table tr:last-child {
  border-bottom: none;
}

.result-table td {
  padding: 0.8rem 0;
  vertical-align: top;
}

.result-table .label {
  width: 80px;
  color: #333333;
  font-weight: 400;
  font-size: 0.9rem;
  letter-spacing: 0.2px;
}

.result-table .value {
  color: #666666;
  font-size: 0.9rem;
  font-weight: 300;
  letter-spacing: 0.2px;
  padding-left: 1rem;
}
.certificate-section {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 12px;
  min-width: 200px;
}

.certificate-preview {
  text-align: center;
}

.certificate-thumbnail {
  width: 150px;
  height: 200px;
  object-fit: cover;
  border: 1px solid #e8e8e8;
  border-radius: 4px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.certificate-label {
  margin-top: 0.5rem;
  font-size: 0.8rem;
  color: #666666;
  font-weight: 300;
}

.download-button {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding: 0.8rem 1.5rem;
  background: #333333;
  color: white;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 0.85rem;
  font-weight: 400;
  letter-spacing: 0.3px;
  transition: all 0.2s ease;
}

.download-button:hover {
  background: #555555;
  transform: translateY(-1px);
}

.download-icon {
  font-size: 1rem;
}

/* 页脚样式 */
.footer {
  background-color: #171717;
  color: white;
  padding: 3rem 0 1rem;
}

.footer-content {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-bottom: 2rem;
}

.footer-section h3,
.footer-section h4 {
  margin-bottom: 1rem;
  color: white;
}

.footer-section p {
  color: #ccc;
  line-height: 1.6;
}

.footer-bottom {
  text-align: center;
  padding-top: 2rem;
  border-top: 1px solid #333;
  color: #999;
}
</style>