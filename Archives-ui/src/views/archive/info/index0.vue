<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!-- 档案分类树形结构 -->
      <el-col :span="4" :xs="24">
        <file-tree :file-options="fileOptions" @node-click="handleNodeClick" :default-expand-all="false" ref="fileTree"
          :isClick="isClick"></file-tree>
      </el-col>

      <!-- 未选择档案库时显示该画面 -->
      <el-col :span="20" :xs="24" v-show="isselect">
        <div class="no-selection">
          <img src="@/assets/images/lock.png" class="file-center">
          <p class="file-fontcenter">请选择左侧档案库</p>
        </div>
      </el-col>

      <el-col :span="20" :xs="24" v-show="showPasswordPrompt">
        <div class="password-prompt">
          <div>
            <div>请输入密码</div>
            <div>
              <el-input v-model="passwordInput" placeholder="请输入密码" show-password></el-input>
            </div>
            <div>
              <el-button type="primary" @click="handleConfirmPassword">确定</el-button>
            </div>
          </div>
        </div>
      </el-col>

      <!-- 档案信息展示 -->
      <el-col :span="20" :xs="24" v-show="categoryId && !showPasswordPrompt">
        <!-- 单一框的搜索条件 -->
        <div class="archives-style">
          <el-input class="input" v-model="saveSearch.searchValue" size="small" placeholder="快速搜索"
            style="width: 20%; margin-right: 10px;"></el-input>
          <el-button icon="el-icon-refresh" type="primary" size="small" @click="resetQuery" plain>重置</el-button>
          <el-button type="primary" icon="el-icon-search" size="small" @click="handleQuery">搜索</el-button>
          <el-button @click="drawer = true" plain class="Senior-button" icon="el-icon-arrow-down" type="success"
            size="small">高级搜索</el-button>
        </div>

        <!-- 高级搜索抽屉 -->
        <el-drawer class="search-drawer" title="高级搜索" :visible.sync="drawer" :with-header="true">
          <el-form :model="saveSearch" ref="queryForm" size="small" :inline="true" v-show="showSearch"
            label-width="100px">
            <el-form-item v-for="field in queryFields" :key="field.name" :label="field.label" :prop="field.name">
              <component :is="getComponentType(field.type)" v-model="saveSearch[field.name]"
                v-bind="getComponentProps(field)">
                <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                  :label="option.label" :value="option.value" />
                <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                  :label="option.label" :value="option.value" />
                <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                  :label="option.label" :value="option.value" />
              </component>
            </el-form-item>
          </el-form>

          <div class="form-button-wrapper">
            <el-button type="primary" icon="el-icon-search" size="small" @click="handleQueryBeach(1)" :disabled="!isClick">搜索</el-button>
            <el-button icon="el-icon-refresh" size="small" @click="resetQuery()">重置</el-button>
          </div>

        </el-drawer>

        <!-- 功能按钮区 -->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button type="primary" icon="el-icon-plus" size="small" @click="handleAdd"
              v-hasPermi="['archive:info:add']">录入</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="danger" icon="el-icon-delete" size="small" :disabled="multiple" @click="handleDelete"
              v-hasPermi="['archive:info:remove']">删除</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="warning" icon="el-icon-download" size="small" @click="handleExport"
              v-hasPermi="['archive:info:export']">导出</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="success" icon="el-icon-s-flag" size="small" @click="handleDocument">归档</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="success" icon="el-icon-s-flag" size="small" @click="handlePrint">打印</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button type="deanger" icon="el-icon-s-promotion" size="small"
              @click="handleBatchDelete">一键删除</el-button>
          </el-col>
        </el-row>

        <!-- 动态生成的表格 -->
        <div class="fixed-table-container">
          <el-table :data="infoList" v-loading="loading" element-loading-background="rgba(255,255,255,1)"
            @selection-change="handleSelectionChange" :default-sort="{ prop: 'id', order: 'descending' }" height="80%"
            ref="dynamicTable" border>
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column v-for="field in sortedFields" :key="field.name" :prop="field.name" :label="field.label"
              :sortable="true" :width="field.label.length * 11 + 65 + 'vh'">
              <template slot-scope="scope">
                <el-tooltip class="item" effect="dark" :content="getTooltipContent(field.name, scope.row)"
                  placement="top">
                  <span class="truncate-text" v-if="field.name === 'archiveStatus'">{{
                    getArchiveStatus(scope.row.archiveStatus) }}</span>
                  <span class="truncate-text" v-else-if="field.name === 'department'">{{
                    getDepartmentName(scope.row.department) }}</span>
                  <span class="truncate-text" v-else-if="field.name === 'ossStatus'">{{
                    getOssStatus(scope.row.ossStatus) }}</span>
                  <span class="truncate-text" v-html="scope.row[field.name]"></span>
                </el-tooltip>
              </template>
            </el-table-column>
            <el-table-column label="操作" width="150" align="center" fixed="right" height="440">
              <template slot-scope="scope">
                <el-button type="text" size="small" @click="handleUpdate(scope.row)">
                  <i class="el-icon-edit">修改</i>
                </el-button>
                <el-button type="text" size="small" @click="handleDetail(scope.row)">
                  <i class="el-icon-s-management">查看</i>
                </el-button>
              </template>
            </el-table-column>
          </el-table>
          <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum"
            :limit.sync="queryParams.pageSize" @pagination="handleNextPage" />
        </div>
      </el-col>
    </el-row>

    <!-- 添加或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" append-to-body class="dialog-container" :before-close="handleClose"
      style="text-align: left;" fullscreen>
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
                <el-descriptions-item v-for="field in insertFieldsGroup1" :key="field.name">
                  <template slot="label">
                    <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                    <span v-else>{{ field.label }}</span>
                  </template>
                  <el-form-item :prop="field.name" class="form-item">
                    <component :is="getComponentType(field.type)" v-model="form[field.name]"
                      v-bind="getComponentProps(field)" :readonly="isReadonly(field)">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
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
                    <component :is="getComponentType(field.type)" v-model="form[field.name]"
                      v-bind="getComponentProps(field)" :readonly="isReadonly(field)">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
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
                    <component :is="getComponentType(field.type)" v-model="form[field.name]"
                      v-bind="getComponentProps(field)" :readonly="isReadonly(field)">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                        :label="option.label" :value="option.value" />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="insertFieldsGroup3.length"></el-divider>
              <el-row v-loading="!isElCardBodyLoading" element-loading-text="录入中，请稍候..."
                element-loading-svg="<svg class='circular' viewBox='25 25 50 50'><circle class='path' cx='50' cy='50' r='20' fill='none' stroke-width='4' stroke-miterlimit='10'/></svg>"
                element-loading-svg-view-box="0 0 100 100">
                <el-row>
                  <el-col :span="24">
                    <div>
                      <el-button type="primary" plain icon="el-icon-upload" size="small" @click="handleUpload"
                        v-if="notCheck()">点击按钮上传</el-button>
                      <el-button type="success" plain icon="el-icon-download" size="small" @click="handleBatchDownload"
                        v-if="notInsert()">批量下载</el-button>
                    </div>
                    <el-table :data="form.sysOssList" style="width: 100%; margin-top: 10px;">
                      <el-table-column type="index" label="序号" width="50">
                        <template slot-scope="scope">{{ getIndex(scope.$index) }}</template>
                      </el-table-column>
                      <el-table-column prop="name" label="文件名称"></el-table-column>
                      <el-table-column prop="suffix" label="文件类型" width="120"></el-table-column>
                      <el-table-column prop="fileSize" label="文件大小" width="120">
                        <template slot-scope="scope">{{ formatSize(scope.row.size) }}</template>
                      </el-table-column>
                      <el-table-column label="操作" width="120">
                        <template slot-scope="scope">
                          <div class="butten-column">
                            <el-button @click="handleFileDownload(scope.row.url)" size="small"
                              v-if="notInsert()">下载</el-button>
                            <el-button type="danger" @click="handleFileDelete(scope.$index)" size="small"
                              v-if="notCheck()">删除</el-button>
                            <el-button type="success" @click="handleFilePreview(scope.row.url)" size="small"
                              v-if="isCheck()">预览</el-button>
                          </div>
                        </template>
                      </el-table-column>
                    </el-table>
                  </el-col>
                </el-row>
              </el-row>
              <!--文件上传对话框-->
              <el-dialog title="文件上传" :visible.sync="showDialog" width="800px" append-to-body class="dialog-container">
                <el-form-item label="" prop="url">
                  <file-upload :limit="5" :fileSize="1000"
                    :fileType="['doc', 'xls', 'ppt', 'txt', 'pdf', 'xlsx', 'jpg', 'png', 'mp4']"
                    :auto-upload="isAutoUpload" @input="returnFiles" @info="handleFileUpload" ref="fileUpload" />
                </el-form-item>
                <div slot="footer" class="dialog-footer">
                  <el-button type="primary" @click="clickShow()">确 定</el-button>
                  <el-button @click="cancelUpload">取 消</el-button>
                </div>
              </el-dialog>

            </el-form>
          </el-card>
        </div>
      </div>
      <div slot="footer" class="dialog1-footer">
        <el-button type="primary" @click="submitForm" v-if="notCheck()" :disabled="isSubmit">确 定</el-button>
        <el-button @click="cancel" v-if="notCheck()">取 消</el-button>
        <el-button @click="close" v-if="isCheck()">关 闭</el-button>
      </div>
    </el-dialog>

    <!--文件预览对话框
    <el-dialog title="文件预览" :visible.sync="showPreview" fullscreen>
      <onlinePreview v-if="showPreview" :initialUrl="previewUrl"/>
    </el-dialog>-->
  </div>
