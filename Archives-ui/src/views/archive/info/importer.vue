<template>
  <el-row
    v-loading="!isElCardBodyLoading"
    element-loading-text="导入中，请稍候..."
    element-loading-svg="<svg class='circular' viewBox='25 25 50 50'><circle class='path' cx='50' cy='50' r='20' fill='none' stroke-width='4' stroke-miterlimit='10'/></svg>"
    element-loading-svg-view-box="0 0 100 100"
  >
    <el-row class="app-container">

      <!-- 树组件 -->
      <el-col :span="4" :xs="24">
        <file-tree :file-options="categoryTree" @node-click="handleNodeClick" :default-expand-all="false" ref="fileTree"></file-tree>
      </el-col>
    <!-- 主体 -->
    <el-row class="el-card__body">
      <!-- 进度条 -->
      <el-row class="progressBar">
        <el-col :span="24">
          <el-row :gutter="10" class="mb8">
            <el-steps :active="active" finish-status="success">
              <el-step v-if="isCategory" title="选择左侧档案类型"></el-step>
              <el-step v-if="!isCategory" :title="`当前分类: ${categoryName}`"></el-step>
              <el-step title="上传文件"></el-step>
              <el-step title="导入"></el-step>
              <el-step title="完成"></el-step>
            </el-steps>
          </el-row>
        </el-col>
      </el-row>
      <!-- 按钮 -->
      <el-row class="button-row" v-if="selectedNodeKey&&!isMessageRow">
        <el-col :span="18" class="main_body" style="width: 89%" v-if="1">
          <el-form>
            <!-- 上传EXCEL按钮 -->
            <el-row class="upload_row">
              <slot name="file-upload-step">
                <FileUploadStep :isButtonDisabled="!isUploadDisabled"
                                :sheetNames="sheetNames"
                                :selectedSheet="selectedSheet"
                                @file-change="handleFileChange"
                                @before-upload="beforeUpload"
                                @sheet-change="handleSheetChange" />
              </slot>
            </el-row>
            <el-row style="margin-top: 15px">
              <!-- 删除选中行 -->
              <el-button type="danger" @click="deleteSelectedRows" :disabled="isButtonDisabled || !isDisplayOutput">删除选中行</el-button>
              <!-- 切换显示 -->
              <el-button :type="toggleButtonType" plain @click="toggleDataDisplay" :disabled="isButtonDisabled || !isDisplayOutput">
                {{ showAllData ? '显示错误' : '显示所有' }}
              </el-button>
              <!-- 导入按钮 -->
              <el-button :type="isUploadDisabled ? 'success disabled' : 'success'"
                         :disabled="isUploadDisabled || isButtonDisabled || !isDisplayOutput "
                         @click="submitFileForm">
                单导入EXCEL
              </el-button>
              <!-- 批量挂接按钮 -->
              <el-button :type="isUploadDisabled ? 'success disabled' : 'success'"
                         :disabled="isUploadDisabled || isButtonDisabled || !isDisplayOutput"
                         @click="openBatchAttachmentDialog">
                本地批量挂接
              </el-button>
              <el-button :type="isUploadDisabled ? 'success disabled' : 'success'"
                         :disabled="isUploadDisabled || isButtonDisabled || !isDisplayOutput"
                         @click="openBatchAttachmentFromFolderDialog">
                在线批量挂接
              </el-button>
              <!-- 导出模板 -->
              <el-button type="primary"
                         :disabled="isButtonDisabled || !isDisplayOutput || exportBut"
                         plain
                         @click="exportTemplate()">导出模板
              </el-button>
              <!-- 重置按钮 -->
              <el-button @click="resetTree">
                <el-icon class="el-icon-refresh"> </el-icon>
                重置
              </el-button>
            </el-row>
          </el-form>
        </el-col>
      </el-row>

      <!-- 表格 -->
      <el-row class="main_body" v-if="showOn">
        <slot name="data-display">
          <DataDisplay ref="dataDisplay"
                       :paginatedTableData="paginatedTableData"
                       :columnList="columnList"
                       :filteredTableData="filteredTableData"
                       @selection-change="handleSelectionChange"
                       @page-change="handlePageChange"
          />
        </slot>
      </el-row>
      <!-- 成功弹出提醒 -->
      <el-row class="messageRow" v-if="isMessageRow&&displayOutput">
        <el-col :span="24">
          <el-card class="box-card" shadow="hover">
            <div slot="header" class="clearfix">
              <span>导入成功</span>
            </div>
            <div class="text-center">
              <el-icon class="el-icon-success success-icon"></el-icon>
              <p class="success-message" v-if="importChoice === 0">此次挂接成功 {{ importLog.ossProcessedRecords }} 条记录。
              挂接失败 {{importLog.ossImportRecords - importLog.ossProcessedRecords}} 条记录。</p>
              <p class="success-message" v-if="importChoice === 1">此次共导入 {{ importLog.infoImportRecords }} 条记录。</p>
              <el-button type="primary" @click="takeMeToArchive" size="medium" class="reset-button">转至整理库</el-button>
              <el-button type="primary" @click="resetTree" size="medium" class="reset-button">再次导入</el-button>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <!-- 本地批量挂接弹出页 -->
      <el-dialog
        title="文件挂接流程"
        :visible.sync="batchAttachmentDialogVisible"
        :modal-append-to-body="false"
        :close="isClose()"
      >
        <el-row :gutter="20">
          <!-- 上面处理流程步骤条 -->
          <el-col :span="24" style="text-align: center; padding-bottom: 20px;">
            <el-steps :active="currentStep" simple >
              <el-step title="选择文件" icon="el-icon-edit" ></el-step>
              <el-step title="文件上传" icon="el-icon-upload" ></el-step>
              <el-step title="文件挂接" icon="el-icon-picture" ></el-step>
              <el-step title="挂接完成" icon="el-icon-picture" ></el-step>
            </el-steps>
          </el-col>

          <!-- 中间按钮区 -->
          <el-col :span="10" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <!-- 上传需要挂载的文件 -->
            <el-upload
              class="upload-demo"
              :action="uploadUrl"
              :headers="headers"
              :on-change="handleBatchFileChange"
              :file-list="fileList"
              :show-file-list="false"
              :auto-upload="false"
              :on-success="handleUploadSuccess"
              :on-error="handleUploadError"
              list-type="picture-card"
              ref="upload"
              :disabled="isFileListDisabled"
              v-if="currentStep !== 3"
            >
              <i v-if="fileList.length === 0 && currentStep !== 3" class="el-icon-plus upload-icon"></i>
              <img v-if="fileList.length > 0 && currentStep !== 3" class="upload-image" src="@/assets/images/压缩包.jpg" alt="Uploaded File" style="width: 140px; height: 140px;"/>
            </el-upload>
          </el-col>
          <!-- 自定义文件展示 -->
          <div>
              <span  v-if="fileList.length === 0 && currentStep === 0" style="font-size: 18px;">{{ "请选择2GB以内的压缩包文件" }}</span>
            <div v-for="(file, index) in filteredFileList" :key="index" class="file-item" v-if="currentStep <3 && fileList.length > 0">
              <!-- 图标显示 -->
              <i class="el-icon-document" style="font-size: 24px"></i>
              <!-- 文件名显示 -->
              <span style="font-size: 24px">{{ file.name }}</span>
            </div>
          </div>
          <div>
            <el-button type="success" @click="submitUpload" style="margin-top: 10px;" v-if="currentStep === 1 && isClick">开始上传</el-button>
            <el-button type="danger" @click="resetAttachment" v-if="currentStep === 1 && isClick" style="margin-top: 10px;">文件重置</el-button>
            <!-- 开始挂接按钮 -->
            <el-button type="primary" @click="autoAttach" style="margin-top: 10px;" v-if="currentStep === 2 && isClick">开始挂接</el-button>
          </div>
          <div v-if="currentStep === 3">
            <el-row>
              <el-col :sm="12" :lg="6" style="margin-left: 37%; margin-top: -50px; margin-bottom: -20px">
                <el-result icon="success" title="挂接完成" subTitle="请关闭此页面"></el-result>
              </el-col>
            </el-row>
          </div>
        </el-row>
        <div style="height: 1px;margin-top: 10px">
          <!-- 解压缩进度条 -->
          <el-progress
            v-if="circleStep === 0"
            :text-inside="true"
            :stroke-width="20"
            :percentage="progress"
            :format="formatProgress"
            :text-color="'#FFFFFF'"
            :define-back-color="color">
          </el-progress>
          <!-- 上传进度条 -->
          <el-progress
            v-if="circleStep === 1"
            :text-inside="true"
            :stroke-width="20"
            :percentage="totalUploadProgress"
            :format="formatTotaUploadProgress"
            :text-color="'#FFFFFF'"
            :define-back-color="color">
          </el-progress>
          <el-progress
            v-if="attach"
            :text-inside="true"
            :stroke-width="20"
            :percentage="attachmentProgress"
            :format="formatAttachmentProgress"
            :text-color="'#FFFFFF'"
            :define-back-color="color">
          </el-progress>
        </div>
      </el-dialog>
      <el-dialog title="挂接失败记录" :visible.sync="dialogTableVisible">
        <el-table >
          <el-table-column property="archiveNumber" label="文件档号" ></el-table-column>
        </el-table>
      </el-dialog>

      <!-- 在线批量挂接弹出页 -->
      <el-dialog
        title="文件挂接流程"
        :visible.sync="batchAttachmentFromFolderDialogVisible"
        :modal-append-to-body="false"
      >
        <el-row :gutter="20">
          <!-- 上面处理流程步骤条 -->
          <el-col :span="24" style="text-align: center; padding-bottom: 20px;">
            <el-steps :active="currentStep" simple >
              <el-step title="选择文件夹" icon="el-icon-folder" ></el-step>
              <el-step title="文件挂接" icon="el-icon-picture" ></el-step>
              <el-step title="挂接完成" icon="el-icon-picture" ></el-step>
            </el-steps>
          </el-col>

          <!-- 中间按钮区 -->
          <el-col :span="10" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <!-- 文件夹选择 -->
            <div v-if="currentStep < 3">
              <span>请选择需要挂载的文件夹</span>
              <el-cascader
                :options="folders"
                :props="{ checkStrictly: true }"
                v-model="value"
                ref="folderCascader"
                @change="handleFolderChange"
              >
              </el-cascader>
            </div>
          </el-col>
          <div style="padding-left: 50%;">
            <el-button type="primary" @click="submitFolderForm" style="margin-top: 10px;" v-if="currentStep === 0&&isClick">确定</el-button>
            <el-button type="danger" @click="resetFolderForm" v-if="currentStep === 0&&isClick" style="margin-top: 10px;">重置</el-button>
          </div>
          <div style="margin-top: 10px;">
            <!-- 开始挂接按钮 -->
            <el-button type="primary" @click="attachFolder" style="margin-top: 10px;" v-if="currentStep === 2&&isClick">开始挂接</el-button>
          </div>
          <div v-if="currentStep === 3">
            <el-row>
              <el-col :sm="12" :lg="6" style="margin-left: 37%; margin-top: -50px; margin-bottom: -20px">
                <el-result icon="success" title="挂接完成" subTitle="请关闭此页面"></el-result>
              </el-col>
            </el-row>
          </div>
          <div v-if="!isClick">
            <i class="el-icon-loading" style="font-size: 40px; color:#1C69DB;"></i>
          </div>
        </el-row>
      </el-dialog>
    </el-row>
    </el-row>
  </el-row>
