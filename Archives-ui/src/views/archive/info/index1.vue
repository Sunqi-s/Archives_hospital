<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!-- 档案分类树形结构 -->
      <el-col :span="4" :xs="24">
        <file-tree :file-options="fileOptions" @node-click="handleNodeClick" :default-expand-all="false" ref="fileTree" :isClick="isClick"></file-tree>
      </el-col>

      <!-- 未选择档案库时显示该画面 -->
      <el-col :span="20" :xs="24" v-show="isselect">
        <div class="no-selection">
          <img src="../../../assets/images/lock.png" class="file-center">
          <p class="file-fontcenter">请选择左侧档案库</p>
        </div>
      </el-col>

      <!-- 档案信息展示 -->
      <el-col :span="20" :xs="24" v-show="categoryId">
        <!-- 单一框的搜索条件 -->
        <div class="archives-style">
          <el-input class="input" v-model="queryParams.searchValue"
                    size="small"
                    placeholder="快速搜索"
                    style="width: 20%; margin-right: 10px;"
          ></el-input>
          <el-button
            icon="el-icon-refresh"
            type="primary"
            size="small"
            @click="resetQuery"
            plain
          >重置</el-button>
          <el-button
            type="primary"
            icon="el-icon-search"
            size="small"
            @click="handleQuery"
          >搜索</el-button>
          <el-button
            @click="drawer = true"
            plain
            class="Senior-button"
            icon="el-icon-arrow-down"
            type="success"
            size="small"
          >高级搜索</el-button>
        </div>

        <!-- 高级搜索抽屉 -->
        <el-drawer  class="search-drawer"  title="高级搜索"  :visible.sync="drawer" :with-header="true">
          <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="100px">
            <el-form-item v-for="field in queryFields" :key="field.name" :label="field.label" :prop="field.name">
              <component  :is="getComponentType(field.type)" v-model="queryParams[field.name]" v-bind="getComponentProps(field)">
                <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
              </component>
            </el-form-item>
          </el-form>

          <div class="form-button-wrapper">
            <el-button type="primary" icon="el-icon-search" size="small" @click="handleQueryBeach">搜索</el-button>
            <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重置</el-button>
          </div>

        </el-drawer>

        <!-- 功能按钮区 -->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="warning"
              icon="el-icon-download"
              size="small"
              @click="handleExport"
              v-hasPermi="['archive:info:export']"
            >导出</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              icon="el-icon-s-flag"
              size="small"
              @click="handleDocument"
            >回档</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              icon="el-icon-s-flag"
              size="small"
              @click="handlePrint"
            >打印</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="success"
              icon="el-icon-s-flag"
              size="small"
              @click="handleSendUtilize"
            >发送利用</el-button>
          </el-col>
