<template xmlns:th="http://www.w3.org/1999/xhtml">
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="模板名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入模板名称"
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
          v-hasPermi="['archive:rpttemplates:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['archive:rpttemplates:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['archive:rpttemplates:export']"
        >导出</el-button>
      </el-col>

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="rpttemplatesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="ID号" align="center" prop="id" />
      <el-table-column label="模板名称" align="center" prop="name" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['archive:rpttemplates:edit']"
          >报表设计</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-platform"
            @click="preview(scope.row)"
            v-hasPermi="['archive:rpttemplates:remove']"
          >预览</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-platform"
            @click="handleRelation(scope.row)"
            v-hasPermi="['archive:rpttemplates:remove']"
          >关联</el-button>
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

    <el-dialog title="关联模板" :visible.sync="open" width="30%" :before-close="cancel">
      <el-cascader v-model="option" :options="options" :show-all-levels="false"></el-cascader>
      <el-button @click="save" type="primary">确定</el-button>
    </el-dialog>

  </div>


</template>

<script>
import { listRpttemplates, delRpttemplates} from "@/api/archive/rpttemplates";
import {listCategory} from "@/api/archive/category";
import {addRelation} from "@/api/archive/relation";
export default {
  name: "Rpttemplates",
  data() {
    return {
      tpl_name:'',
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
      // 报表设计表格数据
      rpttemplatesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
      },
      // 表单参数
      form: {},
      // 弹出层表单参数
      options: [],
      option:0,
      //
      relation:{}
    };
  },
  created() {
    this.getList();
    listCategory().then(response => {
      this.options = response.data.map(item => {
        return{
          value: item.id,
          label: item.name,
          parentId: item.parentId,
        }
      })
      const x = [];
      for (let i = 0; i < this.options.length; i++) {
        if(this.options[i].parentId===0){
          this.options[i].children = [];
          x.push(this.options[i])
        }
      }
      for (let j = 0; j < this.options.length; j++) {
        if (this.options[j].parentId !== 0) {
          for (let k = 0; k < x.length; k++) {
            if (x[k].value === this.options[j].parentId) {
              x[k].children.push(this.options[j])
            }
          }
        }
      }
      this.options = x;
    })
  },
  methods: {
    /** 查询报表设计列表 */
    getList() {
      this.loading = true;
      listRpttemplates(this.queryParams).then(response => {
        this.rpttemplatesList = response.rows;
        this.total = response.total;
        this.loading = false;
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
        id: null,
        name: null,
        content: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.tpl_name=selection.map(item => item.name)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.$tab.openPage("报表新增", '/system/biz-settings/designer');
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      const tpl_name = row.name; // 将 name 数组中的元素拼接成一个字符串
      this.$tab.openPage("设计报表", "/system/biz-settings/designer/" + tpl_name);
    },
    // 报表预览带参数
   /* previewWithPrams(row) {
      const tpl_name = row.name;
      const ids = [8,9];
      this.$tab.openPage("打印预览", "/system/biz-settings/preview/" + tpl_name, {ids:JSON.stringify(ids)});
    },*/
    // 报表预览
    preview(row) {
      const tpl_name = row.name;
      this.$tab.openPage("报表预览", "/system/biz-settings/preview/" + tpl_name);
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除编号为"' + ids + '"的报表模板？').then(function() {
        return delRpttemplates(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('archive/rpttemplates/export', {
        ...this.queryParams
      }, `rpttemplates_${new Date().getTime()}.xlsx`)
    },
    // 关联按钮操作
    handleRelation(row){
      this.open=true;
      this.relation.reportId=row.id
    },
    // 保存关联模板
    save(){
      this.option = this.option.slice(-1);
      this.relation.categoryId=this.option[0]
      addRelation(this.relation).then(response=>{
        if(response===200){
          this.$message.success("关联成功")
        }else{
          this.$message.error("关联失败,报表或档案类型已有关联")
        }
        this.open=false;
      })
    }
  }
};
</script>