</template>

<script>
import {listCategory} from "@/api/archive/category";
import {listItemSuccess} from "@/api/archive/item";
import * as XLSX from 'xlsx';
import {bulkAdd} from "@/api/archive/info";
import DataDisplay from "@/views/archive/info/DataDisplay.vue";
import FileUploadStep from "@/views/archive/info/FileUploadStep.vue";
import {getToken} from "@/utils/auth";
import JSZip from 'jszip';
import axios from "axios";
import {addImportLog, getImportLog, getServerFileList, getServerFolderList, updateImportLog} from "@/api/archive/importLog";
import {addOss} from "@/api/system/oss";
import Treeselect from "@riophae/vue-treeselect";
import categoryTree from "@/views/archive/category/categoryTree.vue";

export default {
  components: {
    'file-tree': categoryTree, Treeselect,
    FileUploadStep,
    DataDisplay
  },
  created() {
    this.getCategoryList(); // 获取分类列表
    getServerFolderList().then(response => {
      this.folders = response.map(folder => {
        if(folder.hasChildren && folder.children){
          folder.children = folder.children.map(child => {
            if(child.hasChildren === false){
              delete child.children;
            }
            return {
              ...child,
              label: `${child.label}`
            };
          });
        }else {
          delete folder.children;
          folder.label = `${folder.label}`;
        }
        return folder;
      });
    });
  },
  data() {
    return {
      active: 0, // 当前步骤条的活动步骤
      tableData: [], // 表格数据
      selectedRows: [], // 选中的行
      showAllData: true, // 是否显示所有数据
      currentPage: 1, // 当前页码
      pageSize: 10, // 每页显示的条数
      rulesList: [{columnName: "archiveNumber",isEditing: false,itemName:"档号",prefix: "", suffix: ""}],
      upFileList: [],
      attachmentProgress: 0,
      zipLoading : false,
      uploadFiles:[],
      categoryList: [], // 分类列表
      categoryTree: [], // 分类树
      itemList: [], // 项目列表
      itemQueryParams: { categoryId: 0 }, // 项目查询参数
      infoQueryParams: {}, // 信息查配置参数
      columnList: [], // 列表列

      sheetNames: [], // Excel表格的Sheet名称
      selectedSheet: '', // 选中的Sheet名称
      workbook: null, // Excel工作簿

      defaultProps: {
        children: 'children',
        label: 'name'
      },
      selectedNodeKey: null, // 选中的节点Key
      resetOn: 0, // 重置标志
      showOn: 0, // 显示标志
      categoryName: 0,
      batchAttachmentDialogVisible: false,
      uploadUrl: process.env.VUE_APP_BASE_API + "/common/upload",
      headers: {
        Authorization: "Bearer " + getToken(),
      },

      progress : 0,
      totalUploadProgress: 0, // 初始化总上传进度
      // 挂接步骤
      currentStep: 0,
      // 挂接文件列表的翻页
      currentTablePage: 1,
      tablePageSize: 50,
      displayOutput:true,
      attach:false,
      //  上传文件列表禁用案件
      submitUploadButtonDisabled: false,
      // 上传EXCEL按钮被点击，文件上传中
      isSubmitDateTriggered: true,
      fileList:[],
      logQueryParams: {
        status: '',                 // 初始状态
        infoProcessedRecords: 0,         // info 表的已处理记录数初始化为 0
        ossProcessedRecords: 0,          // oss 表的已处理记录数初始化为 0
        infoImportRecords: 0,            // info 表的待导入记录数初始化为 0
        ossImportRecords: 0,             // oss 表的待导入记录数初始化为 0
        startTime: '', // 返回包含日期和时间的字符串
        type: '',
      },
      ossList:[],
      circleStep:0,
      filteredFileList:[],
      importLog:{},
      isClick:true,
      upLoad:false,
      dialogTableVisible: false,
      upLoadErr:0,
      importChoice:0,
      color:'#FFFFFF',
      exportList:[],
      batchAttachmentFromFolderDialogVisible: false,// 在线批量挂接弹出页
      currentFolder:{
        path:''
      }, // 当前选择的在线文件夹
      folders: [], // 在线文件夹列表
      folderPath:'',//文件夹路径
      folderList:[], // 在线挂接文件列表
      toRemoveFolders:[],//在线挂接文件列表（待上传）
      value: '', // 在线挂接文件夹选择值
      unUploadList: [],//上传失败文件信息
      folderscountList:new Map(),
      exportBut: false,
    };
  },
  computed: {
    isDisplayOutput(){
      return this.displayOutput === true;
    },

    isCategory() {
      return this.categoryName === 0;
    },
    isMessageRow() {
      return this.active === 4&&this.displayOutput === true;
    },
    isButtonDisabled() {
      return this.selectedNodeKey === null; // 如果没有选中的节点
    },
    isUploadDisabled() {
      return this.tableData.length === 0 || this.tableData.some(row => row.validationErrors && row.validationErrors.length > 0) ;
    },
    filteredTableData() {
      return this.showAllData ? this.tableData : this.tableData.filter(row => row.validationErrors.length > 0); // 根据是否显示所有数据过滤表格数据
    },
    paginatedTableData() {
      const start = (this.currentPage - 1) * this.pageSize;
      const end = start + this.pageSize;
      return this.filteredTableData.slice(start, end); // 分页后的表格数据
    },
    toggleButtonType() {
      return this.showAllData ? 'danger' : 'success'; // 切换按钮类型
    },

    isElCardBodyLoading() {
      return this.isSubmitDateTriggered === true;
    },

    isFileListDisabled() {
      return this.fileList.length > 0;
    },
  },
  methods: {
    //本地批量挂接方法
    formatTableData() {
      let upload = []
      let as = []
      upload = this.upFileList.filter(file => file.status === '上传至服务器成功');
      as = this.tableData.map(row => {
        const formattedRow = { ...row ,archiveStatus:0 ,sysOssList:[]};
        // 如果 archiveDate 有效，则格式化
        if (formattedRow.archiveDate) {
          const date = new Date(formattedRow.archiveDate);
          if (!isNaN(date.getTime())) {
            formattedRow.archiveDate = date.toISOString().split('T')[0];
          }
        }
        // 基于 archiveNumber 从 upFileList 过滤匹配文件
        upload.forEach(a => {
          if(a.folderName === formattedRow.archiveNumber){
            a.message = '挂接成功';
            formattedRow.sysOssList.push(a);
          }
        })

        if (formattedRow.sysOssList.length > 0) {
          formattedRow.ossStatus = 1
        }else {
          formattedRow.ossStatus = 2
        }
        return formattedRow;
      });
      upload.forEach(a => {
        if(a.message !== '挂接成功'){
          a.message = '挂接失败,档号未匹配或没有该档号';
          this.unUploadList.push(a)
        }else {
          let idx = this.folderscountList.has(a.folderName)
          if(!idx){
            const abc = {name:a.folderName,count:1}
            this.folderscountList.set(a.folderName,1)
          }else{
            this.folderscountList.set(a.folderName,this.folderscountList.get(a.folderName)+1)
          }
        }
      })
      return as;
    },
    // 获取分类列表并构建分类树
    getCategoryList() {
      listCategory().then(response => {
        this.categoryList = response.data; // 获取分类列表数据
        this.constructTree(); // 构建分类树
      });
    },
    // 构建分类树
    constructTree() {
      let map = {};
      this.categoryList.forEach(item => {
        map[item.id] = {...item, children: [],label:item.name};
      });

      let tree = [];
      this.categoryList.forEach(item => {
        if (item.parentId === 0) {
          tree.push(map[item.id]);
        } else if (map[item.parentId]) {
          map[item.parentId].children.push(map[item.id]);
        }
      });
      this.categoryTree = [
        {
          label: "档案类型",
          children: tree,
          parentId:-1
        }
      ];
    },
    // 获取项目列表并设置列信息
    getItemList() {
      listItemSuccess(this.itemQueryParams).then(response => {
        this.itemList = response.data; // 获取项目列表数据
        this.columnList = [];
        const toCamelCase = (str) => {
          return str.replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
        };
        this.itemList.forEach(item => {
          if (item.columnName) {
            const camelCaseColumnName = toCamelCase(item.columnName);
            this.$set(this.infoQueryParams, camelCaseColumnName, "");
            this.columnList.push({
              label: item.itemName,
              prop: camelCaseColumnName,
              isInsert: item.isInsert,
              length: item.columnLength,
              type: item.itemType,
              isRequired: item.isRequired,
            });
          }
        });
        this.$set(this.infoQueryParams, 'categoryId', this.itemQueryParams.categoryId);

      }).catch(error => {
      });
    },

    // 树组件处理节点点击事件
    handleNodeClick(data) {
      if(data.parentId > 0){
        if(this.selectedNodeKey !== data.id){
          this.reset();
        }
        this.selectedNodeKey = data.id; // 设置选中的节点Key
        this.itemQueryParams.categoryId = data.id;// 设置项目查询参数的分类ID
        this.getItemList(); // 获取项目列表
        this.categoryName = data.name;
        this.$message.success(`当前分类: ${data.label}`); // 显示当前分类
        this.active = 1; // 设置步骤条的活动步骤
      }else {
        this.selectedNodeKey = null; // 设置选中的节点Key
        this.itemQueryParams.categoryId = 0;// 设置项目查询参数的分类ID
        this.active = 0; // 设置步骤条的活动步骤
        this.categoryName = 0;
        this.reset();
      }
    },
    // 上传EXCEL处理文件变化事件
    handleFileChange(file) {
      this.isSubmitDateTriggered = false;
      const reader = new FileReader();
      reader.onload = (e) => {
        const data = new Uint8Array(e.target.result);
        this.workbook = XLSX.read(data, {type: 'array', cellDates: true});
        this.sheetNames = this.workbook.SheetNames; // 获取Sheet名称
        this.selectedSheet = this.sheetNames[0]; // 设置选中的Sheet
        let c = this.parseExcelData(this.workbook.Sheets[this.selectedSheet]); // 解析Excel数据
        this.active = c; // 设置步骤条的活动步骤
      };
      reader.readAsArrayBuffer(file.raw);
    },
    // EXCEL处理Sheet页变化事件
    handleSheetChange(sheetName) {
      this.selectedSheet = sheetName; // 设置选中的Sheet
      this.parseExcelData(this.workbook.Sheets[this.selectedSheet]); // 解析Excel数据
    },

// 解析Excel数据
    parseExcelData(sheet) {
      const data = XLSX.utils.sheet_to_json(sheet, {header: 1, raw: false, dateNF: 'yyyy/MM/dd'});
      const headers = data[0];
      let rows = data.slice(1);
      if(rows.length === 0){
        this.reset();
        this.isSubmitDateTriggered = true;
        this.$refs.fileTree.clear();
        this.$message.error('请上传包含导入信息的Excel文件');
        return 0;
      }else{
        const yesList = this.columnList.filter(col => headers.includes(col.label));
      const noList = this.columnList.filter(col => !headers.includes(col.label)&&col.isRequired === '1');
      this.exportList = [];
      rows = rows.filter(row => row.length !== 0);
      rows.forEach(row => {
        const idd = headers.indexOf("档号");
        if(this.exportList.indexOf(row[idd]) === -1){
          this.exportList.push(row[idd])
        }
      });
      this.tableData = rows.map(row => {
        const rowData = { validationErrors: [], categoryId: this.itemQueryParams.categoryId };
        yesList.forEach((yes) => {
          const idx = headers.indexOf(yes.label);
          rowData[yes.prop] = row[idx];
          const error = this.validateCell(row[idx], 1100, yes.type, yes.isRequired, yes.prop);
          if (error) {
            rowData.validationErrors.push({field: yes.prop, messsage: error});
          }
        });
        noList.forEach((no) => {
          rowData[no.prop] = null;
          const error = this.validateCell(null, 1100, no.type, no.isRequired, no.prop);
          if (error) {
            rowData.validationErrors.push({field: no.prop, messsage: error});
          }
        })
        this.isSubmitDateTriggered = true;
        return rowData;
      });
      this.showOn = 1; // 显示标志
      const hasErrors = this.tableData.some(row => row.validationErrors.length > 0);
      if (!hasErrors) {
        this.active = 3; // 设置步骤条的活动步骤
      }
      return 2;
      }
    },

    // 验证单元格数据
    validateCell(value, length, type, isRequired, prop) {
      const skipValidationFields = ['createBy', 'createTime', 'updateBy', 'updateTime'];
      if (skipValidationFields.includes(prop)) {
        return null;
      }


      if (type === 'String') {
        if (isRequired === '1' && (value === null || value === undefined || (typeof value === 'string' && value.trim() === ''))) {
          return '不许为空';
        }
        if (isRequired === '1' && length !== null && value.length > length) {
          return '长度超出限制';
        }
      }
      if (type !== 'String' && isRequired === '1') {
        if (type === 'Long' && !/^\d+$/.test(value)) {
          return '必须是有效的long类型数字';
        }
        if (type === 'Date' && isNaN(Date.parse(value))) {
          return '必须是日期';
        }

      }
      if(prop==='archiveNumber'){
        const idx = this.exportList.findIndex(item=>item===value)
        if(idx===-1){
          return '档号重复';
        }else{
          this.exportList.splice(idx,1)
          return null;
        }
      }

      // 添加对 field3 的特殊验证
    if (prop === 'field3') {
      const regex = /^[0-9\u4e00-\u9fa5a-zA-Z\s\p{P}IVXLCDMivxlcdmⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫ+]+$/u; // 允许数字、汉字、字母、标点符号和空格
      if (!regex.test(value)) {
        return '包含不允许的字符';
      }
    }
      return null;
    },

// 上传EXCEL文件前的验证
    beforeUpload(file) {
      const isExcel = file.type === 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      if (!isExcel) {
        this.$message.error('只能上传Excel文件');
        return false;
      }
      return true;
    },

    // 导入文件表单和文件挂接列表
    submitFileForm() {
      this.isSubmitDateTriggered = false;
      this.importChoice = 1;
      this.submitData(); // 提交数据
    },


    // 批量上传数据
    async batchInsertData(data) {
      this.displayOutput = false;
      // 写入Log表，创建任务号
      const batchSize = 250; // 每批次插入的数据量
      const infoImportRecords = data.length;
      const ossImportRecords = this.folderscountList.size;
      const totalBatches = Math.ceil(data.length / batchSize);
      this.logQueryParams.infoImportRecords = infoImportRecords;
      this.logQueryParams.ossImportRecords = ossImportRecords;
      this.logQueryParams.startTime = new Date().toLocaleString();
      this.logQueryParams.status = 'pending';
      this.logQueryParams.type = 'bendi';
      addImportLog(this.logQueryParams).then(response => {
        this.logQueryParams.id = response.data.id;
      }).catch(error => {
      });
      const insertBatch = async (batchIndex) => {
        if (batchIndex >= totalBatches) {
          let success = 0;
          for (const item of this.folderscountList.values()) {
            if (item === 0) {
              success += 1;
            }
          }
          // 更新log表
          this.logQueryParams.status = 'completed';
          this.logQueryParams.ossProcessedRecords = success;
          updateImportLog(this.logQueryParams).then(response => {
            getImportLog(this.logQueryParams.id).then(response => {
              this.importLog = response.data;
              this.complete()
              this.$message.success('数据插入成功');
            })

          }).catch(error => {
            this.$message.error('更新Log表失败', error);
          });
        } else {
          const start = batchIndex * batchSize;
          const end = Math.min(start + batchSize, data.length);
          const batchData = data.slice(start, end);


          try {
            const response = await bulkAdd(batchData);
            for (let i = 0; i < response.data.length; i++) {
              this.ossList = this.ossList.concat(response.data[i].sysOssList);
            }
            batchData.forEach(item => {
              if (item.sysOssList.length > 0) {
                let idx = this.folderscountList.has(item.sysOssList[0].folderName)
                this.folderscountList.set(item.sysOssList[0].folderName, this.folderscountList.get(item.sysOssList[0].folderName) - item.sysOssList.length);
              }
            })
            this.ossList = this.ossList.map(item => {
              return {
                createBy: item.createBy,
                createTime: item.createTime,
                deleteDate: item.deleteDate,
                fid: item.fid,
                deleteFlg: item.deleteFlg,
                name: item.name,
                path: item.path,
                size: item.size,
                suffix: item.suffix,
                updateBy: item.updateBy,
                updateTime: item.updateTime,
                url: item.url
              }
            })
            // 上传文件到OSS
            addOss(this.ossList).then(response => {
              this.ossList = [];
              this.updateLog(batchIndex, 0, batchData) // 更新log表状态和已处理记录数
              insertBatch(batchIndex + 1)// 插入下一批
            })
          } catch (error) {
            this.$message.error('数据插入失败' + error);
          }
        }


      };
      await insertBatch(0);
    },
    //更新log表状态和已处理记录数
    async updateLog(batchIndex,ossProcessedRecordsInBatch,batchData) {
      // 更新Log表状态和已处理记录数
        this.logQueryParams.status = 'processing'
        this.logQueryParams.infoProcessedRecords += batchData.length
        this.logQueryParams.ossProcessedRecords += ossProcessedRecordsInBatch
        await updateImportLog(this.logQueryParams)
    },

    // 提交表格数据到数据库
    async submitData() {
      const data = this.formatTableData(); // 格式化表格数据
      // 写入Log表，创建任务号
      const batchSize = 1000; // 每批次插入的数据量
      this.logQueryParams.infoImportRecords = data.length;
      this.logQueryParams.startTime = new Date().toLocaleString();
      this.logQueryParams.status = 'pending';
      this.logQueryParams.type = 'dandao';
      addImportLog(this.logQueryParams).then(response => {
        this.logQueryParams.id = response.data.id;
      }).catch(error => {
        this.$message.error('写入Log表失败',error);
      })
      const totalBatches = Math.ceil(data.length / batchSize);
      const insertBatch = async (batchIndex) => {
        if (batchIndex >= totalBatches) {

          // 更新log表
          this.logQueryParams.status = 'completed';
          updateImportLog(this.logQueryParams).then(response => {
            getImportLog(this.logQueryParams.id).then(response => {
              this.importLog = response.data;
              this.complete()
              this.$message.success('数据插入成功');
            })
          }).catch(error => {
          });
        }else {
          const start = batchIndex * batchSize;
          const end = Math.min(start + batchSize, data.length);
          const batchData = data.slice(start, end);
          try {
            const response = await bulkAdd(batchData).then(response => {
              this.updateLog(batchIndex, 0, batchData)// 更新log表状态和已处理记录数
              insertBatch(batchIndex + 1)// 插入下一批
            })
          }catch (error) {
            this.$message.error('数据插入失败',error);
          }
        }

      };

      await insertBatch(0);
    },

    // 清除表单数据
    clearFormData() {
      this.tableData = []; // 清空表格数据
      this.selectedSheet = ''; // 清空选中的Sheet
      this.workbook = null; // 清空工作簿
      this.selectedRows = []; // 清空选中的行
      this.showAllData = true; // 设置显示所有数据为false
    },

    // 处理EXCEL选中行变化事件
    handleSelectionChange(val) {
      this.selectedRows = val; // 设置选中的行
    },

    // 删除EXCEL文件列表选中的行
    deleteSelectedRows() {
      this.tableData = this.tableData.filter(row => !this.selectedRows.includes(row)); // 删除选中的行
      this.selectedRows = []; // 清空选中的行
      const hasErrors = this.tableData.some(row => row.validationErrors.length > 0);
      if (!hasErrors && this.tableData.length > 0) {
        this.active = 3; // 设置步骤条的活动步骤
      }
    },

    // EXCEL切换正确与错误数据显示
    toggleDataDisplay() {
      this.currentPage = 1;
      this.$refs.dataDisplay.updatePage(this.currentPage,this.pageSize);
      this.showAllData = !this.showAllData; // 切换显示所有数据
      const hasErrors = this.tableData.some(row => row.validationErrors.length > 0);
      if (!hasErrors && this.tableData.length > 0) {
        this.active = 3; // 设置步骤条的活动步骤
      }
    },

    // 处理EXCEL分页变化事件
    handlePageChange(page) {
      this.currentPage = page.pageNum; // 设置当前页码
      this.pageSize = page.pageSize;
    },

    // 导出模板
    exportTemplate() {
      this.exportBut = true;
      if (this.exportCategory.findIndex(item => item == this.selectedNodeKey) != -1) {
        this.download('/export/exportTemplate', {
          categoryId: this.selectedNodeKey, categoryName: this.categoryName
        }, `${this.categoryName}模版.xlsx`)
        setTimeout(() => {
          this.exportBut = false;
        }, 1500);
      } else {
        this.$message.error('暂无模版');
        this.exportBut = false;
      }
    },

    // 重置表单
    reset() {
      this.active = 0; // 设置步骤条的活动步骤
      this.selectedNodeKey = null; // ��空选中的节点Key
      this.resetOn = 0; // 清空重置标志
      this.columnList = []; // 清空列表列
      this.showOn = 0; // 清空显示标志
      this.categoryName = 0;
      //重置ossProcessedRecords为0
      this.logQueryParams.ossProcessedRecords = 0;
      this.logQueryParams.infoProcessedRecords = 0;
      this.logQueryParams.status = 'waiting';
      this.isClick=true;
      this.resetAttachment();
      this.clearFormData();
      this.resetFolderForm();
    },


    // 打开批量挂接对话框
    openBatchAttachmentDialog() {
      this.circleStep = 0;
      this.importChoice = 0;
      this.batchAttachmentDialogVisible = true;
    },

    //打开在线批量挂接对话框
    openBatchAttachmentFromFolderDialog(){
      this.batchAttachmentFromFolderDialogVisible = true;
      this.circleStep = 0;
      this.importChoice = 0;
    },

    //选择文件点击事件
    async handleBatchFileChange(file, fileList) {
      this.color = '#FFCC22'
      this.index = 0;
      this.fileList = fileList;
      this.filteredFileList = [...fileList];
      let newFileList = [];
      await Promise.all(fileList.map(async file => {
        if (file.name.split('.').pop() === 'zip') {
          const extractedFiles = await this.handleFileUpload(file.raw);
          newFileList = newFileList.concat(extractedFiles);
          this.fileList = newFileList;
        } else {
          this.resetAttachment();
          this.$message.error('请上传压缩包文件');
        }
      }));
      newFileList = newFileList.filter(file => file.suffix !== 'zip');
      try{
        newFileList = await Promise.all(newFileList.map(async file => {
          const fileNameWithoutSuffix = file.name;
          const fileSuffix = file.name.split('.').pop();
          const existingFile = this.upFileList.find(upFile => upFile.name === fileNameWithoutSuffix);
          this.index += 1;

          if (existingFile) {
            return {
              name: existingFile.name,
              url: existingFile.url || "",
              size: existingFile.size || file.size,
              fid: existingFile.fid || "",
              suffix: existingFile.suffix || fileSuffix,
              status: existingFile.status || '等待上传',
            };
          } else {
            return {
              name: fileNameWithoutSuffix,
              size: file.size,
              fid: "",
              suffix: file.fileSuffix,
              status: '等待上传',
            };
          }
        }));

      }catch (e) {
      }

      this.upFileList = newFileList;
    },


    // 格式化文件大小
    formatFileSize(row) {
      const sizeInMB = (row.size / (1024 * 1024)).toFixed(2);
      return `${sizeInMB} MB`;
    },

    // 批量挂接
    async autoAttach() {
      this.isClick=false;
      this.circleStep = 2;
      this.color = '#FFCC22'
      this.attach=true;
      this.startAttachment();
      const formattedData =this.formatTableData();
      // 提交数据到服务器
      await this.batchInsertData.call(this, formattedData);
          this.active = 4; // 设置步骤条的活动步骤
          this.currentStep = 3;
      this.logQueryParams.status = 'completed';
      updateImportLog(this.logQueryParams).then(response => {
        getImportLog(this.logQueryParams.id).then(response => {
          this.importLog = response.data;
        })
        this.upLoad=false;
        this.upFileList = [];
        this.fileList = [];
        this.uploadFiles = [];
        this.filteredFileList = [];
        this.selectedNodeKey = null;
      }).catch(error => {
      });
    },

    // 处理上传到服务器成功事件
    handleUploadSuccess(response, file, fileList) {
      // 找到上传成功的文件在 upFileList 中的索引
      const index = this.upFileList.findIndex(upFile => upFile.name === file.name);
      if (index !== -1) {
        // 确保 response 对象中包含 data 属性
        const fileResponse = response.data;
        // 更新 upFileList 中对应文件的状态和其他属性
        this.$set(this.upFileList, index, {
          url: fileResponse.fileName || '',
          status: '上传至服务器成功',
          name: fileResponse.originalFilename || '',
          size: fileResponse.size || '',
          suffix: fileResponse.originalFilename ? fileResponse.originalFilename.split('.').pop() : '',
          folderName: file.folderName || '',
          message: '上传成功',
        });
      }
    },

    // 处理上传到服务器失败事件
    handleUploadError(err, file, fileList) {
      this.upLoadErr+=1;
      // 找到上传失败的文件在 upFileList 中的索引
      const index = this.upFileList.findIndex(upFile => upFile.name === file.name);

      if (index !== -1) {
        // 更新 upFileList 中对应文件的状态
        this.$set(this.upFileList, index, {
          ...this.upFileList[index],
          status: '上传失败',
        });
      }
    },

    // 批量上传文件
    async uploadFolderFiles() {
      // 禁用上传按钮
      this.submitUploadButtonDisabled=true;
      const batchSize = 1; // 每次上传的文件数量
      // 进度条服务
      const totalFiles = this.fileList.length;
      let uploadedFiles = 0;
      // 循环遍历文件列表，按批次上传
      for (let i = 0; i < this.fileList.length; i += batchSize) {
        const batch = this.fileList[i]; // 获取当前批次的文件
         // 并行上传当前批次的文件
         await this.uploadFile(batch);
        // 进度条服务
        uploadedFiles += 1;
        this.totalUploadProgress = Math.round((uploadedFiles / totalFiles) * 100);
      }
      this.isClick=true;
      if (this.upLoadErr===this.fileList.length) {
        this.$confirm('文件上传失败', {
          confirmButtonText: '确定', //确认按钮的文字
          showCancelButton: false, //是否显示取消按钮
          showClose: false, //是否显示关闭按钮
          closeOnClickModal: false, //是否可以通过点击空白处关闭弹窗
          type: 'info'
        }).then(() => {
          this.resetAttachment();
          this.upLoad = false;
          this.batchAttachmentDialogVisible = false;
        })
      }else {
        this.$message.success('文件上传完成');
      }
      const unUpload = this.upFileList.filter(upFile => {upFile.status === '上传失败'});
      unUpload.forEach(d => d.message = '上传失败');
      this.unUploadList.concat(unUpload);
      // 解除禁用上传按钮
      this.submitUploadButtonDisabled=false;
      // 流程变化
      this.currentStep = 2;
      this.color = '#FFFFFF';
    },

    // 上传单个文件
    async uploadFile(file) {
      try {
        const formData = new FormData(); // 创建FormData对象
        formData.append('file', file.raw); // 将文件添加到FormData对象中
        // 发送POST请求上传文件
        const response = await axios.post(this.uploadUrl, formData, {
          headers: this.headers, // 设置请求头
        });
        // 调用上传成功的处理方法
        this.handleUploadSuccess(response, file, this.fileList);
      } catch (error) {
        // 调用上传失败的处理方法
        this.handleUploadError(error, file, this.fileList);
      }
    },

    // 提交上传至服务器
    submitUpload() {
      this.upLoadErr=0;
      this.upLoad=true;
      this.isClick=false;
      this.circleStep = 1;
      this.color = '#FFCC22'
      this.uploadFolderFiles(); // 手动触发上传
    },

    removeFile(index) {
      this.fileList.splice(index, 1);
      this.upFileList.splice(index, 1);
    },


    // 解压文件
    async handleFileUpload(event) {

      this.zipLoading = true;
      this.progress = 0;
      // 将 File 对象转为 Blob 对象
      const file = event.slice(0, event.size);
      const buffer = await file.arrayBuffer();
      if (buffer) {
        const zip = new JSZip();
        const zipContent = await zip.loadAsync(buffer);
        const files = [];
        const processZipEntry = async (zipEntry) => {
          if (!zipEntry.dir) {
            const fileName = zipEntry.name.split('/').pop(); // 只保留文件名
            const folderName = zipEntry.name.split('/')[1]; // 只保留文件夹名
            const fileBlob = await zipEntry.async("blob"); // 使用 async 方法获取 Blob 对象
            const file = new File([fileBlob], fileName, {
              type: fileBlob.type || '', // 可能需要设置 MIME 类型
              lastModified: zipEntry.date ? zipEntry.date.getTime() : Date.now()
            });
            files.push({
              folderName: folderName,
              name: fileName,
              url: '',
              status: 'ready',
              raw: file,
              uid: file.lastModified,
              size: file.size, // 获取文件大小
            });
          }
        };
        const zipEntries = Object.keys(zipContent.files);
        for (let i = 0; i < zipEntries.length; i++) {
          await processZipEntry(zipContent.files[zipEntries[i]]);
          if (i % 100 === 0) {
            await new Promise(resolve => setTimeout(resolve, 0)); // 每处理100个文件，暂停一下
          }
          this.progress = Math.round((i + 1) / zipEntries.length * 100);
        }
        // 将解压后的文件列表赋值给 el-upload 组件的 file-list 属性
        this.uploadFiles = files.map(file => {
          file.raw.uid = file.raw.lastModified; // 在 raw 中添加 uid 属性
          return {
            ...file,
            percentage: 0,
          };
        });
        this.zipLoading = false;
        this.currentStep = 1;
        this.color = '#FFFFFF';
        return this.uploadFiles;
      }
    },

    look(){
      this.dialogTableVisible = true;
    },

    // 解压缩文件进度条
    formatProgress() {
      if (this.progress !== 100) {
        return '正在获取文件列表' + this.progress + '%';
      } else {
        return '文件列表加载完毕';
      }
    },
    // 文件上传进度条
    formatTotaUploadProgress() {
      if (this.totalUploadProgress !== 100) {
        return '正在上传文件列表' + this.totalUploadProgress + '%';
      } else {
        return '上传文件列表完毕';
      }
    },
    // 挂接进度
    startAttachment() {
      this.attach = true;
      this.attachmentProgress = 0;
      this.interval = setInterval(() => {
        if (this.currentStep === 3) {
          this.attachmentProgress = 100;
          clearInterval(this.interval);
        } else {
          this.attachmentProgress += 0.3; // 缓慢增长
          if (this.attachmentProgress >= 100) {
            this.attachmentProgress = 99;
            clearInterval(this.interval);
          }
        }
      }, 100); // 每100毫秒更新一次进度
    },
    formatAttachmentProgress(percentage) {
      return this.currentStep === 3 ? '挂接完成' : `正在挂接文件 ${percentage.toFixed(2)}%`;
    },

    // 重置挂接内容
    resetAttachment() {
      this.currentStep = 0;
      this.rulesList= [{columnName: "archiveNumber",isEditing: false,itemName:"档号",prefix: "", suffix: ""}];
      this.upFileList = [];
      this.fileList = [];
      this.totalUploadProgress = 0;
      this.attachmentProgress = 0;
      this.progress = 0;
      this.zipLoading = false;
      this.uploadFiles = [];
      this.filteredFileList = [];
      this.circleStep = 0;
      this.importLog={};
      this.attach = false;
      this.upLoadErr=0;
      this.color = '#FFFFFF';
      this.folderscountList = new Map();
    },

    // 辅助函数：去掉文件名的后缀
    removeFileExtension(fileName) {
      const lastDotIndex = fileName.lastIndexOf('.');
      if (lastDotIndex === -1) return fileName;
      return fileName.substring(0, lastDotIndex);
    },
    takeMeToArchive(){
      // this.displayOutput=false;
      this.$router.push({
        path: '/ArchiveManagement/info0',
        query: {categoryId:null},
      });
    },
    isClose(){
      if (this.upLoad){
          this.batchAttachmentDialogVisible = true;
        }
    },
    resetTree(){
      if(this.$refs.fileTree){
        this.$refs.fileTree.clear();
      }
      this.reset();
    },
    //批量挂接完成
    complete(){
      this.showOn = 0;
      this.active = 4; // 设置步骤条的活动步骤
      this.isSubmitDateTriggered = true;
      this.displayOutput=true;
      this.upLoad=false;
      this.upFileList = [];
      this.fileList = [];
      this.uploadFiles = [];
      this.filteredFileList = [];
      this.selectedNodeKey = null;
    },

    //选择文件夹方法
    handleFolderChange() {
      const selected = this.$refs['folderCascader'].getCheckedNodes();
      if (selected.length > 0) {
        this.currentFolder.path = this.getFullPath(selected[0]);
      }
    },

    //递归取父节点label拼成路径
    getFullPath(node) {
      if (!node.parent) {
        return node.label;
      }
      return this.getFullPath(node.parent) + "/" + node.label;
    },
    //在线批量挂接确认按钮
    submitFolderForm(){
      this.isClick = false;
      getServerFileList(this.currentFolder).then(response => {
        this.folderList = [];
        this.folderList = response.filter(file => file.hasChildren === true);
        //判断folderList是否为空
        if (this.folderList.length === 0){
          this.$message.error('文件夹为空或不是文件夹，请重新选择');
          this.isClick = true;
        }else {
          this.logQueryParams.status = "panding";
          this.logQueryParams.infoImportRecords = this.tableData.length;
          this.logQueryParams.ossImportRecords = this.folderList.length;
          this.logQueryParams.startTime = new Date().toLocaleString();
          this.logQueryParams.type = 'zaixian';
          addImportLog(this.logQueryParams).then(response => {
            this.currentStep = 2;
            this.logQueryParams.id = response.data.id;
            this.isClick = true;
          })
        }
      })
    },
    //在线批量挂接重置按钮
    resetFolderForm(){
      this.folderList = [];
      this.folderPath = '';
      this.currentStep = 0;
      this.currentFolder = {path:""};
      this.value = '';
      this.folderscountList = new Map();
    },
    // 在线批量挂接开始挂接
    attachFolder() {
      try {
        // 清空toRemoveFolders
        this.toRemoveFolders = [];
        this.isClick = false;
        // 将文件夹列表的名称存入集合以便快速查找
        const folderNames = this.folderList.map(folder => folder.name);
        const formatData = (date) => {
          const year = String(date.getFullYear());
          const month = String(date.getMonth() + 1).padStart(2, '0');
          const day = String(date.getDate()).padStart(2, '0');
          const hour = String(date.getHours()).padStart(2, '0');
          const minute = String(date.getMinutes()).padStart(2, '0');
          const second = String(date.getSeconds()).padStart(2, '0');
          return `${year}-${month}-${day} ${hour}:${minute}:${second}`;
        }
        let conount = 0;
        this.tableData.forEach(tableItem => {
          conount++;
          // 处理挂接内容
          tableItem.sysOssList = [];
          tableItem.archiveStatus = 0;
          tableItem.createTime = formatData(new Date());

          // 遍历文件夹列表
          this.folderList.forEach(folder => {
            if (folder.name === tableItem.archiveNumber) {
              // 清空sysOssList，并根据子文件夹状态更新
              tableItem.sysOssList = folder.children.length === 0 ? [] : folder.children.map(child => ({
                ...child,
              }));
              folder.message = '挂接成功'
            }
          });
          // 更新toRemoveFolders状态
          this.toRemoveFolders.push({
            ...tableItem,
            ossStatus: tableItem.sysOssList.length > 0 ? 1 : 2
          });

        });
        // 遍历子文件夹，判断挂接失败的文件
        this.folderList.forEach(folder => {
          if (folder.children.length !== 0) {
            if (folder.message !== '挂接成功') {
              folder.message = '挂接失败';
              this.unUploadList.push(...folder.children);
            }else{
              let idx = this.folderscountList.has(folder.name)
              if(!idx){
                this.folderscountList.set(folder.name,folder.children.length)
              }else{
                this.folderscountList.set(folder.name,this.folderscountList.get(folder.name) + folder.children.length)
              }
            }
          }
        });
        // 开始上传到数据库
        if (this.toRemoveFolders.length > 0) {
          bulkAdd(this.toRemoveFolders).then(result => {
            result.data.forEach(item => {
              if(item.sysOssList.length > 0) {
                let idx = this.folderscountList.has(item.archiveNumber)
                this.folderscountList.set(item.archiveNumber, this.folderscountList.get(item.archiveNumber) - item.sysOssList.length)
              }
            })
            let success = 0;
            for(const item of this.folderscountList.values()){
              if(item === 0) {
                success += 1;
              }
            }
            this.logQueryParams.infoProcessedRecords = result.data.length;
            const ossList = result.data.flatMap(item => item.sysOssList || []);
            this.logQueryParams.ossProcessedRecords = success;
            this.logQueryParams.status = "completed";
            const addOssListResult = addOss(ossList);
          }).then(() => {
            // 更新导入日志
            return updateImportLog(this.logQueryParams);
          }).then(response => {
            // 重置数据并跳转到完成页面
            this.reset();
            this.complete();
            this.resetFolderForm();
            this.tableData = [];
            this.toRemoveFolders = [];
            this.folderList = [];
            this.folderPath = '';
            this.currentStep = 3;
            return getImportLog(this.logQueryParams.id);
          }).then(response => {
            // 更新导入日志显示
            this.importLog = response.data;
          }).catch(error => {
            this.$message.error("更新日志发生错误", error);
          });
        } else {
          this.$message.error("没有上传的数据，请联系管理员");
        }
      }catch (e) {
        this.$message.error("处理挂接时出现错误", e);
      }
    }

  }


};
</script>