<!--          <el-col :span="1.5">-->
<!--            <i>已选择{{savedids.length+ids.length}}项</i>-->
<!--          </el-col>-->
        </el-row>

        <!-- 动态生成的表格 -->
        <div class="fixed-table-container" >
        <el-table :data="infoList" v-loading="loading" element-loading-background="rgba(255,255,255,1)" @selection-change="handleSelectionChange" :default-sort = "{prop: 'id', order: 'descending'}" height="80%" ref="dynamicTable" border>
          <el-table-column type="selection" width="55" align="center" />
          <el-table-column
            v-for="field in sortedFields"
            :key="field.name"
            :prop="field.name"
            :label="field.label"
            :sortable="true"
            :width="field.label.length * 11 + 65+'vh'"
          >
            <template slot-scope="scope">
              <el-tooltip class="item" effect="dark" :content="getTooltipContent(field.name, scope.row)" placement="top">
                <span class="truncate-text" v-if="field.name === 'archiveStatus'">{{ getArchiveStatus(scope.row.archiveStatus) }}</span>
                <span class="truncate-text" v-else-if="field.name === 'department'">{{ getDepartmentName(scope.row.department) }}</span>
                <span class="truncate-text"  v-html="scope.row[field.name]"></span>
              </el-tooltip>
            </template>
          </el-table-column>
          <el-table-column label="操作" width="150" align="center" fixed="right">
            <template slot-scope="scope">
              <el-button type="text" size="small" @click="handleDetail(scope.row)">
                <i class="el-icon-s-management">查看</i>
              </el-button>
            </template>
          </el-table-column>
        </el-table>
        <pagination
          v-show="total>0"
          :total="total"
          :page.sync="queryParams.pageNum"
          :limit.sync="queryParams.pageSize"
          @pagination="handleNextPage"
        />
        </div>
      </el-col>
    </el-row>

    <!-- 添加或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" append-to-body class="dialog-container" :before-close="handleClose" style="text-align: left;" fullscreen>
      <div class="background">
        <el-row>
          <el-col :span="24">
            <div class="grid-content bg-purple-dark"></div>
          </el-col>
        </el-row>
        <div class="grid-content bg-purple" disabled="true">
          <el-card class="box-card" style="width:100%">
            <el-form :model="form" :rules="rules" ref="form" class="form-dady">
              <!--第1组项目-->
              <el-descriptions :column="2" size="medium" border>
                <el-descriptions-item v-for="field in insertFieldsGroup1" :key="field.name">
                  <template slot="label">
                    <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                    <span v-else>{{ field.label }}</span>
                  </template>
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true" >
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="insertFieldsGroup1.length"></el-divider>
              <!--第2组项目-->
              <el-descriptions :column="2" size="medium" border>
                <el-descriptions-item v-for="field in insertFieldsGroup2" :key="field.name" :label="field.label">
                  <template slot="label">
                    <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                    <span v-else>{{ field.label }}</span>
                  </template>
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value"/>
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="insertFieldsGroup2.length"></el-divider>
              <!--第3组项目-->
              <el-descriptions :column="2" size="medium" border>
                <el-descriptions-item v-for="field in insertFieldsGroup3" :key="field.name" :label="field.label">
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
              <el-divider dashed v-if="insertFieldsGroup3.length"></el-divider>

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
      <div slot="footer" class="dialog1-footer">
        <el-button @click="close">关 闭</el-button>
      </div>
    </el-dialog>

    <!--文件预览对话框
    <el-dialog title="文件预览" :visible.sync="showPreview" fullscreen>
      <onlinePreview v-if="showPreview" :initialUrl="previewUrl"/>
    </el-dialog>-->
  </div>
</template>

<script>
import {getDicts} from "@/api/system/dict/data";
import {getItemByCategoryId} from "@/api/archive/item";
import {listCategory} from "@/api/archive/category";
import {deptTreeSelect} from "@/api/system/user";
import { getBeachList, getInfo, listInfo, sendInfo, updatAarchiveStatus } from '@/api/archive/info'
import categoryTree from "@/views/archive/category/categoryTree.vue";
import Treeselect from "@riophae/vue-treeselect";
import {treeselect} from "@/api/system/menu";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import * as XLSX from "xlsx";
import {getDept, listDept} from "@/api/system/dept";
import {pointRelation} from "@/api/archive/relation";
import {Base64} from "js-base64";
import {listFit} from "@/api/archive/fit";

