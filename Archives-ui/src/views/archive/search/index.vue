<template>
    <div id="app1" v-if="!showTable">
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
            <el-col :span="22">
              <el-cascader
                :options="fileOptions"
                :show-all-levels="false"
                :props="{multiple: true}"
                ref="cascader"
                @change="handleCascaderChange"
              ></el-cascader>
              <el-input placeholder="请输入内容"
                v-model="searchQuery"
                @keyup.enter.native="handleSearch"
                class="full_input"
                >
                <el-button slot="append" icon="el-icon-search" class="full_search" type="primary" @click="handleSearch"></el-button>
              </el-input>
            </el-col>
          </el-row>
<!--          <el-row :gutter="20">-->
<!--            <el-col :span="6" :offset="8">-->
<!--              <el-card class="full_card">-->
<!--                <div slot="header">-->
<!--                  <span ><img src="@/assets/images/hot.png">热门检索</span>-->
<!--                </div>-->
<!--                <el-row>-->
<!--                    <el-tag-->
<!--                        v-for="tag in hotTags"-->
<!--                        :key="tag"-->
<!--                        closable-->
<!--                        @close="handleCloseTag(tag)"-->
<!--                        type="info"-->
<!--                    >-->
<!--                      <router-link to="/system/archivesExploit/borrowing/hotSearches"> {{ tag }}</router-link>-->
<!--                    </el-tag>-->
<!--                </el-row>-->
<!--              </el-card>-->
<!--            </el-col>-->
<!--          </el-row>-->
        </el-main>
      </el-container>
    </div>
    <div v-else>
      <el-main style="padding-left: 2%">
        <el-row :gutter="0" justify="center" type="flex">
          <el-col :span="3">
            <el-cascader
              :options="fileOptions"
              :show-all-levels="false"
              :props="{multiple: true}"
              ref="cascader"
              @change="handleCascaderChange"
            ></el-cascader>
          </el-col>
          <el-col :span="9">
            <el-input placeholder="请输入内容"
                      v-model="searchQuery"
                      @keyup.enter.native="handleSearch"
                      class="full_input"
                      style="width: 100%; margin-bottom: 50px; "
            >
              <el-button slot="append" icon="el-icon-search" class="full_search" type="primary" @click="handleSearch"></el-button>
            </el-input>
          </el-col>
        </el-row>
        <el-row :gutter="20" v-if="!isEmpty">
          <el-col :span="24">
                <el-tag v-for="tag in tagList" :key="tag.name" @click="selectedItem(tag)" type="" :effect="selectedTag === tag.category? 'dark':'plain'" size="medium">{{ tag.name+"("+tag.count+")" }}</el-tag>
                <!-- 动态生成的表格 -->
                <div class="table-container">
                  <el-table v-loading="vLoading" element-loading-background="rgba(255,255,255,1)" :data="FilteredList" :default-sort = "{prop: 'id', order: 'descending'}" height="53vh" ref="dynamicTable" border @row-click="handleRowClick">
                    <el-table-column
                      v-for="field in itemFilteredList"
                      :key="field.name"
                      :prop="field.name"
                      :label="field.label"
                      :sortable="true"
                      :width="field.label.length * 11 + 65+'vh'"
                    >
                      <template slot-scope="scope">
                        <span class="truncate-text" v-if="field.name === 'archiveStatus'">{{getArchiveStatus(scope.row.archiveStatus)}}</span>
                        <span class="truncate-text" v-else-if="field.name === 'department'">{{ getDepartmentName(scope.row.department) }}</span>
                        <span class="truncate-text" v-else v-html="scope.row[field.name]"></span>
                      </template>
                    </el-table-column>
                  </el-table>
                  <div class="block">
                    <el-pagination
                      v-show="total > 0"
                      @size-change="handleSizeChange"
                      @current-change="handleCurrentChange"
                      :current-page="queryParams.pageNum"
                      :page-sizes="[10, 20, 30, 50]"
                      :page-size="queryParams.pageSize"
                      layout="total, sizes, prev, pager, next, jumper"
                      :total="total">
                    </el-pagination>
                  </div>
                </div>
          </el-col>
        </el-row>
        <el-row :gutter="20" v-else>
          <el-empty description="未找到搜索内容"></el-empty>
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
                            <el-button type="success" class="el-button" @click="handleFilePreview(scope.row.url)" size="small">预览</el-button>
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
      <!--文件预览对话框
      <el-dialog title="文件预览" :visible.sync="showPreview" fullscreen>
        <onlinePreview v-if="showPreview" :initialUrl="previewUrl"/>
      </el-dialog>-->
    </div>