</template>


<script>
import categoryTree from '@/views/archive/category/categoryTree.vue';
import { addInfo, delInfo, getInfo, listInfo, updatAarchiveStatus, updateInfo, getBeachList, getDelCount, getDeleteCountBySearch } from "@/api/archive/info";
import { getCategory, listCategory } from '@/api/archive/category'
import { getItemByCategoryId } from "@/api/archive/item";
import { getDicts } from "@/api/system/dict/data";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import { deptTreeSelect } from "@/api/system/user";
import * as XLSX from 'xlsx'
import { listDept } from "@/api/system/dept";
import { pointRelation } from "@/api/archive/relation";
import { Base64 } from "js-base64";
import { addImportLog, updateImportLog } from "@/api/archive/importLog";
import { listFit } from "@/api/archive/fit";
import { addPlaceonlog, delPlaceonlog, getPlaceonlog, listPlaceonlog, updatePlaceonlog } from "@/api/archive/placeonlog";
export default {
  name: "Info",
  components: {
    'file-tree': categoryTree, Treeselect
  },
  data() {
    return {
      keyword: '',
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
        archiveStatus: 0, //默认显示待归档数据
        searchValue: ''
      },
      ids: [],
      archiveNumbers: [],
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
      form: { categoryId: null, sysOssList: [] },
      rules: {},
      showDialog: false,
      ossParams: {},
      selectedItems: [],
      choice: 2,
      //预览相关
      showPreview: false,
      previewUrl: "",
      //文件上传相关
      isAutoUpload: false,
      //文件修改相关
      originalFile: -1,
      //部门列表
      departmentMap: {},
      //选中的数组
      savedids: [],
      deleteQuery: {},
      uploadCount: 0,
      successList: [],
      isElCardBodyLoading: true,
      isClick: true,
      isCheckBySearch: false,//检查是否为高级搜索
      saveSearch: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        archiveStatus: 0, //默认显示待归档数据
        searchValue: ''
      },//搜索框内容
      logQueryParams: {
        status: '',                 // 初始状态
        infoProcessedRecords: 0,         // info 表的已处理记录数初始化为 0
        ossProcessedRecords: 0,          // oss 表的已处理记录数初始化为 0
        infoImportRecords: 0,            // info 表的待导入记录数初始化为 0
        ossImportRecords: 0,             // oss 表的待导入记录数初始化为 0
        startTime: '', // 返回包含日期和时间的字符串
        type: '',
      },
      showPasswordPrompt: false,//是否显示密码输入框
      passwordInput: '',//密码
      optionsPass: [],
      fitList: [],
      isSubmit: false,
      placeon: {},//归档信息
    };
  },
  created() {
    this.clearSearch()
    this.getCategoryTreeList();
    this.getDeptTree();
    this.loadDepartments();
  },
  activated() {
    this.clearSearch()
    this.getCategoryTreeList();
  },
  computed: {
    sortedFields() {
      return this.listFields.sort((a, b) => {
        if (a.name === 'archiveStatus') return -1;
        if (b.name === 'archiveStatus') return 1;
        return 0;
      });
    },
    isselect() {
      return this.categoryId === null;
    },
  },
  watch: {
    infoList: {
      handler(newValue, oldValue) {
        this.$refs.dynamicTable.doLayout();//对table进行重新布局
      },
      deep: true//监听对象内部属性变化
    }
  },
  methods: {
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
          return field.type === 'textarea' ? { type: 'textarea', placeholder: `请输入${field.label}` } : { placeholder: `请输入${field.label}` };
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

        //初始化校验
        this.generateRules();
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
          this.fileOptions = this.handleFileOptions(response.data, "id", "parentId");
        });
      }).then(() => {
        if (this.$refs.fileTree) {
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
            this.loading = false;
            this.isClick = true;
            this.showPasswordPrompt = true; // 显示密码输入框
          } else {
            this.showPasswordPrompt = false;
            this.doList(nodeData)
          }
        } else if (nodeData.type === 0) {
          this.categoryId = null;
          this.showPasswordPrompt = false;
        } else {
          this.categoryId = nodeData.parentId;
          if (this.optionsPass.find(t => t.id === nodeData.parentId)) {
            this.showPasswordPrompt = true;
            if (this.optionsPass.find(p => p.status === 'pass')) {
              this.queryParams.categoryId = nodeData.parentId;
              this.categoryName = nodeData.parentName;
              this.$set(this.queryParams, nodeData.query, nodeData.label);
              this.getList();
            }
          } else {
            this.queryParams.categoryId = nodeData.parentId;
            this.categoryName = nodeData.parentName;
            this.$set(this.queryParams, nodeData.query, nodeData.label);
            this.getList();
          }
        }
      }
    },
    handleConfirmPassword() {
      getCategory(this.categoryId).then(response => {
        if (response.data.password === this.passwordInput) {
          this.loading = false;
          this.isClick = true;
          this.showPasswordPrompt = false;
          const nodeData = { id: response.data.id, name: response.data.name }
          this.doList(nodeData)
        } else {
          this.$message.error("密码错误");
          this.passwordInput = '';
        }
      })
    },
    doList(nodeData) {
      this.categoryName = nodeData.name;
      this.queryParams.categoryId = nodeData.id;
      this.getFieldDefinitions(nodeData.id);
      this.getList();
      this.isClick = true;
    },
    handleQuery() {
      if (this.isClick) {
        this.isClick = false;
        this.queryParams = {
          categoryId: this.categoryId,
          archiveStatus: 0,
          searchValue: this.saveSearch.searchValue,
          pageNum: 1,
          pageSize: this.queryParams.pageSize
        }
        this.saveSearch = {
          searchValue: this.saveSearch.searchValue,
          pageNum: 1,
          pageSize: 10,
          archiveStatus: 0,
          categoryId: this.categoryId
        }
        this.deleteQuery.searchValue = this.queryParams.searchValue;
        this.getList();
      }
    },
    handleQueryBeach(pn) {
      if (this.isClick) {
        this.isClick = false;
        this.isCheckBySearch = true;
        this.queryParams.categoryId = this.categoryId;
        this.queryParams.pageNum = pn ? pn : this.queryParams.pageNum;
        this.queryParams.archiveStatus = 0;
        this.queryFields.forEach(field => {
          this.$set(this.queryParams, field.name, this.saveSearch[field.name]);
        });
        this.saveSearch.searchValue = '';
        this.queryParams.searchValue = '';
        if (this.queryParams.ossStatus === "") {
          this.queryParams.ossStatus = null;
        }
        getBeachList(this.queryParams).then(response => {
          this.deleteQuery = this.queryParams
          this.infoList = response.rows;
          this.total = response.total;
          setTimeout(() => {
            this.isClick = true;
          }, 1000);
        });
      }
    },
    resetQuery() {
      if (this.isClick) {
        this.isClick = false;
        this.isCheckBySearch = false;
        this.queryParams = {
          categoryId: this.categoryId,
          pageNum: 1,
          pageSize: 10,
          archiveStatus: 0,
          searchValue: ''
        };
        this.saveSearch = this.queryParams;
        this.deleteQuery = this.queryParams;
        this.queryFields.forEach(field => {
          this.$set(this.queryParams, field.name, '');
        });
        this.getList();
      }
    },
    /** 查询档案信息列表 */
    getList() {
      this.loading = true;
      // 确保保留原有的查询参数，并更新分页信息
      const params = {
        ...this.queryParams, // 保留现有的查询参数
        pageNum: this.queryParams.pageNum, // 当前页码
        pageSize: this.queryParams.pageSize, // 每页显示条数
        archiveStatus: 0 // 归档状态
      };
      listInfo(params).then(response => {
        if (this.queryParams.searchValue) {
          this.infoList = this.markMatches(response.rows);
        } else {
          this.infoList = response.rows;
        }
        this.total = response.total;
        this.$nextTick(() => {
          setTimeout(() => {
            this.isClick = true;
            this.loading = false;
          }, 400);
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
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      try {
        this.$refs['form'].resetFields();
      } catch {
      }
      this.open = true;
      this.choice = 0;
      this.title = this.categoryName + '录入';
    },
    // 取消按钮
    cancel() {
      this.close()
      if (this.$refs.fileUpload) {
        this.$refs.fileUpload.resetFileList()
      }
    },
    //上传取消按钮
    cancelUpload() {
      this.showDialog = false
      if (this.$refs.fileUpload) {
        this.$refs.fileUpload.resetFileList()
      }
    },
    /** 对话框关闭操作 */
    close() {
      this.open = false;
      this.choice = 2;
      this.reset();
    },
    /** 对话框关闭操作 */
    handleClose(done) {
      // 实现当 handleClose 被调用时应该发生的逻辑
      // 例如，你可能想要显示一个确认对话框
      this.$confirm('确定要关闭这个对话框吗？')
        .then(() => {
          this.choice = 2;
          this.reset();
          done(); // 当你想要关闭对话框时调用 done()
        })
        .catch(() => {
        });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.choice = 1;
      this.reset();
      try {
        this.$refs['form'].resetFields();
      } catch {
      }
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.originalFile = response.data.sysOssList.length
        this.title = this.categoryName + "修改";
      });
    },
    //修改查询条件
    isQuery(id) {
      this.ossParams = {
        fid: id,
        deleteFlg: 0,
      }
    },
    reset() {
      this.form = { categoryId: null, sysOssList: [] };
    },
    /** 提交按钮 */
    async submitForm() {
      if (!this.isSubmit) {
        this.$refs["form"].validate(async valid => {
          this.form.categoryId = this.categoryId;
          if (valid) {
            this.isSubmit = true;
            this.isElCardBodyLoading = false;
            if (this.form.id != null && this.form.id != undefined) {
              const newSysOssList = this.form.sysOssList.slice(this.originalFile)
              if (newSysOssList.length > 0 && this.$refs.fileUpload) {
                this.uploadCount = newSysOssList.length
                await this.$refs.fileUpload.handleUpload(newSysOssList);
              }
              await updateInfo(this.form)
                .then(() => {
                  this.isElCardBodyLoading = true
                  this.$modal.msgSuccess("修改成功");
                  this.closeAndRefresh();
                  this.reset();
                  this.getList();
                  this.isSubmit = false;
                  if (this.$refs.fileUpload) {
                    this.$refs.fileUpload.resetFileList();
                  }
                })
                .catch(error => {
                  this.isElCardBodyLoading = true
                  this.$modal.msgError("修改失败，请重试");
                });

            } else {
              this.logQueryParams.infoImportRecords = 1;
              this.logQueryParams.ossImportRecords = 0;
              this.logQueryParams.startTime = new Date().toLocaleString();
              this.logQueryParams.status = 'pending';
              this.logQueryParams.type = 'luru';
              if (this.form.sysOssList.length > 0 && this.$refs.fileUpload) {
                const sysOssList = this.form.sysOssList.map(file => ({
                  deleteFlg: file.deleteFlg,
                  name: file.name,
                  percentage: file.percentage,
                  raw: file.raw,
                  size: file.size,
                  status: file.status,
                  uid: file.uid,
                  url: file.url,
                  fid: file.fid,
                  suffix: file.suffix,
                }))
                this.uploadCount = sysOssList.length
                this.logQueryParams.ossImportRecords = sysOssList.length;
                await this.$refs.fileUpload.handleUpload(sysOssList);
              }
              await addImportLog(this.logQueryParams).then(res => {
                this.logQueryParams.id = res.data.id;
              });
              await addInfo(this.form).then(() => {
                this.isElCardBodyLoading = true
                this.$modal.msgSuccess("新增成功");
                this.logQueryParams.infoProcessedRecords = 1;
                this.logQueryParams.ossProcessedRecords = this.form.sysOssList.length;
                this.logQueryParams.status = 'completed';
                updateImportLog(this.logQueryParams)
                this.closeAndRefresh();
                this.reset();
                this.getList();
                this.isSubmit = false;
                if (this.$refs.fileUpload) {
                  this.$refs.fileUpload.resetFileList();
                }
              }).catch(error => {
                this.isSubmit = false;
                this.isElCardBodyLoading = true;
                this.$modal.msgError("录入失败，请重试");
              });

            }
          }
        });
      }
    },
    returnFiles(fileList) {
      this.uploadCount--;
      if (this.uploadCount < 1) {
        this.successList = fileList;
        if (this.$refs.fileUpload) {
          this.$refs.fileUpload.resetFileList();
        }
        if (this.originalFile > -1) {
          this.form.sysOssList = this.form.sysOssList.filter(item => item.url)
          this.form.sysOssList = this.form.sysOssList.concat(this.successList)
        } else {
          this.form.sysOssList = this.successList;
        }
      }
    },

    closeAndRefresh() {
      this.open = false;
    },
    //文件上传
    handleFileUpload(fileList) {
      fileList.forEach(file => {
        const nameParts = file.name.split(".");
        file.suffix = nameParts.length > 1 ? nameParts[nameParts.length - 1] : "";
      })
      this.form.sysOssList = this.form.sysOssList.concat(fileList)
    },
    clickShow() {
      if (this.$refs.fileUpload) {
        this.$refs.fileUpload.confirm();
      }
      this.showDialog = false
    },
    /** 删除按钮操作 */
    handleDelete() {
      const ids = this.ids;
      this.$modal.confirm('确认删除选中数据？').then(() => {
        return delInfo(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {
      });
    },

    // 多选框选中数据
    handleSelectionChange(selection) {
      this.selectedItems = selection;
      this.ids = selection.map(item => item.id)
      this.archiveNumbers = selection.map(item => item.archiveNumber)
      this.single = selection.length !== 1
      this.multiple = !selection.length
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
        if (field.isRequired === '1') {
          const parentheseIndex = field.label.indexOf('（');
          const comment = parentheseIndex !== -1 ? field.label.substring(0, parentheseIndex) : field.label;
          fieldRules.push({
            required: true,
            message: `${comment}不能为空`,
            trigger: field.type === 'select' || 'treeselect' ? 'change' : 'blur'
          });
        }

        // 最大长度校验
        if (field.type !== 'select' && field.type !== 'treeselect' && field.maxLength) {
          if (field.name === 'field3') {
            fieldRules.push({
              validator: (rule, value, callback) => {
                if (value.length > 1000) {
                  callback(new Error(`${field.label}不能超过1000字符`));
                } else {
                  callback();
                }
              },
              trigger: 'blur'
            });
          } else if (field.maxLength) {
            fieldRules.push({
              max: field.maxLength,
              message: `${field.label}不能超过${field.maxLength}字符`,
              trigger: 'blur'
            });
          }
        }

        // 类型检查
        if (field.type === 'date') {
          fieldRules.push({ type: 'date', message: `${field.label}应为有效日期`, trigger: 'blur' });
        }

        this.rules[field.name] = fieldRules;
      });
    },
    handleUpload() {
      this.showDialog = true;
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
    // 文件删除
    handleFileDelete(index) {
      // 直接从 sysOssList 中删除文件
      this.form.sysOssList.splice(index, 1);
      if (this.choice === 1 && index <= this.originalFile) {
        this.originalFile -= 1;
      }
    },
    //文件导出
    exportToExcel(dataToExport) {
      if (!Array.isArray(this.listFields)) {
        return;
      } else {
        // 提取表头：使用 listFields 中的 label 作为表头
        const headers = this.listFields.map(field => ({ label: field.label }));
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
    // 文件导出逻辑
    handleExport() {
      let dataToExport
      if (this.selectedItems.length > 0) {
        dataToExport = this.selectedItems;
        this.exportToExcel(dataToExport);
      } else {
        let ExportQueryParams = {
          categoryId: this.categoryId,
          archiveStatus: 0,
          ...this.queryParams
        }
        ExportQueryParams.pageNum = 1
        ExportQueryParams.pageSize = 10000000
        listInfo(ExportQueryParams).then(res => {
          dataToExport = res.rows;
          this.exportToExcel(dataToExport);
        })
      }
    },
    //文件查看
    handleDetail(row) {
      try {
        this.$refs['form'].resetFields();
      } catch {
      }
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.choice = 2
        this.title = this.categoryName + "详情";
      });
    },
    //文件预览
    handleFilePreview(url) {
      // this.previewUrl = url;
      // this.showPreview = true;
      const fullUrl = process.env.VUE_APP_FILE_SERVER_BASE_URL + url.substring(1);
      const encodedUrl = encodeURIComponent(Base64.encode(fullUrl));
      // 打开新页面并调用在线预览接口
      const previewUrl = process.env.VUE_APP_KKFILEVIEW_BASE_URL + '/onlinePreview?url=' + encodedUrl;
      window.open(process.env.VUE_APP_KKFILEVIEW_BASE_URL + '/onlinePreview?url=' + encodedUrl);
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
    //只读
    isReadonly(field) {
      // return this.choice === 2 || field.name === 'archiveNumber'
      return this.choice === 2
    },
    isCheck() {
      return this.choice === 2;
    },
    notCheck() {
      return this.choice < 2;
    },
    notInsert() {
      return this.choice > 0;
    },
    isUpdate() {
      return this.choice === 1;
    },
    getTooltipContent(fieldName, row) {
      if (fieldName === 'archiveStatus') {
        return this.getArchiveStatus(row.archiveStatus);
      } else if (fieldName === 'department') {
        return this.getDepartmentName(row.department);
      } else {
        return this.getTexted(String(row[fieldName]));
      }
    },
    getArchiveStatus(status) {
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
    handleDocument() {
      if (this.ids.length >= 1) {
        const ids = this.ids;
        this.$modal.confirm('确认归档选中数据？').then(() => {
          this.$modal.loading("正在处理中");
          const type = 'guidang'
          return updatAarchiveStatus(ids, type)
        }).then(() => {
          const id = Date.now().toString();
          const logInfo = {
            categoryId:this.categoryId,
            placeonfileInfo: ids.length,
            infoId: ids.join(','),
            type: 'guidang',
            oddNumbers: id,
            createTime: this.getDataTime(new Date())
          }
          addPlaceonlog(logInfo)
          this.$modal.closeLoading();
          this.getList();
          this.$modal.msgSuccess("归档成功");
        }).catch(() => {
        });
      } else {
        this.$modal.confirm('确认归档全部' + this.total + '条数据？').then(async () => {
          this.$modal.loading("正在处理中");
          const pageTotal = Math.ceil(this.total / 3000);
          const ExportQueryParams = {
            categoryId: this.categoryId,
            archiveStatus: 0,
            ...this.queryParams
          };
          ExportQueryParams.pageNum = 1;
          ExportQueryParams.pageSize = 3000;
          const createTime = this.getDataTime(new Date());
          const id = Date.now().toString();
          // 定义递归函数
          const fetchAndProcessPageData = async (pageNum, pageTotal, concurrency = 5) => {
            try {
              if (pageNum > pageTotal) {
                // 达到页数上限，递归结束
                this.$modal.closeLoading();
                this.getList();
                this.$modal.msgSuccess("归档成功");
                return;
              }
              ExportQueryParams.pageNum = pageNum;
              ExportQueryParams.archiveStatus = 0;
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
              const logInfo = {
                categoryId: this.categoryId,
                placeonfileInfo: ids.length,
                infoId: ids.join(','),
                type: 'guidang',
                oddNumbers: id,
                createTime: createTime
              }
              addPlaceonlog(logInfo)
              // 递归调用，处理下一页
              await fetchAndProcessPageData(pageNum + 1, pageTotal, concurrency);
            } catch (error) {
              this.$modal.closeLoading();
              this.$modal.msgError("归档失败：" + error.message);
              console.error("归档失败：", error);
            }
          };

          // 调用递归函数，从第1页开始
          await fetchAndProcessPageData(1, pageTotal);
        })
      }
    },
    getDataTime(date) {
      const year = date.getFullYear();
      const month = String(date.getMonth() + 1).padStart(2, '0');
      const day = String(date.getDate()).padStart(2, '0');
      const hours = String(date.getHours()).padStart(2, '0');
      const minutes = String(date.getMinutes()).padStart(2, '0');
      const seconds = String(date.getSeconds()).padStart(2, '0');
      return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
    },
    getTexted(name) {
      name = name.replace(/<\/?span[^>]*>/g, '');
      return name;
    },
    getDepartmentName(department) {
      return this.departmentMap[department] || '无';
    },
    getOssStatus(status) {
      switch (status) {
        case 1:
          return '有附件';
        case 2:
          return '无附件';
        default:
          return '未知';
      }
    },
    loadDepartments() {
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
        if (response.name) {
          let ids = ''
          if (this.selectedItems.length > 0) {
            this.savedids = this.ids;
            ids = this.savedids;
            print(response.name, ids)
          }
          else {
            let listids = []
            let ExportQueryParams = {
              categoryId: this.categoryId,
              ...this.queryParams
            }
            ExportQueryParams.archiveStatus = 0;
            ExportQueryParams.pageNum = 1;
            ExportQueryParams.pageSize = 10000000;
            console.log(ExportQueryParams);
            
            listInfo(ExportQueryParams).then(res => {
              listids = res.rows.map(item => item.id)
              ids = listids;
              print(response.name, ids)
            }
            )
          }
        } else {
          this.$message.error("未找到打印模板");
        }
      })
      const print = async (name, ids) => {
        // 定义一个打开URL的函数
        const openUrl = (name, ids, pageIndex) => {
          const tpl_name = name;
          const renderOption = 1;  // 渲染选项
          const url = `/ureport/preview?_u=mysql:${tpl_name}&_i=${pageIndex}&_r=${renderOption}&ids=${ids}`;
          window.open(url, '_blank'); // 在新标签页中打开URL
        };
        // 如果ids的长度超过500，则分页处理
        if (ids.length >= 500) {
          for (let i = 0; i < ids.length; i += 500) {
            const chunk = ids.slice(i, i + 500).join(','); // 每次取500个id
            openUrl(name, chunk, 1); // 打开当前分页的URL
            // 如果不是最后一次分块，才提示用户是否继续
            if (i + 500 < ids.length) {
              const shouldContinue = await this.$modal.confirm('已打印到模板500条，是否继续打印？');
              if (!shouldContinue) {
                break; // 如果用户选择不继续，则退出循环
              }
            }
          }
        } else {
          // 如果ids长度小于500，直接打开URL
          ids = ids.join(',');
          openUrl(name, ids, 1);
        }
      };
    },
    handleNextPage() {
      // this.savedids = this.savedids.concat(this.ids);
      if (this.isCheckBySearch) {
        this.handleQueryBeach();
      } else {
        this.getList();
      }
    },
    /**
    * 批量删除当前分类下的所有数据
    */
    handleBatchDelete() {
      // 初始化删除响应变量和删除列表数组
      let delRes = 0;
      let deleteList = [];
      // 显示确认对话框，确认是否删除
      this.$modal.confirm('是否确认一键删除当前分类下所有数据？').then(() => {
        // 设置删除查询参数
        this.deleteQuery.categoryId = this.categoryId;
        this.deleteQuery.archiveStatus = 0;
        // 显示加载中状态
        this.$modal.loading("正在处理中");
        /**
         * 处理删除操作
         * @param {Array} res - 待删除的数据列表
         */
        const handleDeletion = async (res) => {
          // 计算需要删除的批次
          delRes = Math.ceil(res.length / 300);
          // 分批处理删除列表
          for (let i = 0; i < delRes; i++) {
            let start = i * 300;
            let end = Math.min(start + 300, res.length);
            let list = res.slice(start, end);
            deleteList.push(list);
          }
          // 初始化任务数组
          let tasks = [];
          const taskCount = Math.floor(deleteList.length / 5);
          const last = deleteList.length % 5;
          // 并发执行删除任务，每次最多5个
          for (let index = 0; index < taskCount; index++) {
            for (let i = 0; i < 5; i++) {
              const list = deleteList[i + index * 5];
              tasks.push(delInfo(list).then(() => list.length));
            }
            await Promise.all(tasks);
          }
          // 处理剩余的删除任务
          if (last !== 0) {
            for (let i = 0; i < last; i++) {
              const list = deleteList[i + taskCount * 5];
              tasks.push(delInfo(list).then(() => list.length));
            }
            await Promise.all(tasks);
          }
        };
        // 根据是否有搜索值来选择删除操作
        if (this.deleteQuery.searchValue !== '') {
          this.deleteQuery.keyWord = this.deleteQuery.searchValue;
          getDeleteCountBySearch(this.deleteQuery)
            .then(res => handleDeletion(res))
            .catch(error => {
              console.error("删除过程中发生错误:", error);
              this.$modal.msgError("删除过程中发生错误");
            })
            // 关闭加载中状态，并显示删除成功消息
            .finally(() => setTimeout(() => {
              this.getList()
              this.$modal.closeLoading();
              this.$modal.msgSuccess("删除成功");
            }, 2000));
        } else {
          getDelCount(this.deleteQuery)
            .then(res => handleDeletion(res))
            .catch(error => {
              console.error("删除过程中发生错误:", error);
              this.$modal.msgError("删除过程中发生错误");
            })
            // 关闭加载中状态，并显示删除成功消息
            .finally(() => setTimeout(() => {
              this.getList()
              this.$modal.closeLoading();
              this.$modal.msgSuccess("删除成功");
            }, 2000));
        }
      })  
    },
    clearSearch() {
      this.categoryId = null;
      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        archiveStatus: 0, //默认显示待归档数据
        searchValue: ''
      }
      this.deleteQuery = this.queryParams;
      this.saveSearch = {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        archiveStatus: 0, //默认显示待归档数据
        searchValue: ''
      }//搜索框内容
      this.passwordInput = '';
      this.isCheckBySearch = false;
      this.queryFields.forEach(field => {
        this.$set(this.queryParams, field.name, '');
      });
    },
    getRouterPath() {
      const cId = this.$route.query.categoryId;
      if (cId !== undefined && cId !== null) {
        this.categoryId = cId;
        if (this.$refs.fileTree) {
          this.$refs.fileTree.setNode(this.categoryId);
        }
        this.getFieldDefinitions(this.categoryId);
        this.queryParams.categoryId = cId;
        this.getList();
        getCategory(this.categoryId).then((res) => {
          this.categoryName = res.data.name;
          this.parentCategoryName = res.data.parentName;
        });
      } else { }
    },
  }
};