export default {
  name: "Resources",
  components: {'file-tree': categoryTree, Treeselect},
  data() {
    return {
      keyword:'',
      drawer: false,
      loading: true,
      showSearch: true,
      total: 0,
      infoList: [],
      categoryId: null,
      categoryName: null,
      parentCategoryName: null,
      deptOptions: undefined,
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        archiveStatus: 1, //默认显示已归档数据
        searchValue: ''
      },
      ids:[],
      archiveNumbers:[],
      fields: [],
      queryFields: [],
      listFields: [],
      insertFieldsGroup1: [],
      insertFieldsGroup2: [],
      insertFieldsGroup3: [],
      fileOptions: [],
      electronicFiles: [],
      open: false,
      title: null,
      single: true,// 非单个禁用
      multiple: true, // 非多个禁用
      form: {categoryId: null, sysOssList: []},
      rules: {},
      ossParams: {},
      selectedItems: [],
      //预览相关
      showPreview: false,
      previewUrl:"",
      //文件上传相关
      isAutoUpload:false,
      //文件修改相关
      originalFile:-1,
      //部门列表
      departmentMap:{},
      //保存的ids
      savedids:[],
      isClick:true,
      fit:{},
      fitQuery:'',
      fitName:'',
    };
  },
  created() {
    this.getCategoryTreeList();
    this.getDeptTree();
    this.loadDepartments();
  },
  computed:{
    sortedFields(){
      return this.listFields.sort((a,b)=>{
        if(a.name === 'archiveStatus') return -1;
        if(b.name === 'archiveStatus') return 1;
        return 0;
      });
    },
    isselect(){
      return this.categoryId===null;
    },
  },
  methods: {
    treeselect,
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
    mapFieldData(field) {
      const fieldData = {
        name: this.toCamelCase(field.columnName),
        label: field.itemName,
        type: field.htmlType,
        htmlGroup: field.htmlGroup,
        maxLength: field.columnLength,
        isQuery: field.isQuery,
        isList: field.isList,
        isInsert: field.isInsert,
        isEdit: field.isEdit,
        isRequired: field.isRequired,
        dictType: field.dictType,
        options: []
      };

      if (field.dictType) {
        getDicts(field.dictType).then(response => {
          const options = response.data.map(item => ({
            label: item.dictLabel,
            value: item.dictValue
          }));
          fieldData.options = options;
        })
      } else {
        fieldData.options = [];
      }
      return fieldData;
    },

    toCamelCase(columnName) {
      return columnName.replace(/_([a-z])/g, (match, p1) => p1.toUpperCase());
    },
    getFieldDefinitions(categoryId) {
      getItemByCategoryId(categoryId).then(res => {
        this.fields = res.data.map(field => this.mapFieldData(field));
        // 根据不同的场景过滤字段
        this.queryFields = this.fields.filter(field => field.isQuery === '1');
        this.listFields = this.fields.filter(field => field.isList === '1');
        this.insertFieldsGroup1 = this.fields.filter(field => field.isInsert === '1' && field.htmlGroup === '1').sort((a, b) => a.sort - b.sort);
        this.insertFieldsGroup2 = this.fields.filter(field => field.isInsert === '1' && field.htmlGroup === '2').sort((a, b) => a.sort - b.sort);
        this.insertFieldsGroup3 = this.fields.filter(field => field.isInsert === '1' && field.htmlGroup === '3').sort((a, b) => a.sort - b.sort);
        this.editFields = this.fields.filter(field => field.isEdit === '1');
        this.editFields = this.fields.filter(field => field.isEdit === '1');
        this.fields.forEach(field => {
          this.$set(this.queryParams, field.name, null);
        });
        this.$set(this.queryParams, 'categoryId', this.categoryId);
      });
    },
    getCategoryTreeList() {
      listCategory().then(response => {
        listFit().then(res => {
        this.fitList = res.rows.map(item => {
          const parentName = response.data.find(data => data.id === item.categoryId);
          return {
            id: item.id,
            name: item.syllable,
            parentId: item.categoryId,
            password: null,
            type: 2,
            query: item.query,
            parentName: parentName.name,
          };
        });
        const data = response.data.concat(this.fitList)
        this.fileOptions = this.handleFileOptions(data, "id", "parentId");
      });
      }).then(() => {
        if(this.$refs.fileTree){
          this.$refs.fileTree.clear();
        }
        // this.getRouterPath();
      })
    },
    /** 查询部门下拉树结构 */
    getDeptTree() {
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
      });
    },
    handleFileOptions(data, idKey, parentKey) {
      const tree = [];
      const idMap = {};

      data.forEach(item => {
        idMap[item[idKey]] = { ...item, label: item.name, children: [] };
      });

      data.forEach(item => {
        const parent = idMap[item[parentKey]];
        if (parent) {
          parent.children.push(idMap[item[idKey]]);
        } else {
          tree.push(idMap[item[idKey]]);
        }
      });

      return tree;
    },
    handleNodeClick(nodeData) {
      if (this.isClick) {
        this.clearSearch()
        //选择档案节点不显示列表页面
        if (nodeData.type === 1) {
          this.categoryId = nodeData.id;
          this.isClick = false;
          if (nodeData.password !== null) {
            const promptUserForPassword = () => {
              this.$prompt('请输入密码', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                inputPlaceholder: '密码',
                type: 'warning'
              }).then(({ value }) => {
                // 在这里你可以处理输入的密码，比如验证
                if (value === nodeData.password) {
                  this.doList(nodeData)
                } else {
                  this.$message.error('密码错误，请重新输入');
                  promptUserForPassword();
                }
              }).catch(() => {
                this.isClick = true;
              });
            };
            promptUserForPassword();
          } else {
            this.doList(nodeData)
          }
        } else {
          this.categoryId = null;
        }
      }
    },
    handlePopoverClick(data){
      this.categoryId = data.parentId;
      this.categoryName = data.parentName;
      this.queryParams.categoryId = data.parentId;
      this.fitQuery = data.query;
      this.fitName = data.name;
      this.$set(this.queryParams, data.query, data.name);
      this.getList();
    },
    doList(nodeData) {
      this.categoryName = nodeData.name;
      this.queryParams.categoryId = nodeData.id;
      this.getFieldDefinitions(nodeData.id);
      this.getList();
      this.fitName = ''
      this.isClick = true;
    },
    handleQuery() {
      this.queryParams.categoryId = this.categoryId;
      this.queryParams.archiveStatus = 1;
      this.getList();
    },
    handleQueryBeach(){
      this.queryParams.categoryId = this.categoryId;
      this.queryParams.archiveStatus = 1;
      if(this.queryParams.ossStatus === ""){
        this.queryParams.ossStatus = null;
      }
      getBeachList(this.queryParams).then(response => {
        if (response.rows.length > 0) {
          this.infoList = response.rows;
          this.total = response.total;
        }
      });
    },
    resetQuery() {
      this.queryParams = {
        categoryId: this.categoryId,
        pageNum: 1,
        pageSize: 10,
        archiveStatus: 1,
      };
      this.queryFields.forEach(field => {
        this.$set(this.queryParams, field.name, '');
      });
      this.getList();
    },
    /** 查询档案信息列表 */
    getList() {
      this.loading = true;
      const params = {
        ...this.queryParams, // 保留现有的查询参数
        pageNum: this.queryParams.pageNum, // 当前页码
        pageSize: this.queryParams.pageSize, // 每页显示条数
        archiveStatus: 1 // 归档状态
      };
      listInfo(params).then(response => {
        if(this.queryParams.searchValue) {
          this.infoList = this.markMatches(response.rows);
        }else {
          this.infoList = response.rows;
        }
        this.total = response.total;
        this.$nextTick(() => {
          setTimeout(() => {
            this.$refs.dynamicTable.doLayout(); // 延迟0.1秒后调用
          }, 100);
          setTimeout(() => {
            this.isClick = true;
            this.loading = false;
          }, 300);
        })
      });
    },
    markMatches(data) {
      if (!this.queryParams.searchValue) return data;
      const regex = new RegExp(this.queryParams.searchValue, 'gi');
      return data.map(record => {
        const highlightedRecord = {};
        for (const [key, value] of Object.entries(record)) {
          if (typeof value === 'string') {
            highlightedRecord[key] = value.replace(regex, match => `<span style="color: red;">${match}</span>`);
          } else {
            highlightedRecord[key] = value;
          }
        }
        return highlightedRecord;
      });
    },
    // 表单重置
    reset() {
      this.form = {categoryId: null , sysOssList: []};
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.selectedItems = selection;
      this.ids = selection.map(item => item.id)
      this.archiveNumbers = selection.map(item => item.archiveNumber)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 对话框关闭操作 */
    close() {
      this.open = false;
      this.reset();
    },
    /** 对话框关闭操作 */
    handleClose(done) {
      // 实现当 handleClose 被调用时应该发生的逻辑
      // 例如，你可能想要显示一个确认对话框
      this.$confirm('确定要关闭这个对话框吗？')
        .then(() => {
          this.reset();
          done(); // 当你想要关闭对话框时调用 done()
        })
        .catch(() => {});
    },
    /** 导出按钮操作 */
    // 文件导出逻辑
    handleExport() {
      let dataToExport
      if (this.selectedItems.length > 0) {
        dataToExport = this.selectedItems;
        this.exportToExcel(dataToExport);
      } else {
        let ExportQueryParams = {
          pageNum: 1,
          pageSize: 10000000,
          categoryId: null,
          archiveStatus: 1,
          searchValue: ''
        }
        this.$set(ExportQueryParams,this.fitQuery,this.fitName);
        listInfo(ExportQueryParams).then(res => {
          dataToExport = res.rows;
          this.exportToExcel(dataToExport);
        })
      }
    },
    //文件导出
    exportToExcel(dataToExport) {
      if (!Array.isArray(this.listFields)) {
        return;
      } else {
        // 提取表头：使用 listFields 中的 label 作为表头
        const headers = this.listFields.map(field => ({label: field.label}));
        const data = dataToExport.map(item => {
          let row = {};
          this.listFields.forEach(field => {
            row[field.label] = item[field.name];
          });
          return row;
        });
        const ws = XLSX.utils.json_to_sheet(data);
        const wb = XLSX.utils.book_new();
        XLSX.utils.book_append_sheet(wb, ws, '档案信息');
        XLSX.writeFile(wb, `archive_${new Date().getTime()}.xlsx`);
      }
    },
    //文件查看
    handleDetail(row) {
      try{
        this.$refs['form'].resetFields();
      }catch{}
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = this.categoryName + "详情";
      });
    },
    //文件预览
    handleFilePreview(url) {
      // this.previewUrl = url;
      // this.showPreview = true;
      const encodedUrl = encodeURIComponent(Base64.encode(process.env.VUE_APP_FILE_SERVER_BASE_URL + url));
      // 打开新页面并调用在线预览接口
      window.open(process.env.VUE_APP_KKFILEVIEW_BASE_URL + '/onlinePreview?url=' + encodedUrl);
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
    // 文件下载
    handleFileDownload(url) {
      this.$download.resource(url);
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
    getTooltipContent(fieldName,row) {
      if(fieldName === 'archiveStatus') {
        return this.getArchiveStatus(row.archiveStatus);
      }else if(fieldName === 'department') {
        return this.getDepartmentName(row.department);
      }else {
        return this.getTexted(String(row[fieldName]));
      }
    },
    getArchiveStatus(status){
      switch (status) {
        case 0:
          return '未归档';
        case 1:
          return '已归档';
        case 2:
          return '利用';
        default:
          return '未知状态';
      }
    },
    handleDocument() {
      if(this.ids.length >= 1){
        const ids = this.ids;
        this.$modal.confirm('确认回档选中数据？').then(()=> {
          this.$modal.loading("正在处理中");
          return updatAarchiveStatus(ids)
        }).then(() => {
          this.$modal.closeLoading();
          this.getList();
          this.$modal.msgSuccess("回档成功");
        }).catch(() => {
        });
      }else {
        this.$modal.confirm('确认回档全部' + this.total + '条数据？').then(async () => {
          this.$modal.loading("正在处理中");
          const pageTotal = Math.ceil(this.total / 3000);
          const ExportQueryParams = {
            pageNum: 1,
            pageSize: 3000,
            categoryId: this.categoryId,
            archiveStatus: 1,
            searchValue: ''
          };
          this.$set(ExportQueryParams, this.fitQuery,this.fitName);
          // 定义递归函数
          const fetchAndProcessPageData = async (pageNum, pageTotal, concurrency = 5) => {
            try {
              if (pageNum > pageTotal) {
                // 达到页数上限，递归结束
                this.$modal.closeLoading();
                this.getList();
                this.$modal.msgSuccess("回档成功");
                return;
              }
              ExportQueryParams.pageNum = pageNum;
              const res = await listInfo(ExportQueryParams);
              const ids = res.rows ? res.rows.map(item => item.id) : [];
              const batchSize = 400;
              const batchCount = Math.ceil(ids.length / batchSize);
              const tasks = [];
              const batchList = [];
              for (let i = 0; i < batchCount; i++) {
                const start = i * batchSize;
                const end = Math.min(start + batchSize, ids.length);
                const list = ids.slice(start, end);
                batchList.push(list);
              }
              const taskcount = Math.floor(batchList.length / concurrency)
              const last = batchList.length % concurrency
              for (let index = 0; index < taskcount; index++) {
                for (let i = 0; i < concurrency; i++) {
                  const list = batchList[i + index * concurrency];
                  tasks.push(updatAarchiveStatus(list).then(() => list.length));
                }
                await Promise.all(tasks);
              }
              if (last !== 0) {
                for (let i = 0; i < last; i++) {
                  const list = batchList[i + taskcount * concurrency];
                  tasks.push(updatAarchiveStatus(list).then(() => list.length));
                }
                await Promise.all(tasks);
              }
              // 递归调用，处理下一页
              await fetchAndProcessPageData(pageNum + 1, pageTotal, concurrency);
            } catch (error) {
              this.$modal.closeLoading();
              this.$modal.msgError("回档失败：" + error.message);
              console.error("回档失败：", error);
            }
          };

          // 调用递归函数，从第1页开始
          await fetchAndProcessPageData(1, pageTotal);
        })
      }
    },
    getTexted(name){
      name = name.replace(/<\/?span[^>]*>/g, '');
      return name;
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
    //文件打印
    handlePrint() {
        pointRelation(this.categoryId).then(response => {
          if(response.name){
            let ids = ''
            if (this.selectedItems.length > 0) {
              this.savedids = this.ids;
              ids = this.savedids.join(',');
              print(response.name,ids)
            }
            else {
              let listids = []
              let ExportQueryParams = {
                pageNum: 1,
                pageSize: 10000000,
                categoryId: this.categoryId,
                archiveStatus: 1,
                searchValue: ''
              }
              this.$set(ExportQueryParams, this.fitQuery,this.fitName);
              listInfo(ExportQueryParams).then(res => {
                listids = res.rows.map(item => item.id)
                ids = listids.join(',');
                print(response.name,ids)
                }
              )
            }
          }else {
            this.$message.error("未找到打印模板");
          }
        })
        const print = (name,ids)=>{
          const tpl_name = name;
          const pageIndex = 1;     // 页码
          const renderOption = 1;  // 渲染选项
          const url = `/ureport/preview?_u=mysql:${tpl_name}&_i=${pageIndex}&_r=${renderOption}&ids=${ids}`;
          window.open(url, '_blank');
        }
    },
    handleNextPage(){
      // this.savedids = this.savedids.concat(this.ids);
      this.getList();
    },
    handleSendUtilize(){
      if(this.ids.length >= 1){
        const ids = this.ids;
        this.$modal.confirm('确认发送利用选中数据？').then(()=> {
          this.$modal.loading("正在处理中");
          return sendInfo(ids)
        }).then(() => {
          this.$modal.closeLoading();
          this.getList();
          this.$modal.msgSuccess("发送成功");
        }).catch(() => {
        });
      }else {
        this.$modal.confirm('确认发送利用全部' + this.total + '条数据？').then(async () => {
          this.$modal.loading("正在处理中");
          const pageTotal = Math.ceil(this.total / 3000);
          const ExportQueryParams = {
            pageNum: 1,
            pageSize: 3000,
            categoryId: this.categoryId,
            archiveStatus: 1,
            searchValue: ''
          };
          this.$set(ExportQueryParams, this.fitQuery,this.fitName);
          // 定义递归函数
          const sendPageData = async (pageNum, pageTotal, concurrency = 5) => {
            try {
              if (pageNum > pageTotal) {
                // 达到页数上限，递归结束
                this.$modal.closeLoading();
                this.getList();
                this.$modal.msgSuccess("发送成功");
                return;
              }
              ExportQueryParams.pageNum = pageNum;
              const res = await listInfo(ExportQueryParams);
              const ids = res.rows ? res.rows.map(item => item.id) : [];
              const batchSize = 400;
              const batchCount = Math.ceil(ids.length / batchSize);
              const tasks = [];
              const batchList = [];
              for (let i = 0; i < batchCount; i++) {
                const start = i * batchSize;
                const end = Math.min(start + batchSize, ids.length);
                const list = ids.slice(start, end);
                batchList.push(list);
              }
              const taskcount = Math.floor(batchList.length / concurrency)
              const last = batchList.length % concurrency
              for (let index = 0; index < taskcount; index++) {
                for (let i = 0; i < concurrency; i++) {
                  const list = batchList[i + index * concurrency];
                  tasks.push(sendInfo(list).then(() => list.length));
                }
                await Promise.all(tasks);
              }
              if (last !== 0) {
                for (let i = 0; i < last; i++) {
                  const list = batchList[i + taskcount * concurrency];
                  tasks.push(sendInfo(list).then(() => list.length));
                }
                await Promise.all(tasks);
              }
              // 递归调用，处理下一页
              await sendPageData(pageNum + 1, pageTotal, concurrency);
            } catch (error) {
              this.$modal.closeLoading();
              this.$modal.msgError("发送失败：" + error.message);
              console.error("发送失败：", error);
            }
          };
          // 调用递归函数，从第1页开始
          await sendPageData(1, pageTotal);
        })
      }
    },
    clearSearch() {
      this.categoryId = null;
      this.queryParams= {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        archiveStatus: 1, //默认显示待归档数据
        searchValue: ''
      }
    },
  }
};
</script>
<style scoped>
/* 未选择分类，水平垂直居中对齐内容 */
.no-selection {
  display: flex; /* 使用Flexbox布局 */
  flex-direction: column; /* 垂直排列子元素 */
  align-items: center; /* 水平居中子元素 */
  justify-content: center; /* 垂直居中子元素 */
  height: 100%; /* 确保容器高度占满父元素 */
  text-align: center; /* 文字居中对齐 */
  min-height: 500px; /* 设置最小高度，以确保居中效果 */
}

/* 未选择分类图片居中并具有适当的大小 */
.file-center {
  width: 200px; /* 调整图片宽度至适当大小 */
  height: auto; /* 保持图片宽高比 */
  margin-bottom: 20px; /* 在图片和文本之间添加间距 */
}

/* 未选择分类 */
.file-fontcenter {
  color: #414141; /* 设置文本颜色为深灰色 */
  font-size: 16px; /* 调整字体大小以提高可读性 */
  margin-top: 10px; /* 在文本和前面的元素（如图片）之间添加间距 */
}

/* 高级搜索 按钮 */
.form-button-wrapper {
  text-align: center;
  margin-top: 10px;
}

/* 添加编辑画面 */
.dialog-container {
  padding: 0 !important;
  margin-top: 0 !important;
}

.required-label::after {
  content: '*';
  color: #F56C6C;
  margin-right: 4px;
}
.truncate-text {
  display: block;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 100%; /* Adjust as needed */
}
.item {
  display: inline-block;
}
.butten-column {
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items:center;
}
.butten-column button {
  margin: 0;
  padding: 10px;
}
.fixed-table-container {
  top: 200px;
  width: auto;
  max-width: 70%;
  height: 80%;
  overflow-x: auto;
  position: fixed;
}
</style>
