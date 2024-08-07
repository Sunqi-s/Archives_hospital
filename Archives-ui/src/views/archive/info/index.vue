<template>
  <div class="app-container">
    <el-row :gutter="20">
      <!-- 档案分类树形结构 -->
      <el-col :span="4" :xs="24">
        <file-tree :file-options="fileOptions" @node-click="handleNodeClick"></file-tree>
      </el-col>

      <!-- 未选择档案库时显示该画面 -->
      <el-col :span="20" :xs="24" v-show="categoryId===null">
        <div class="no-selection">
          <img src="@/assets/images/lock.png" class="file-center">
          <p class="file-fontcenter">请选择右侧档案库</p>
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
            <el-button type="primary" icon="el-icon-search" size="small" @click="handleQuery">搜索</el-button>
            <el-button icon="el-icon-refresh" size="small" @click="resetQuery">重置</el-button>
          </div>

        </el-drawer>

        <!-- 功能按钮区 -->
        <el-row :gutter="10" class="mb8">
          <el-col :span="1.5">
            <el-button
              type="primary"
              icon="el-icon-plus"
              size="small"
              @click="handleAdd"
              v-hasPermi="['system:document:add']"
            >录入</el-button>
          </el-col>
          <el-col :span="1.5">
            <el-button
              type="danger"
              icon="el-icon-delete"
              size="small"
              :disabled="multiple"
              @click="handleDelete"
              v-hasPermi="['system:document:remove']"
            >删除</el-button>
          </el-col>
          <!-- <el-col :span="1.5">
             <el-button
               type="warning"
               icon="el-icon-download"
               size="small"
               @click="handleExport"
               v-hasPermi="['system:document:export']"
             >导出</el-button>
           </el-col>-->

        </el-row>

        <!-- 动态生成的表格 -->
        <el-table :data="infoList" v-loading="loading" @selection-change="handleSelectionChange">
          <el-table-column type="selection" width="55" align="center" />
          <el-table-column
            v-for="field in listFields"
            :key="field.name"
            :prop="field.name"
            :label="field.label"
          >
            <template slot-scope="scope">
              <span v-html="scope.row[field.name]"></span>
            </template>
          </el-table-column>
        </el-table>

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
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)">
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
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
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
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)">
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
                    <el-button type="primary" plain icon="el-icon-upload" size="small" @click="handleUpload">点击按钮上传</el-button>
                    <el-button type="success" plain icon="el-icon-download" size="small" @click="handleBatchDownload">批量下载</el-button>
                  </div>
                  <el-table :data="electronicFiles" style="width: 100%; margin-top: 10px;">
                    <el-table-column prop="index" label="序号" width="50"></el-table-column>
                    <el-table-column prop="fileName" label="文件名称"></el-table-column>
                    <el-table-column prop="fileType" label="文件类型" width="120"></el-table-column>
                    <el-table-column prop="fileSize" label="文件大小" width="120"></el-table-column>
                    <el-table-column label="操作" width="120">
                      <template slot-scope="scope">
                        <el-button @click="handleFileDownload(scope.row)" size="small">下载</el-button>
                        <el-button type="danger" @click="handleFileDelete(scope.row)" size="small">删除</el-button>
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
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>


<script>
import categoryTree from '@/views/archive/category/categoryTree.vue';
import { listInfo, getInfo, delInfo, addInfo, updateInfo } from "@/api/archive/info";
import { listCategory } from "@/api/archive/category";
import { getItemByCategoryId } from "@/api/archive/item";
import { getDicts } from "@/api/system/dict/data";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {  deptTreeSelect } from "@/api/system/user";

export default {
  name: "Info",
  components: {
    'file-tree': categoryTree, Treeselect
  },
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
        archiveStatus: 0, //默认显示待归档数据
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
      form: {categoryId: null},
      rules: {}
    };
  },
  created() {
    this.getCategoryTreeList();
    this.getDeptTree();
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
        dictType: field.dictType
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

        //初始化校验
        this.generateRules();
      });
    },
    getCategoryTreeList() {
      listCategory().then(response => {
        this.fileOptions = this.handleFileOptions(response.data, "id", "parentId");
      });
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
      //选择档案节点不显示列表页面
      if(nodeData.type===1) {
        this.categoryId = nodeData.id;
      } else {
        this.categoryId = null;
      }
      this.categoryName = nodeData.name;
      this.parentCategoryName = nodeData.parentName;
      this.queryParams.categoryId = nodeData.id;
      this.getFieldDefinitions(nodeData.id);
      this.getList();
    },
    handleQuery() {
      this.getList();
    },
    resetQuery() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 10
      };
      this.queryFields.forEach(field => {
        this.$set(this.queryParams, field.name, '');
      });
      this.getList();
    },
    /** 查询档案信息列表 */
    getList() {
      this.loading = true;
      listInfo(this.queryParams).then(response => {
        if(this.queryParams.searchValue) {
          this.infoList = this.markMatches(response.rows);
        }else {
          this.infoList = response.rows;
        }
        this.total = response.total;
        this.loading = false;
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
      this.open = true;
      this.title = this.parentCategoryName + '-' + this.categoryName;
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    /** 对话框关闭操作 */
    handleClose(done) {
      // 实现当 handleClose 被调用时应该发生的逻辑
      // 例如，你可能想要显示一个确认对话框
      this.$confirm('确定要关闭这个对话框吗？')
        .then(() => {
          done(); // 当你想要关闭对话框时调用 done()
        })
        .catch(() => {});
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getInfo(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改文书卷内录入";
      });
    },
    reset() {

    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        this.form.categoryId = this.categoryId;
        if (valid) {
          if (this.form.id != null) {
            updateInfo(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addInfo(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      const archiveNumbers = row.archiveNumber || this.archiveNumbers;
      this.$modal.confirm('是否确认删除档号为"' + archiveNumbers + '"的数据？').then(function() {
        return delInfo(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 电子文件信息上传操作 */
    successUpload(response, file, fileList) {
      // 上传成功后的处理逻辑
      // 例如，更新表单数据或显示通知
      console.log('上传成功：', response, file, fileList);
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.archiveNumbers = selection.map(item => item.archiveNumber)
      this.single = selection.length!==1
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
    handleUpload() {
      // Handle file upload
    },
    handleBatchDownload() {
      // Handle batch download
    },
    handleFileDownload(file) {
      // Handle individual file download
    },
    handleFileDelete(file) {
      // Handle file deletion
    }
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

.required-label::before {
  content: '*';
  color: #F56C6C;
  margin-right: 4px;
}
</style>
