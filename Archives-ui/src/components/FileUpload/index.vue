<template>
  <div class="upload-file">
    <el-upload
      multiple
      :action="uploadFileUrl"
      :before-upload="handleBeforeUpload"
      :file-list="fileList"
      :limit="limit"
      drag
      :show-file-list="false"
      :on-error="handleUploadError"
      :on-exceed="handleExceed"
      :on-success="handleUploadSuccess"
      :on-change="handFileListChange"
      :headers="headers"
      :auto-upload="autoUpload"
      class="upload-file-uploader"
      ref="fileUpload"
    >
      <i class="el-icon-upload"></i>
      <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
      <!-- 上传提示 -->
      <div class="el-upload__tip" slot="tip" v-if="showTip">
        请上传
        <template v-if="fileSize"> 大小不超过 <b style="color: #f56c6c">{{ fileSize }}MB</b> </template>
        <template v-if="fileType"> 格式为 <b style="color: #f56c6c">{{ fileType.join("/") }}</b> </template>
        的文件
      </div>
    </el-upload>

    <!-- 文件列表 -->
    <transition-group class="upload-file-list el-upload-list el-upload-list--text" name="el-fade-in-linear" tag="ul">
      <li :key="file.uid" class="el-upload-list__item ele-upload-list__item-content" v-for="(file, index) in fileList">
        <el-link :href="`${baseUrl}${file.url}`" :underline="false" target="_blank">
          <span class="el-icon-document"> {{ getFileName(file.name) }} ({{ getFileSize(file.size) }}) </span>
        </el-link>
        <div class="ele-upload-list__item-content-action">
          <el-link :underline="false" @click="handleDelete(index)" type="danger">删除</el-link>
        </div>
      </li>
    </transition-group>
  </div>
</template>

<script>
import { getToken } from "@/utils/auth";
import axios from "axios";

