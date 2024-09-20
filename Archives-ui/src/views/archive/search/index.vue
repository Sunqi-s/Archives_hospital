<template>
    <div id="app1" v-if="isShowHeaderAndHotTag">
      <el-container>
        <el-header>
          <img src="@/assets/images/fulltext-search.png">
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
                <div slot="header">
                  <span ><img src="@/assets/images/hot.png">热门检索</span>
                </div>
                <el-row>
                    <el-tag
                        v-for="tag in hotTags"
                        :key="tag"
                        closable
                        @close="handleCloseTag(tag)"
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
    <div v-else>
      <el-main>
        <el-row :gutter="20" justify="center">
          <el-col :span="24">
            <el-input placeholder="请输入内容"
                      v-model="searchQuery"
                      @keyup.enter.native="handleSearch"
                      class="full_input"
                      style="margin-left: 30%; margin-bottom: 50px; "
            >
              <el-button slot="append" icon="el-icon-search" class="full_search" type="primary" @click="handleSearch"></el-button>
            </el-input>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="24">
            <el-tabs type="border-card" v-model="selectedTag" @tab-click="selectedItem" class="fixed-table-container">
              <el-tab-pane v-for="tag in tagList" :label="tag.name+'('+tag.count+')'" :name="String(tag.category)">
                <!-- 动态生成的表格 -->
                <div class="table-container">
                  <el-table :data="FilteredList" :default-sort = "{prop: 'id', order: 'descending'}" height="640" ref="dynamicTable" border @row-click="handleRowClick">
                    <el-table-column type="selection" width="55" align="center" />
                    <el-table-column
                      v-for="field in itemFilteredList"
                      :key="field.name"
                      :prop="field.name"
                      :label="field.label"
                      :sortable="true"
                      :width="field.width || '120px'"
                    >
                      <template slot-scope="scope">
                        <span class="truncate-text" v-if="field.name === 'archiveStatus'">{{getArchiveStatus(scope.row.archiveStatus)}}</span>
                        <span class="truncate-text"  v-html="scope.row[field.name]"></span>
                      </template>
                    </el-table-column>
                  </el-table>
                </div>
              </el-tab-pane>
            </el-tabs>
          </el-col>
        </el-row>
      </el-main>

      <!-- 添加或修改对话框 -->
      <el-dialog :title="title" :visible.sync="open" append-to-body class="dialog-container" :before-close="handleClose" style="text-align: left;" fullscreen>
        <div class="background">
          <el-row>
            <el-col :span="24">
              <div class="grid-content bg-purple-dark"></div>
            </el-col>
          </el-row>
          <div class="grid-content bg-purple">
            <el-card class="box-card" style="width:100%">
              <el-form :model="form" :rules="rules" ref="form" class="form-dady">
                <!--第1组项目-->
                <el-descriptions :column="2" size="medium" border>
                  <el-descriptions-item v-for="field in itemFilteredListGroup1" :key="field.name">
                    <template slot="label">
                      <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                      <span v-else>{{ field.label }}</span>
                    </template>
                    <el-form-item :prop="field.name" class="form-item">
                      <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                        <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                        <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                        <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      </component>
                    </el-form-item>
                  </el-descriptions-item>
                </el-descriptions>
                <el-divider dashed v-if="itemFilteredListGroup1.length"></el-divider>
                <!--第2组项目-->
                <el-descriptions :column="2" size="medium" border>
                  <el-descriptions-item v-for="field in itemFilteredListGroup2" :key="field.name" :label="field.label">
                    <template slot="label">
                      <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                      <span v-else>{{ field.label }}</span>
                    </template>
                    <el-form-item :prop="field.name" class="form-item">
                      <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                        <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                        <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                        <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      </component>
                    </el-form-item>
                  </el-descriptions-item>
                </el-descriptions>
                <el-divider dashed v-if="itemFilteredListGroup2.length"></el-divider>
                <!--第3组项目-->
                <el-descriptions :column="2" size="medium" border>
                  <el-descriptions-item v-for="field in itemFilteredListGroup3" :key="field.name" :label="field.label">
                    <template slot="label">
                      <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                      <span v-else>{{ field.label }}</span>
                    </template>
                    <el-form-item :prop="field.name" class="form-item">
                      <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                        <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                        <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                        <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      </component>
                    </el-form-item>
                  </el-descriptions-item>
                </el-descriptions>
                <el-divider dashed v-if="itemFilteredListGroup3.length"></el-divider>

                <el-row>
                  <el-col :span="24">
                    <div>
                      <el-button type="success" plain icon="el-icon-download" size="small" @click="handleBatchDownload">批量下载</el-button>
                    </div>
                    <el-table :data="form.sysOssList" style="width: 100%; margin-top: 10px;" >
                      <el-table-column type="index" label="序号" width="50">
                        <template slot-scope="scope">{{getIndex(scope.$index)}}</template>
                      </el-table-column>
                      <el-table-column prop="name" label="文件名称"></el-table-column>
                      <el-table-column prop="suffix" label="文件类型" width="120"></el-table-column>
                      <el-table-column prop="fileSize" label="文件大小" width="120">
                        <template slot-scope="scope">{{formatSize(scope.row.size)}}</template>
                      </el-table-column>
                      <el-table-column label="操作" width="120">
                        <template slot-scope="scope">
                          <div class="butten-column">
                            <el-button @click="handleFileDownload(scope.row.url)" size="small">下载</el-button>
                            <el-button type="success" @click="handleFilePreview(scope.row.url)" size="small">预览</el-button>
                          </div>
                        </template>
                      </el-table-column>
                    </el-table>
                  </el-col>
                </el-row>
              </el-form>
            </el-card>
          </div>
        </div>
      </el-dialog>
      <!--文件预览对话框-->
      <el-dialog title="文件预览" :visible.sync="showPreview" fullscreen>
        <onlinePreview v-if="showPreview" :initialUrl="previewUrl"/>
      </el-dialog>
    </div>