<style scoped>
.app-container {
  display: flex;

}

.tree {
  width: 12%;
}

.fixed-tree {
  width: 100%;
}

.el-card__body {
  width: 88%;
}

.messageRow {
  display: flex;
  justify-content: center;
  margin-top: 15%;
  height: 100vh;
}

.box-card {
  width: 50%;
  margin: 0 auto;
}

.text-center {
  text-align: center;
}

.box-card {
  width: 50%;
  margin: 0 auto;
  padding: 20px;
  background-color: #f9f9f9;
  border-radius: 10px;
}

.text-center {
  text-align: center;
}

.success-icon {
  font-size: 48px;
  color: green;
  text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
}

.success-message {
  font-size: 18px;
  margin-top: 10px;
}

.reset-button {
  margin-top: 20px;
  font-size: 16px;
  padding: 10px 20px;
}


.table-container {
  max-height: 66vh; /* 限制表格的最大高度 */
  overflow-y: auto; /* 添加垂直滚动条 */
}

.unique-container .completion-message-wrapper {
  /* border: 2px solid #1C69DB; 添加边框 */
  padding: 20px; /* 内边距 */
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 添加阴��� */
  background-color: #1C69DB; /* 背景颜色 */
  position: absolute; /* 绝对定位 */
  top: 50%; /* 垂直居中 */
  left: 62%; /* 水平居中 */
  transform: translate(-50%, -50%); /* 使元素中心对齐 */
  width: 80%; /* 横向不要占满 */
  max-width: 600px; /* 最大宽度 */
  height: 45%; /* 增加高度 */
  z-index: 0; /* 设置层级 */
  display: flex; /* 使用flex布局 */
  align-items: center; /* 垂直居中 */
  justify-content: center; /* 水平居中 */
}