export default {
  name: "FileUpload",
  props: {
    // 值
    value: [String, Object, Array],
    // 数量限制
    limit: {
      type: Number,
      default: 5,
    },
    // 大小限制(MB)
    fileSize: {
      type: Number,
      default: 100,
    },
    // 文件类型, 例如['png', 'jpg', 'jpeg']
    fileType: {
      type: Array,
      default: () => ["doc", "xls", "ppt", "txt", "pdf", "xlsx", "jpg", "png", "pdf", "mp4"],
    },
    // 是否显示提示
    isShowTip: {
      type: Boolean,
      default: true,
    },
    autoUpload:{
      type: Boolean,
      default: true,
    }
  },
  data() {
    return {
      number: 0,
      uploadList: [],
      baseUrl: process.env.VUE_APP_BASE_API,
      uploadFileUrl: process.env.VUE_APP_BASE_API + "/common/upload", // 上传文件服务器地址
      headers: {
        Authorization: "Bearer " + getToken(),
      },
      fileList: [],
    };
  },
  watch: {
    value: {
      handler(val) {
        if (val) {
          let temp = 1;
          // 首先将值转为数组
          const list = Array.isArray(val) ? val : this.value.split(',');
          // 然后将数组转为对象数组
          this.fileList = list.map(item => {
            if (typeof item === "string") {
              item = { name: item, url: item};
            }
            item.uid = item.uid || new Date().getTime() + temp++;
            return item;
          });
        } else {
          this.fileList = [];
          return [];
        }
      },
      deep: true,
      immediate: true
    }
  },
  computed: {
    // 是否显示提示
    showTip() {
      return this.isShowTip && (this.fileType || this.fileSize);
    },
  },
  methods: {
    //手动上传文件
    async handleUpload(sysOssList) {
      this.uploadList = []
      this.fileList = []
      for (let file of sysOssList) {
        if(this.handleBeforeUpload(file)){
          const formData = new FormData();
          formData.append(`file`, file.raw || file);
          const response = await axios.post(this.uploadFileUrl, formData, {
            headers: this.headers,
            timeout: 600000,
          })
          try {
            // 处理上传成功或失败逻辑
            if (response.data.code === 200) {
              // 上传成功后，不需要进一步处理数据库
              this.handleUploadSuccess(response.data);
              // this.$modal.msgSuccess("文件上传成功");
            } else {
              break;
            }
          } catch (error) {

          }
        }
      }
    },
    // 上传前校检格式和大小
    handleBeforeUpload(file) {
      this.checkFileType(file)
      this.checkFileSize(file)

      this.number++;
      return true;
    },
    // 文件个数超出
    handleExceed() {
      this.$modal.msgError(`上传文件数量不能超过 ${this.limit} 个!`);
    },
    // 上传失败
    handleUploadError(err) {
      this.$modal.msgError("上传文件失败，请重试");
      this.$modal.closeLoading();
      this.number--;
    },
    // 校检文件类型
    checkFileType(file) {
      if (this.fileType) {
        const fileName = file.name.split('.');
        const fileExt = fileName[fileName.length - 1];
        const isTypeOk = this.fileType.indexOf(fileExt) >= 0;
        if (!isTypeOk) {
          this.$modal.msgError(`文件格式不正确, 请上传${this.fileType.join("/")}格式文件!`);
          return false;
        }
      }
      return true;
    },
    // 校检文件大小
    checkFileSize(file) {
      if (this.fileSize) {
        const isLt = file.size / 1024 / 1024 < Number(this.fileSize);
        if (!isLt) {
          this.$modal.msgError(`上传文件大小不能超过 ${this.fileSize} MB!`);
          return false;
        }
      }
      return true;
    },
    // 上传成功回调
    handleUploadSuccess(res, file) {
      if (res.code === 200) {
        this.uploadList.push({ name: res.originalFilename, url: res.fileName, size: res.size , suffix :res.type ,deleteFlg: 0 ,fid: ''});
        this.uploadedSuccessfully();
      } else {
        this.number--;
        this.$modal.closeLoading();
        this.$modal.msgError(res.msg);
        this.$refs.fileUpload.handleRemove(file);
        this.uploadedSuccessfully();
      }
    },
    // 删除文件
    handleDelete(index) {
      this.fileList.splice(index, 1);
      //this.$emit("input", this.listToString(this.fileList));
      this.$emit("del", this.fileList);
    },
    // 上传结束处理
    uploadedSuccessfully() {
      if (this.number > 0 && this.uploadList.length === this.number) {
        this.fileList = this.fileList.concat(this.uploadList);
        this.uploadList = [];
        this.number = 0;
        //this.$emit("input", this.listToString(this.fileList));
        this.$emit("input", this.fileList);
        this.$modal.closeLoading();
      }
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
    // 获取文件大小
    getFileSize(size) {
      return (size / 1024 / 1024).toFixed(2) + ' MB';
    },
    // 对象转成指定字符串分隔
    listToString(list, separator) {
      let strs = "";
      separator = separator || ",";
      for (let i in list) {
        strs += list[i].url + separator;
      }
      return strs != '' ? strs.substr(0, strs.length - 1) : '';
    },

    // 文件改变
    handFileListChange(file) {
      if (file.response && file.response.url) {

      } else {
        file.deleteFlg = 0;
        this.fileList.push(file);
        }
    },
    //将上传框中的fileList传到form中
    confirm() {
      const newFileList = [];
      for(let file of this.fileList){
        if(this.checkFileType(file) && this.checkFileSize(file)){
         newFileList.push(file)
        }
      }
      this.$emit("info", newFileList);
      this.resetFileList()
    },
    //清空fileList
    resetFileList() {
      this.fileList = [];
    },
  }
};
</script>

<style scoped lang="scss">
.upload-file-uploader {
  margin-bottom: 5px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.upload-file-list .el-upload-list__item {
  border: 1px solid #e4e7ed;
  line-height: 2;
  margin-bottom: 10px;
  position: relative;
}
.upload-file-list .ele-upload-list__item-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: inherit;
}
.ele-upload-list__item-content-action .el-link {
  margin-right: 10px;
}
</style>