</template>

  <script>
  import {searchArchive} from "@/api/archive/search";
  import {listCategory} from "@/api/archive/category";
  import {getItemByCategoryId} from "@/api/archive/item";
  import {getOssByFid} from "@/api/system/oss";

  export default {
    name: 'FullText',
    data() {
        return {
        searchQuery: '',
        hotTags: ['合同', '档案', '发票', '凭证', '文件', '会计', '项目', '通知'],
        searchCountMap: {}, // 记录每个搜索关键词的次数
        searchResult: [],// 搜索结果
        form: {categoryId: null, sysOssList: []},// 表单数据
        rules:{},
        tagList:[],// 标签列表
        categoryList:[],//档案分类列表
        selectedTag:0,
        itemList:[],//档案字段列表
        itemListOriginal:[],//原始档案字段列表
        itemFilteredListGroup1:[],//第1组档案字段列表
        itemFilteredListGroup2:[],//第2组档案字段列表
        itemFilteredListGroup3:[],//第3组档案字段列表
        total:0,
        queryParams:{
          pageNum: 1,
          pageSize: 10,
          categoryId: null,
        },
        itemFilteredList:[],
        showPreview:false,//文件预览对话框
        previewUrl:"",
        open:false,
        title:null,
      };
    },
    computed:{
      isShowHeaderAndHotTag(){
        return this.searchResult.length <= 0;
      },
      FilteredList(){
        let filteredResults  =this.searchResult.filter(item => {
          return item.categoryId === Number(this.selectedTag);
        });
        console.log(filteredResults);
        return filteredResults.map(item => {
          let hightLightedContent = {...item};
          for(let key in hightLightedContent){
            if(typeof hightLightedContent[key] === "string"){
              hightLightedContent[key] = this.hightLightText(hightLightedContent[key], this.searchQuery);
            }
          }
          return hightLightedContent;
        });
      },
    },
    created() {
      listCategory().then(res => {
        this.categoryList = res.data;
      })
    },
    methods: {
      goToHot() {
        this.$router.push('/hot');
      },
    handleSearch() {
      const query = this.searchQuery.trim();
      if(query){
        if(!this.searchCountMap[query]) {
          this.searchCountMap[query] = 0;
        }
        this.searchCountMap[query]++;

        if(this.searchCountMap[query] === 5 && !this.hotTags.includes(query)){
          this.hotTags.push(query);
        }

        searchArchive(this.searchQuery).then(res => {
          console.log(res);
          this.searchResult = res;
          this.getTag();
        });
      }
    },
    handleCloseTag(tag) {
      // 实现删除标签的逻辑
      this.hotTags = this.hotTags.filter(t => t !== tag);
    },
    getTag(){
      let count = 0;
      let category = this.searchResult[0].categoryId;
      let tagName = "";
      // 在每次搜索时清空 tagList
      this.tagList = [];
      for(let i = 0; i < this.searchResult.length; i++){
        if(this.searchResult[i].categoryId === category){
          count++;
        }else {
          for(let j = 0; j < this.categoryList.length; j++){
            if(this.categoryList[j].id === category){
              tagName = this.categoryList[j].name;
              break;
            }
          }
          this.tagList.push({
            category: category,
            name: tagName,
            count: count
          });
          category = this.searchResult[i].categoryId;
          count = 1;
        }
      }
      for(let j = 0; j < this.categoryList.length; j++){
        if(this.categoryList[j].id === category){
          tagName = this.categoryList[j].name;
          break;
        }
      }
      this.tagList.push({
        category: category,
        name: tagName,
        count: count
      });
      console.log("tagList", this.tagList);
    },
    selectedItem(tag, event){
        console.log(tag);
        getItemByCategoryId(tag.name).then(res => {
          console.log(res);
          this.itemListOriginal = res.data;
          this.mapFieldData();
          console.log(this.itemList);
          // 根据不同的场景过滤字段
          this.queryFields = this.itemList.filter(field => field.isQuery === '1');
          this.itemFilteredList = this.itemList.filter(field => field.isList === '1');
          this.itemFilteredListGroup1 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '1').sort((a, b) => a.sort - b.sort);
          this.itemFilteredListGroup2 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '2').sort((a, b) => a.sort - b.sort);
          this.itemFilteredListGroup3 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '3').sort((a, b) => a.sort - b.sort);
          this.editFields = this.itemList.filter(field => field.isEdit === '1');
          this.editFields = this.itemList.filter(field => field.isEdit === '1');
          this.itemList.forEach(field => {
            this.$set(this.queryParams, field.name, null);
          });
          //初始化校验
          this.generateRules();
        })
    },
    generateRules() {
      this.rules = {};
      const fields = [
        ...this.insertFieldsGroup1,
        ...this.insertFieldsGroup2,
        ...this.insertFieldsGroup3
      ];
      fields.forEach(field => {
        const fieldRules = [];

        // 必填项校验
        if (field.isRequired==='1') {
          const parentheseIndex = field.label.indexOf('（');
          const comment = parentheseIndex !== -1 ? field.label.substring(0, parentheseIndex) : field.label;
          fieldRules.push({ required: true, message: `${comment}不能为空`, trigger: field.type === 'select'||'treeselect' ? 'change' : 'blur' });
        }

        // 最大长度校验
        if (field.type !== 'select' && field.type !== 'treeselect' && field.maxLength) {
          fieldRules.push({ max: field.maxLength, message: `${field.label}不能超过${field.maxLength}字符`, trigger: 'blur' });
        }
         // 类型检查
        if (field.type === 'date') {
          fieldRules.push({ type: 'date', message: `${field.label}应为有效日期`, trigger: 'blur' });
        }

        this.rules[field.name] = fieldRules;
      });
    },
    mapHtmlType(htmlType) {
      switch (htmlType) {
        case 'input':
          return 'el-input';
        case 'textarea':
          return 'el-input';
        case 'select':
          return 'el-select';
        case 'treeselect':
          return 'treeselect'
        case 'radio':
          return 'el-radio-group';
        case 'checkbox':
          return 'el-checkbox-group';
        case 'datetime':
          return 'el-date-picker';
        default:
          return 'el-input';
      }
    },
    getComponentType(type) {
      return this.mapHtmlType(type);
    },
    getComponentProps(field) {
      switch (this.mapHtmlType(field.type)) {
        case 'el-select':
          return {
            placeholder: `请选择${field.label}`,
            options: field.options || [],
            default: null
          };
        case 'treeselect':
          if (field.dictType === 'sys_dept_list') {
            return {
              placeholder: `请选择${field.label}`,
              options: this.deptOptions,
              default: null
            };
          }
        case 'el-checkbox-group':
        case 'el-radio-group':
          return {
            options: field.options || [],
            default: Array.isArray(field.options) ? field.options.find(option => option.value === field.defaultValue) : null
          };
        case 'el-date-picker':
          return {
            type: 'datetime',
            placeholder: `请选择${field.label}`,
            'value-format': 'yyyy-MM-dd HH:mm:ss'
          };
        case 'el-input':
          return field.type === 'textarea' ? { type: 'textarea' , placeholder: `请输入${field.label}`} : {placeholder: `请输入${field.label}`};
        default:
          return {};
      }
    },
    mapFieldData(){
      const itemFilteredList = []
        for(let i = 0; i < this.itemListOriginal.length; i++){
          const item = this.itemListOriginal[i];
          itemFilteredList.push({
            categoryId: item.categoryId,
            name: this.toCamelCase(item.columnName),
            label: item.itemName,
            type: item.htmlType,
            htmlGroup: item.htmlGroup,
            maxLength: item.columnLength,
            isQuery: item.isQuery,
            isList: item.isList,
            isInsert: item.isInsert,
            isEdit: item.isEdit,
            isRequired: item.isRequired,
            dictType: item.dictType,
            options: []
          })
        }
      this.itemList = itemFilteredList;
      console.log(this.itemList)
    },
    toCamelCase(columnName) {
      return columnName.replace(/_([a-z])/g, (match, p1) => p1.toUpperCase());
    },
      // 高亮关键字
    hightLightText(text, keyword){
        if(!keyword)return text;
        const regex = new RegExp(`(${keyword})`, 'gi');
        return text.replace(regex, '<span style="color:red;">$1</span>');
    },
    getArchiveStatus(status){
      switch (status) {
        case 0:
          return '待归档';
        case 1:
          return '已归档';
        case 2:
          return '利用';
        default:
          return '未知状态';
      }
    },
    handleRowClick(row){
      console.log(row);
      const fid = row.id;
      getOssByFid(fid).then(res => {
        console.log(res);
        row.sysOssList = res.data;
      })
      this.form = row;
      console.log(this.form);
      this.open = true;
      this.title = '详情';
    },
    handleClose(){
      this.open = false;
    },
    handleBatchDownload() {
      // 批量下载逻辑
      if (this.form.sysOssList.length < 1) {
        this.$message.warning("请选择要下载的文件!");
      } else {
        let files = this.form.sysOssList.map(item => {
          return item.url;
        });
        let zipName = ['user']
        this.$download.zip("/common/zip?files=" + files, zipName);
      }
    },
    //获取索引
    getIndex(index) {
      return index + 1
    },
    //格式化文件大小
    formatSize(size) {
      const sizeInKB = size / 1024;
      return sizeInKB < 1024
        ? `${sizeInKB.toFixed(2)} KB`
        : `${(sizeInKB / 1024).toFixed(2)} MB`;
    },
    // 文件下载
    handleFileDownload(url) {
      this.$download.resource(url);
    },
    //文件预览
    handleFilePreview(url) {
      this.previewUrl = url;
      this.showPreview = true;
    },
  },
  };
  </script>
  <style lang="scss" scoped>
  .fixed-table-container {
    top: 200px;
    width: auto;
    max-width: 88%;
    height: 50%;
    position: fixed;
    min-width: 88%; /* 可设置最小宽度，避免窗口过小 */
    min-height: 80%; /* 可设置最小高度，避免窗口过小 */
  }
  </style>