</script>
<style scoped>
/* 未选择分类，水平垂直居中对齐内容 */
.no-selection {
  display: flex;
  /* 使用Flexbox布局 */
  flex-direction: column;
  /* 垂直排列子元素 */
  align-items: center;
  /* 水平居中子元素 */
  justify-content: center;
  /* 垂直居中子元素 */
  height: 100%;
  /* 确保容器高度占满父元素 */
  text-align: center;
  /* 文字居中对齐 */
  min-height: 500px;
  /* 设置最小高度，以确保居中效果 */
}

/* 未选择分类图片居中并具有适当的大小 */
.file-center {
  width: 200px;
  /* 调整图片宽度至适当大小 */
  height: auto;
  /* 保持图片宽高比 */
  margin-bottom: 20px;
  /* 在图片和文本之间添加间距 */
}

/* 未选择分类 */
.file-fontcenter {
  color: #414141;
  /* 设置文本颜色为深灰色 */
  font-size: 16px;
  /* 调整字体大小以提高可读性 */
  margin-top: 10px;
  /* 在文本和前面的元素（如图片）之间添加间距 */
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
  max-width: 100%;
  /* Adjust as needed */
}

.item {
  display: inline-block;
}

.butten-column {
  display: flex;
  flex-direction: column;
  gap: 10px;
  align-items: center;
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

.password-prompt {
  display: flex;
  /* 使用Flexbox布局 */
  flex-direction: column;
  /* 垂直排列子元素 */
  align-items: center;
  /* 水平居中子元素 */
  justify-content: center;
  /* 垂直居中子元素 */
  height: 100%;
  /* 确保容器高度占满父元素 */
  text-align: center;
  /* 文字居中对齐 */
  min-height: 500px;
  /* 设置最小高度，以确保居中效果 */
}
</style>
