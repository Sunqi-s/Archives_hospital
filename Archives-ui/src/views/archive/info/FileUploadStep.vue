
<template>
  <div>
    <!-- 文件上传组件 -->
    <el-upload
      ref="upload"
    action=""
    :auto-upload="false"
    :on-change="handleFileChange"
    :before-upload="beforeUpload"
    :file-list="fileList"
    >
    <!-- 触发文件选择的按钮 -->
    <div class="button-container">
      <el-button slot="trigger" :disabled="isButtonDisabled" type="primary">选择Excel文件</el-button>
    </div>
    </el-upload>
    <!-- Sheet页选择下拉框 -->
    <el-select v-model="selectedSheet" class="select_sheet" placeholder="选择Sheet页" style="margin-top:15px" @change="handleSheetChange">
      <!-- 遍历Sheet名称生成选项 -->
      <el-option
        v-for="sheet in sheetNames"
        :key="sheet"
        :label="sheet"
        :value="sheet"
      ></el-option>
    </el-select>
  </div>
</template>

<script>
export default {
  props: {
    // 按钮是否禁用
    isButtonDisabled: Boolean,
    // Excel表格的Sheet名称数组
    sheetNames: Array,
    // 选中的Sheet名称
    selectedSheet: String
  },
  data() {
    return {
      // 文件列表，限制为一个文件
      fileList: []
    };
  },
  methods: {
    // 处理文件变化事件
    handleFileChange(file) {
      // 将文件列表替换为新文件
      this.fileList = [file];
      // 触发父组件的file-change事件
      this.$emit('file-change', file);
    },
    // 上传文件前的验证事件
    beforeUpload(file) {
      // 触发父组件的before-upload事件
      return this.$emit('before-upload', file);
    },
    // 处理Sheet页变化事件
    handleSheetChange(sheetName) {
      // 触发父组件的sheet-change事件
      this.$emit('sheet-change', sheetName);
    }
  }
};
</script>
