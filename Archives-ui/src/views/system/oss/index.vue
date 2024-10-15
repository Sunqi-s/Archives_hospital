<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['system:oss:add']"
        >上传文件</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:oss:remove']"
        >删除</el-button>
      </el-col>
    </el-row>

    <el-table v-loading="loading" :data="ossList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="文件名" align="center" prop="name" width="400"/>
      <el-table-column label="URL地址" align="center" prop="url" width="600" />
      <el-table-column label="文件类型" align="center" prop="suffix" width="100"/>
      <el-table-column label="文件大小" align="center" width="150">
        <template slot-scope="scope">
          <span>{{ formatSize(scope.row.size) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-platform"
            @click="onlinePreview(scope.row)"
            v-hasPermi="['system:oss:edit']"
          >预览</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete-solid"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:oss:edit']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改文件上传对话框 -->
    <template>
      <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
        <el-form ref="form" :model="form"  >
          <el-form-item label="" prop="url">
            <file-upload
              :limit="5"
              :fileSize="1000"
              :fileType="['doc', 'xls', 'ppt', 'txt', 'pdf', 'xlsx', 'jpg', 'png', 'pdf', 'mp4']"
              v-model="form.uploadedFiles"
              @input="handleFileUpload"
            />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button type="primary" @click="submitForm">确 定</el-button>
          <el-button @click="cancel">取 消</el-button>
        </div>
      </el-dialog>
    </template>

    <!-- 预览文件对话框
    <el-dialog :title="previewTitle" :visible.sync="previewVisible" fullscreen >
      <onlinePreview v-if="previewVisible" :initialUrl="previewUrl" />
    </el-dialog>-->
  </div>
</template>

<script>
import { listOss, delOss, addOss, updateOss } from "@/api/system/oss";
import {Base64} from "js-base64";

export default {
  name: "Oss",
  data() {
    return {
      urls: [],
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
      // 文件上传表格数据
      ossList: [],
      // 弹出层标题
      title: "文件上传",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
      },
      // 表单参数
      form: {
        uploadedFiles: []
      },
      // 表单校验
      rules: {},
      // 预览对话框相关
      previewVisible: false,
      previewTitle: "文件预览",
      previewUrl: "",
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询文件上传列表 */
    getList() {
      this.loading = true;
      listOss(this.queryParams).then(response => {
        this.ossList = response.rows;
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
      this.form = {uploadedFiles:[]};
      this.resetForm("form");
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id);
      this.urls = selection.map(item => item.url);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
    },
    /** 提交按钮 */
    submitForm() {
          if (this.form.id != null) {
            updateOss(this.form.uploadedFiles).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOss(this.form.uploadedFiles).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      const url = row.url || this.urls;
      this.$modal.confirm('是否确认删除文件上传URL为"' + url + '"的数据项？').then(function() {
        return delOss(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleFileUpload(files) {
      const filesArray = files.map(file => {
        const suffix = file.name.substring(file.name.lastIndexOf('.') + 1);
        return {
          path: '',           // 文件路径
          url: file.url,      // URL
          name: this.getFileName(file.name),    // 文件名
          size: file.size,    // 文件大小
          fid: file.uid,      // 关联ID
          suffix: suffix,     // 文件后缀
        };
      });
      this.form.uploadedFiles = filesArray;
    },
    // 获取文件名称
    getFileName(name) {
      // 如果是url那么取最后的名字 如果不是直接返回
      if (name.lastIndexOf("/") > -1) {
        return name.slice(name.lastIndexOf("/") + 1);
      } else {
        return name;
      }
    },
    // 预览
    onlinePreview(row) {
      // this.previewUrl = url;
      // this.showPreview = true;
      const encodedUrl = encodeURIComponent(Base64.encode(process.env.VUE_APP_FILE_SERVER_BASE_URL + url));
      // 打开新页面并调用在线预览接口
      window.open(process.env.VUE_APP_KKFILEVIEW_BASE_URL + '/onlinePreview?url=' + encodedUrl);
    },
    // 关闭预览
    closePreview() {
      this.previewVisible = false;
      this.previewUrl = "";
    },
    //文件大小单位转换
    formatSize(size) {
      // 文件大小格式化，转换为KB或MB
      const sizeInKB = size / 1024;
      if (sizeInKB < 1024) {
        return sizeInKB.toFixed(2) + ' KB';
      } else {
        return (sizeInKB / 1024).toFixed(2) + ' MB';
      }
    },
  }
};
</script>
