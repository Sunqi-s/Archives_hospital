<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="分类名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入分类名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="类别" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择类别" clearable>
          <el-option
            v-for="dict in dict.type.archive_node_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="显示状态" prop="isActive">
        <el-select v-model="queryParams.isActive" placeholder="请选择显示状态" clearable>
          <el-option
            v-for="dict in dict.type.sys_show_hide"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['archive:category:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table
      v-if="refreshTable"
      v-loading="loading"
      :data="categoryList"
      row-key="id"
      :default-expand-all="isExpandAll"
      :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
    >
      <el-table-column label="分类名称" prop="name" />
      <el-table-column label="类别" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.archive_node_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="显示状态" align="center" prop="isActive">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_show_hide" :value="scope.row.isActive"/>
        </template>
      </el-table-column>
      <el-table-column label="显示顺序" align="center" prop="orderNum" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            type="text"
            size="small"
            icon="el-icon-edit"
            v-if="scope.row.type === 1"
            @click="handleEditItem(scope.row)"
          >字段设定</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['archive:category:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['archive:category:add']"
          >新增</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleNumberRule(scope.row)"
            v-hasPermi="['archive:category:add']"
          >档号规则</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['archive:category:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改档案分类对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="分类名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入分类名称" />
        </el-form-item>
        <el-form-item label="上级分类" prop="parentId">
          <treeselect v-model="form.parentId" :options="categoryOptions" :normalizer="normalizer" placeholder="请选择上级分类" @input="updateParentName"/>
        </el-form-item>
        <el-form-item label="类别" prop="type">
          <el-radio-group v-model="form.type">
            <el-radio
              v-for="dict in dict.type.archive_node_type"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="显示状态" prop="isActive">
          <el-radio-group v-model="form.isActive">
            <el-radio
              v-for="dict in dict.type.sys_show_hide"
              :key="dict.value"
              :label="parseInt(dict.value)"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="显示顺序" prop="orderNum">
          <el-input-number v-model="form.orderNum" controls-position="right" :min="0" />
        </el-form-item>
        <el-form-item label="密码" prop="password">
          <el-input type="password" v-model="form.password" placeholder="请输入密码" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <el-dialog title="档号规则" :visible.sync="isRule" width="500px" append-to-body>
      <el-select v-model="archiveItem" placeholder="请选择字段">
        <el-option v-for="item in selection" :key="item" :label="item" :value="item">
        </el-option>
      </el-select>
      <el-select v-model="joinItem" placeholder="请选择间隔符">
        <el-option v-for="item in joinSelection" :key="item" :label="item" :value="item">
        </el-option>
      </el-select>
      <el-button type="primary" @click="addRule">添加</el-button>
      <el-input v-model="numberRule" readonly placeholder="结果" />
      <el-button type="primary" @click="updateRule">确定</el-button>
    </el-dialog>
  </div>
</template>

<script>
import { listCategory, getCategory, delCategory, addCategory, updateCategory } from "@/api/archive/category";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import { addRule } from "@/api/archive/archiveRule";

export default {
  name: "Category",
  dicts: ['sys_show_hide', 'archive_node_type'],
  components: {
    Treeselect
  },
  data() {
    return {
      // 遮罩层
      loading: true,
      // 显示搜索条件
      showSearch: true,
      // 档案分类表格数据
      categoryList: [],
      // 档案分类树选项
      categoryOptions: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否展开，默认全部展开
      isExpandAll: true,
      // 重新渲染表格状态
      refreshTable: true,
      // 查询参数
      queryParams: {
        name: null,        type: null,        isActive: null,      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "分类名称不能为空", trigger: "blur" }
        ],        type: [
          { required: true, message: "类别不能为空", trigger: "change" }
        ],        isActive: [
          { required: true, message: "显示状态不能为空", trigger: "change" }
        ],      },
        ruleForm : {
        id: null,
        categoryId: null,
        ruleItem: null,
        ruleJoin: null,
        itemName: null,
        numberCount: null
      },
        isRule: false,
        selection:["全宗号", "门类代码", "年度", "保管期限", "机构或问题", "件号", "保管期限缩写", "机构或问题缩写"],
        archiveItem:'',
        numberRule:'',
        joinSelection:["","-", "·"],
        joinItem:'',
        trueRule:[],
        trueItem:[]
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询档案分类列表 */
    getList() {
      this.loading = true;
      listCategory(this.queryParams).then(response => {
        this.categoryList = this.handleTree(response.data, "id", "parentId");
        this.loading = false;
      });
    },
    /** 转换档案分类数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.name,
        children: node.children
      };
    },
    /** 查询档案分类下拉树结构 */
    getTreeselect() {
      listCategory().then(response => {
        this.categoryOptions = [];
        const data = { id: 0, name: '顶级节点', children: [] };
        data.children = this.handleTree(response.data, "id", "parentId");
        this.categoryOptions.push(data);
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,        name: null,        parentId: null,   parentName: null,      level: null,        type: 0,        isActive: 0,        orderNum: null,        createBy: null,        createTime: null,        updateBy: null,        updateTime: null      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    updateParentName(value) {
      const node = this.findNode(this.categoryOptions, value);
      if (node) {
        this.form.parentName = node.name;
      } else {
        this.form.parentName = '顶级节点';
      }
    },
    findNode(options, value) {
      for (const option of options) {
        if (option.id === value) {
          return option;
        }
        if (option.children) {
          const found = this.findNode(option.children, value);
          if (found) {
            return found;
          }
        }
      }
      return null;
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      this.getTreeselect();
      if (row != null && row.id) {
        this.form.parentId = row.id;
        this.form.parentName = row.name;
      } else {
        this.form.parentId = 0;
        this.form.parentName = '顶级节点';
      }
      this.open = true;
      this.title = "添加档案分类";
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      if (row != null) {
        this.form.parentId = row.parentId;
        this.form.parentName = row.parentName;
      }
      getCategory(row.id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改档案分类";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateCategory(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addCategory(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除档案分类为"' + row.name + '"的数据项？').then(function() {
        return delCategory(row.id);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 分类项目模板编辑 */
    handleEditItem(row) {
      const categoryId = row.id ;
      const categoryName = row.name;
      this.$tab.openPage("设置[" + categoryName + "]项目模板", '/system/biz-settings/item-edit/index/' + categoryId);
    },
    handleNumberRule(row){
      this.reSetRule();
      this.ruleForm.categoryId = row.id;
      this.isRule = true;
    },
    addRule(){
      this.numberRule = this.numberRule + this.archiveItem + this.joinItem;
      this.trueRule.push(this.joinItem);
      this.trueItem.push(this.archiveItem);
    },
    updateRule(){
      if(this.trueItem.length != 6 || this.trueRule.length != 6){
        this.$modal.msgError("请选择完整的档号规则");
        return;
      }
      this.ruleForm.ruleJoin = this.trueRule.join(",");
      this.ruleForm.ruleItem = this.trueItem.join(",");
      addRule(this.ruleForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.isRule = false;
              this.reSetRule();
            });
    },
    reSetRule(){
              this.numberRule = "";
              this.trueRule = [];
              this.trueItem = [];
              this.ruleForm = {
        id: null,
        categoryId: null,
        ruleItem: null,
        ruleJoin: null,
        itemName: null,
        numberCount: null
      };
    },
  }
};
</script>
