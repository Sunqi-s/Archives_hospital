<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="档案分类" prop="categoryId">
        <el-select v-model="queryParams.categoryId" placeholder="请选择档案分类" clearable>
          <el-option  v-for="option in categoryOptions" :key="option.value" :label="option.label" :value="option.value"/>
        </el-select>
      </el-form-item>
      <el-form-item label="分类字段" prop="syllable">
        <el-input
          v-model="queryParams.syllable"
          placeholder="请输入分类字段"
          clearable
          @keyup.enter.native="handleQuery"
        />
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
          v-hasPermi="['archive:fit:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['archive:fit:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['archive:fit:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['archive:fit:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="fitList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="id" align="center" prop="id" />
      <el-table-column label="档案分类" align="center" prop="categoryId" />
      <el-table-column label="分类字段" align="center" prop="syllable" />
      <el-table-column label="所属字段名称" align="center" prop="query" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['archive:fit:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['archive:fit:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    
    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改保存对于文书的年度或科技的类型的对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="档案分类" prop="categoryId">
          <el-select v-model="form.categoryId" placeholder="请选择档案分类">
            <el-option v-for="option in categoryOptions" :key="option.value" :label="option.label" :value="option.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="分类字段" prop="syllable">
          <el-input v-model="form.syllable" placeholder="请输入分类字段" clearable />
        </el-form-item>
        <el-form-item label="所属字段" prop="query" :disabled="true">
          <el-input v-model="form.query" readonly/>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listFit, getFit, delFit, addFit, updateFit } from "@/api/archive/fit";
import { listCategory } from "@/api/archive/category";

export default {
  name: "Fit",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 保存对于文书的年度或科技的类型的表格数据
      fitList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        categoryId: null,        syllable: null,      },
      // 表单参数
      form: {categoryId: null,  syllable: null,  query: null},
      // 表单校验
      rules: {
        categoryId: [
          { required: true, message: "档案分类不能为空", trigger: "change" }
        ],        syllable: [
          { required: true, message: "分类字段不能为空", trigger: "blur" }
        ], 
        query: [
          { required: true, message: "所属字段不能为空", trigger: "blur" }
        ],     
      },
      /*/**下拉框 */
      categoryOptions: [], 
      fitOptions:[]
    };
  },
  created() {
    this.getCategoryOptions();
    this.getList();
  },
  watch:{
    'form.categoryId': function(newCategoryId){
      const selectedCategory = this.categoryOptions.find(item => item.value === newCategoryId);
      if(selectedCategory){
        this.form.query = selectedCategory.query;
      }else{
        this.form.query = null;
      }
    },
  },
  methods: {
    /** 查询保存对于文书的年度或科技的类型的列表 */
    getList() {
      this.loading = true;
      listFit(this.queryParams).then(response => {
        this.fitList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /**查询档案分类下拉框 */
    getCategoryOptions(){
      listCategory().then(response => {
        console.log(response);
        this.categoryOptions = response.data.filter(item => item.type === 1).map(item => {
          return {
            value: item.id,
            label: item.name,
            query: item.query,
          }
        })
        console.log(this.categoryOptions);

        return listFit();
      }).then(res => {
          console.log(res);
          this.fitOptions = res.rows;
          console.log(this.fitOptions);
          
          this.matchAndAssignQuery();
      })
      
    },
    matchAndAssignQuery(){
      this.categoryOptions.forEach(category => {
        const fit = this.fitOptions.find(fitOption => fitOption.categoryId === category.value)
        if(fit){
          category.query = fit.query;
        }
      });
      console.log(this.categoryOptions);
      
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        categoryId: null,
        syllable: null,
        query: null,
        syllablePlaceholder: '请选择档案分类' // 初始化为默认提示
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加";
      this.form.categoryId = null;
      this.form.syllable = null;
      this.form.query = null;
      this.form.syllablePlaceholder = '请选择档案分类';
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFit(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFit(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFit(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除编号为"' + ids + '"的数据项？').then(function() {
        return delFit(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('archive/fit/export', {
        ...this.queryParams
      }, `fit_${new Date().getTime()}.xlsx`)
    },
  }
};
</script>