</template>

  <script>
  import {getArchiveDetail, searchArchive} from "@/api/archive/search";
  import {getCategory, listCategory} from "@/api/archive/category";
  import {getItemByCategoryId} from "@/api/archive/item";
  import {getOssByFid} from "@/api/system/oss";
  import {listDept} from "@/api/system/dept";
  import { Base64 } from 'js-base64'

  export default {
    name: 'FullText',
    data() {
        return {
        showTable:false,
        isEmpty:false,
        searchQuery: '',
        keyWord:'',
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
          keyWord: null,
          value: null,
        },
        selectedNodes:[],
        fileOptions:[],
        itemFilteredList:[],
        showPreview:false,//文件预览对话框
        previewUrl:"",
        open:false,
        title:null,
        vLoading:false,
        isClick:false,
      };
    },
    computed:{
      FilteredList(){
        let filteredResults  =this.searchResult.filter(item => {
          return item.categoryId === Number(this.selectedTag);
        });
        return filteredResults.map(item => {
          let hightLightedContent = {...item};
          for(let key in hightLightedContent){
            if(typeof hightLightedContent[key] === "string"){
              hightLightedContent[key] = this.hightLightText(hightLightedContent[key], this.keyWord);
            }
          }
          return hightLightedContent;
        });
      },
    },
    created() {
      this.loadDepartments();
      this.getCategoryTreeList();
    },
    methods: {
      goToHot() {
        this.$router.push('/hot');
      },
      handleSearch() {
        this.keyWord = this.searchQuery;
        const categoryList = this.selectedNodes.map(item => {
          return item.data.id;
        });
        this.value = categoryList;
        this.queryParams.pageNum = 1;
        const searchJson = {keyWord: this.searchQuery, value: categoryList};
        searchArchive(searchJson).then(async tagListRes => {
          this.selectedTag = '0';
          this.tagList = [];
          // 创建一个数组存储所有的Promise
          const promises = tagListRes.map(tagRes => {
            return getCategory(tagRes.categoryId).then(nameFromCategory => {
              const tag = { name: nameFromCategory.data.name, category: nameFromCategory.data.id, count: tagRes.length };
              this.tagList.push(tag);
            });
          });
          // 等待所有的Promise执行完成
          await Promise.all(promises);
          // 此时所有的tag已被添加到tagList中
          this.isEmpty = this.tagList.length === 0;
        });
        this.showTable = true;
      },
    handleCloseTag(tag) {
      // 实现删除标签的逻辑
      this.hotTags = this.hotTags.filter(t => t !== tag);
    },
    handleNextPage(){
      this.vLoading = true;
      getArchiveDetail(this.queryParams).then(infoRes => {
        this.searchResult = infoRes.searchResults;
        this.total = infoRes.total;
      }).then(()=>{
        this.$nextTick(() => {
          setTimeout(() => {
            this.$refs.dynamicTable.doLayout(); // 延迟0.1秒后调用
          }, 100);
          setTimeout(() => {
            this.vLoading = false;
            this.isClick = false;
          }, 800);
        })
      })
    },
    handleSizeChange(nowPageSize){
      this.queryParams.pageSize = nowPageSize;
      this.handleNextPage();
    },
    handleCurrentChange(nowCurrentPage){
        this.queryParams.pageNum = nowCurrentPage;
        this.handleNextPage();
    },
    selectedItem(tag, event){
      if(!this.isClick){
        this.isClick = true;
      this.selectedTag = tag.category;
        getItemByCategoryId(tag.category).then(res => {
          this.itemListOriginal = res.data;
          this.mapFieldData();
          // 根据不同的场景过滤字段
          this.queryFields = this.itemList.filter(field => field.isQuery === '1');
          this.itemFilteredList = this.itemList.filter(field => field.isList === '1');
          this.itemFilteredListGroup1 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '1').sort((a, b) => a.sort - b.sort);
          this.itemFilteredListGroup2 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '2').sort((a, b) => a.sort - b.sort);
          this.itemFilteredListGroup3 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '3').sort((a, b) => a.sort - b.sort);
          this.editFields = this.itemList.filter(field => field.isEdit === '1');
          this.editFields = this.itemList.filter(field => field.isEdit === '1');
        })
          this.queryParams.keyWord = this.keyWord;
          this.queryParams.categoryId = this.selectedTag;
          this.handleNextPage();
      }
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
          return 'el-input'
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
      const  notLightedContent = {...row};
      for(let key in notLightedContent){
        if(typeof notLightedContent[key] === "string"){
          notLightedContent[key] = notLightedContent[key].replace(/<[^>]+>/g, '');
        }
      }
      const fid = row.id;
      getOssByFid(fid).then(res => {
        notLightedContent.sysOssList = res.data;
      })
      this.form = notLightedContent;
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
      // this.previewUrl = url;
      // this.showPreview = true;
      const encodedUrl = encodeURIComponent(Base64.encode(process.env.VUE_APP_FILE_SERVER_BASE_URL + url));
      // 打开新页面并调用在线预览接口
      window.open(process.env.VUE_APP_KKFILEVIEW_BASE_URL + '/onlinePreview?url=' + encodedUrl);
    },
    getDepartmentName(department) {
      return this.departmentMap[department] || '未知部门';
    },
    loadDepartments(){
      listDept().then(response => {
        this.departmentMap = response.data.reduce((map, dept) => {
          map[dept.deptId] = dept.deptName;
          return map;
        }, {});
      })
    },
      handleCascaderChange(){
        this.selectedNodes = this.$refs['cascader'].getCheckedNodes(true);
      },
      getCategoryTreeList() {
        listCategory().then(response => {
          this.fileOptions = this.handleFileOptions(response.data, "id", "parentId");
        })
      },
      handleFileOptions(data, idKey, parentKey) {
        const tree = [];
        const idMap = {};
        const idMap2 = {};

        data.forEach(item => {
          idMap2[item[idKey]] = {
            id: item.id,
            parentId: item.parentId,
            parentName: item.parentName,
            type: item.type,
            label: item.name,
            value: item.id
          };
          idMap[item[idKey]] = { ...idMap2[item[idKey]], children: [] };
        });

        data.forEach(item => {
          const parent = idMap[item[parentKey]];
          if (parent) {
            parent.children.push(idMap2[item[idKey]]);
          } else {
            tree.push(idMap[item[idKey]]);
          }
        });

        return tree;
      },
  },
  };
  </script>
  <style lang="scss" scoped>
  .fixed-table-container {
    top: 21%;
    width: auto;
    max-width: 93%;
    height: 77vh;
    position: fixed;
    min-width: 88%; /* 可设置最小宽度，避免窗口过小 */
    min-height: 50%; /* 可设置最小高度，避免窗口过小 */
  }
  .butten-column {
    display: flex;
    flex-direction: column;
    gap: 10px;
    align-items:center;
  }
  .el-button {
    margin-left: 0;
  }
  .table-container {
    max-height: 63vh; /* 限制表格的最大高度 */
    overflow-y: auto; /* 添加垂直滚动条 */
  }
  .truncate-text {
    display: block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 100%; /* Adjust as needed */
  }
  </style>