.unique-container .completion-message {
  position: relative; /* 相对定位 */
  z-index: 1; /* 设置层级 */
  display: flex; /* 使用flex布局 */
  flex-direction: column; /* 垂直排列 */
  align-items: center; /* 水平居中 */
  justify-content: center; /* 垂直居中 */
}

.unique-container .success-icon {
  font-size: 48px;
  animation: bounce 1s ease-in forwards; /* 将动画时间缩短为1秒 */
  margin-bottom: 22px; /* 增加与文字之间的距离 */
}

.unique-container .success-message {
  font-size: 18px;
  margin-top: 10px;
  text-align: center;
  color: #fff; /* 改成纯白色 */
  animation: fadeIn 1s ease-in-out;
}

.confirmRuleButton {
  display: flex;
  flex-direction: column;
  align-items: center;
  height: 100%; /* 需要根据实际情况调整 */
}


@keyframes fadeIn {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

@keyframes bounce {
  0% {
    transform: translateY(-100px);
    animation-timing-function: cubic-bezier(0.8, 0, 1, 1);
  }
  25% {
    transform: translateY(0);
    animation-timing-function: cubic-bezier(0, 0, 0.2, 1);
  }
  50% {
    transform: translateY(-20px); /* 第二次弹起高度降低 */
    animation-timing-function: cubic-bezier(0.8, 0, 1, 1);
  }
  75% {
    transform: translateY(0);
    animation-timing-function: cubic-bezier(0, 0, 0.2, 1);
  }
  100% {
    transform: translateY(0);
    animation-timing-function: cubic-bezier(0, 0, 1, 1); /* 最后一次下落最快 */
  }
}
.upload-demo {
  width: 150px;  /* 调整上传框的宽度 */
  height: 150px; /* 调整上传框的高度 */
  border: 1px dashed #d9d9d9; /* 上传框的边框样式 */
  display: flex;
  justify-content: center;
  align-items: center;
  border-radius: 4px; /* 圆角边框 */
  background-color: #f9f9f9; /* 上传框的背景颜色 */
  margin-left: -100px;
}
.upload-icon {
  font-size: 48px; /* 加号图标的大小 */
  color: #409EFF;  /* 图标的颜色 */
}
.file-item {
  margin-top: 10%;
}
/* 默认步骤样式 */
.el-steps .el-step {
  color: #606266; /* 默认颜色 */
}

/* 活动步骤样式 */
.el-steps .active-step .el-step__title {
  color: #409EFF !important; /* 活动步骤的颜色 */
}

/* 非活动步骤样式 */
.el-steps .inactive-step .el-step__title {
  color: #c0c4cc !important; /* 非活动步骤的颜色 */
}

</style>
