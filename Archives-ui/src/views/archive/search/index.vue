<template>
    <div id="app1">
      <el-container>
        <el-header>
          <img src="@/assets/images/fulltext-search.png" >
          <div>
            <h2 class="full_header">
                数字档案管理系统<br>
                <p class="full_p">让数字化成果深度利用 · 可查可验</p></h2></div>
        </el-header>
        <el-main>
          <el-row :gutter="20">
            <el-col :span="24">
              <el-input placeholder="请输入内容"
                v-model="searchQuery"
                @keyup.enter.native="handleSearch"
                class="full_input"
                >
                <el-button slot="append" icon="el-icon-search" class="full_search" type="primary" @click="handleSearch"></el-button>
              </el-input>
            </el-col>
          </el-row>
          <el-row :gutter="20">
            <el-col :span="6" :offset="8">
              <el-card class="full_card">
                <div slot="header" >
                  <span ><img src="@/assets/images/hot.png">热门检索</span>
                </div>
                <el-row>
                    <el-tag
                        v-for="tag in hotTags"
                        :key="tag"
                        closable
                        @close="handleClose(tag)"
                        type="info"
                    >
                      <router-link to="/system/archivesExploit/borrowing/hotSearches"> {{ tag }}</router-link>
                    </el-tag>
                </el-row>
              </el-card>
            </el-col>
          </el-row>
        </el-main>
      </el-container>
    </div>

  </template>

  <script>
  export default {
    name: 'FullText',
    data() {
        return {
        searchQuery: '',
        hotTags: ['合同', '档案', '发票', '凭证', '文件', '会计', '项目', '通知'],
      };
    },
    methods: {
      goToHot() {
        this.$router.push('/hot');
      },
    handleSearch() {
      // 实现搜索逻辑
      console.log('Search for:', this.searchQuery);
    },
    handleClose(tag) {
      // 实现删除标签的逻辑
      this.hotTags = this.hotTags.filter(t => t !== tag);
    },
  },
  };
  </script>
