<template>
  <div class="app-container">

    <!-- 树组件 -->
    <el-row class="tree">
      <el-col :span="6" class="fixed-tree">
        <slot name="tree-selection">
          <TreeSelection :categoryTree="categoryTree"
                         :defaultProps="defaultProps"
                         :selectedNodeKey="selectedNodeKey"
                         @node-click="handleNodeClick" />
        </slot>
      </el-col>
    </el-row>
    <!-- 主体 -->
    <el-row class="el-card__body" >
      <!-- 进度条 -->
      <el-row class="progressBar">
        <el-col :span="24">
          <el-row :gutter="10" class="mb8">
            <el-steps :active="active" finish-status="success">
              <el-step v-if="isCategory" title="选择左侧档案类型"></el-step>
              <el-step v-if="!isCategory" :title="`当前分类: ${categoryName}`"></el-step>
              <el-step title="下载模板,选择文件,处理错误"></el-step>
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
                         :disabled="isUploadDisabled || isButtonDisabled || !isDisplayOutput"
                         @click="submitFileForm">
                单导入EXCEL
              </el-button>
              <!-- 批量挂接按钮 -->
              <el-button :type="isUploadDisabled ? 'success disabled' : 'success'"
                         :disabled="isUploadDisabled || isButtonDisabled || !isDisplayOutput"
                         @click="openBatchAttachmentDialog">
                批量挂接并导入EXCEL
              </el-button>
              <!-- 导出模板 -->
              <el-button type="primary"
                         :disabled="isButtonDisabled || !isDisplayOutput"
                         plain
                         @click="exportTemplate">导出模板
              </el-button>
              <!-- 重置按钮 -->
              <el-button @click="reset">
                <el-icon class="el-icon-refresh"> </el-icon>
                重置
              </el-button>
            </el-row>
          </el-form>
        </el-col>
      </el-row>

      <!-- 表格 -->
      <el-row class="main_body" v-if="showOn&&!isMessageRow">
        <slot name="data-display">
          <DataDisplay ref="dataDisplay"
                       :paginatedTableData="paginatedTableData"
                       :columnList="columnList"
                       :currentPage="currentPage"
                       :pageSize="pageSize"
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
              <p class="success-message">此次共导入 {{ content }} 条记录。</p>
              <el-button type="primary" @click="look" size="medium" class="reset-button">查看结果</el-button>
              <el-button type="primary" @click="reset" size="medium" class="reset-button">再次导入</el-button>
            </div>
          </el-card>
        </el-col>
      </el-row>

      <!-- 文件夹挂接弹出页 -->
      <el-dialog title="文件挂接流程" :visible.sync="batchAttachmentDialogVisible" width="80%">

        <el-row :gutter="20" style="height: 70vh;">
          <!-- 左侧处理流程 -->
          <el-col :span="6" style="display: flex; flex-direction: column; height: 100%;">
            <div v-for="(step, index) in steps" :key="index"
                 :style="{
                   backgroundColor: getStepColor(index),
                   color: '#fff',
                   flex: 1,
                   display: 'flex',
                   alignItems: 'center',
                   marginBottom: index < steps.length - 1 ? '2px' : '0',
                   paddingLeft: '10px',
                   position: 'relative',
                   transition: 'background-color 0.5s ease',
                 }">
              <!-- 序号 -->
              <span :style="{
                      fontSize: '80px',
                      opacity: '0.9',
                      flex: '0 0 30%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }">{{ index + 1 }}</span>
              <!-- 步骤标题 -->
              <span :style="{
                      fontSize: '22px',
                      flex: '0 0 55%',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }">{{ step.title }}</span>

              <!-- 完成标志 -->
              <div v-if="index < currentStep - 1"
                   :style="{
                      position: 'absolute',
                      top: '0',
                      left: '0',
                      width: '0',
                      height: '0',
                      borderLeft: '30px solid white',
                      borderBottom: '30px solid transparent',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }">
                <span :style="{
                        width: '8px',
                        height: '16px',
                        borderBottom: '4px solid ' + getStepColor(index),
                        borderRight: '4px solid ' + getStepColor(index),
                        position: 'absolute',
                        left: '-25px',
                        top: '2px',
                        transform: 'rotate(45deg)',
                      }"></span>
              </div>

              <!-- 等待中的标志 -->
              <div v-else-if="index >= currentStep"
                   :style="{
                      position: 'absolute',
                      top: '0',
                      left: '0',
                      width: '0',
                      height: '0',
                      display: 'flex',
                      alignItems: 'center',
                      justifyContent: 'center',
                    }">
                <span :style="{
                        width: '16px',
                        height: '16px',
                        backgroundColor: 'white',
                        borderRadius: '50%',
                        position: 'absolute',
                        left: '5px',
                        top: '5px',
                      }"></span>
              </div>
            </div>
          </el-col>

          <!-- 中间按钮区 -->
          <el-col :span="2" style="display: flex; flex-direction: column; align-items: center; justify-content: center;">
            <!-- 上传需要挂载的文件 -->
            <el-upload
              class="upload-demo"
              :action="uploadUrl"
              :headers="headers"
              :on-change="handleBatchFileChange"
              :file-list="fileList"
              :show-file-list="false"
              :auto-upload="false"
              multiple
              :on-success="handleUploadSuccess"
              :on-error="handleUploadError"
              ref="upload"
            >
              <el-button type="primary" :disabled="isSelectFileDisabled">选择文件</el-button>
            </el-upload>

            <el-button type="success" @click="submitUpload" :disabled="isSubmitUploadButtonDisabled" style="margin-top: 10px;">开始上传</el-button>

            <div class="file-info" style="margin-top: 10px; position: relative;">
              <!-- 设置挂接规则按钮 -->
              <el-button type="primary" @click="toggleDropdownVisibility" :disabled="isToggleDropdownDisabled" plain>挂接规则</el-button>

              <!-- 设置挂接挂接则列表 -->
              <div v-if="isDropdownVisible" class="dropdown-menu" style="position: absolute; top: 100%; left: 0; z-index: 1000; background: white; border: 1px solid #ccc; padding: 10px; max-height: 300px; overflow-y: auto;">
                <div v-for="item in itemList" :key="item.columnName" @click="chooseItem(item)" style="padding: 5px; cursor: pointer;">
                  {{ item.itemName }}
                </div>
              </div>
            </div>

            <!-- 开始挂接按钮 -->
            <el-button type="primary" @click="autoAttach" :disabled="isAutoAttachDisabled" style="margin-top: 10px;">开始挂接</el-button>

            <!-- 重置挂接按钮 -->
            <el-button type="warning" @click="resetAttachment" style="margin-top: 10px;margin-right: 10px">重置挂接</el-button>
          </el-col>

          <!-- 右侧内容 -->
          <el-col :span="16" style="height: 100%;">
            <el-row v-if="currentStep < 2" style="display: flex; justify-content: center; align-items: center; width: 100%; height: 100%;">
              <img :src="require('@/assets/images/lock.png')" alt="Lock Image">
            </el-row>

            <el-row v-if="currentStep === 2||currentStep === 4 " class="table-container">
              <el-table
                :data="currentPageData"
                style="width: 100%; margin-top: 0px; overflow-x: auto;"
              >
                <el-table-column label="序号" type="index"></el-table-column>
                <el-table-column prop="status" label="状态"></el-table-column>
                <el-table-column prop="name" label="文件名"></el-table-column>
                <el-table-column label="大小" :formatter="formatFileSize"></el-table-column>
                <el-table-column label="操作">
                  <template slot-scope="scope">
                    <el-button type="danger" @click="removeFile(scope.$index)">删除</el-button>
                  </template>
                </el-table-column>
              </el-table>

              <el-pagination
                @size-change="onPageSizeChange"
                @current-change="onPageChange"
                :current-page="currentTablePage"
                :page-sizes="[50, 100, 200]"
                :page-size="tablePageSize"
                layout="total, sizes, prev, pager, next, jumper"
                :total="tableData.length"
              ></el-pagination>
            </el-row>

            <div v-if="currentStep === 3" class="confirmRuleButton" style="display: flex; flex-direction: column; align-items: center; width: 100%;">
              <el-table :data="rulesList" style="width: 100%; margin-top: 0;">
                <el-table-column type="index" label="序号"></el-table-column>
                <el-table-column prop="itemName" label="字段"></el-table-column>
                <el-table-column label="前缀">
                  <template slot-scope="scope">
                    <el-input v-if="scope.row.isEditing" v-model="scope.row.prefix" placeholder="请输入前缀"></el-input>
                    <span v-else>{{ scope.row.prefix }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="后缀">
                  <template slot-scope="scope">
                    <el-input v-if="scope.row.isEditing" v-model="scope.row.suffix" placeholder="请输入后缀"></el-input>
                    <span v-else>{{ scope.row.suffix }}</span>
                  </template>
                </el-table-column>
                <el-table-column label="操作">
                  <template slot-scope="scope">
                    <el-button v-if="!scope.row.isEditing" @click="editRule(scope.row)" type="primary" size="small">修改</el-button>
                    <el-button v-if="scope.row.isEditing" @click="saveRule(scope.row)" type="success" size="small">保存</el-button>
                    <el-button @click="deleteRule(scope.$index)" type="danger" size="small">删除</el-button>
                  </template>
                </el-table-column>
              </el-table>
              <el-button @click="confirmRules" type="primary" style="margin-top: 10px;">确定规则</el-button>
            </div>

<!--            <div v-if="isAttachmentComplete" class="unique-container">-->
            <div v-if="isAttachmentComplete" class="unique-container">
              <div class="completion-message-wrapper">
                <div class="completion-message">
                  <el-icon class="el-icon-success success-icon" style="font-size: 64px; color: #fff;"></el-icon>
                  <div class="success-message">文件挂接完成，您可以关闭当前页面。</div>
                </div>
              </div>
            </div>

          </el-col>
        </el-row>
        <div style="height: 1px;margin-top: 10px">
          <!-- 解压缩进度条 -->
          <el-progress
            v-if="currentStep<2"
            :text-inside="true"
            :stroke-width="20"
            :percentage="progress"
            :format="formatProgress"
            :text-color="'#FFFFFF'"
            :define-back-color="'#FFFFFF'">
          </el-progress>
          <!-- 上传进度条 -->
          <el-progress
            v-if="currentStep>1 && currentStep<4"
            :text-inside="true"
            :stroke-width="20"
            :percentage="totalUploadProgress"
            :format="formatTotaUploadProgress"
            :text-color="'#FFFFFF'"
            :define-back-color="'#FFFFFF'">
          </el-progress>
          <el-progress
            v-if="isAttaching"
            :text-inside="true"
            :stroke-width="20"
            :percentage="attachmentProgress"
            :format="formatAttachmentProgress"
            :text-color="'#FFFFFF'"
            :define-back-color="'#FFFFFF'">
          </el-progress>
        </div>
      </el-dialog>
    </el-row>
  </div>
</template>

<script>
import { listCategory } from "@/api/archive/category";
import { listItemSuccess} from "@/api/archive/item";
import * as XLSX from 'xlsx';
import { bulkAdd } from "@/api/archive/info";
import TreeSelection from "@/views/archive/info/TreeSelection.vue";
import DataDisplay from "@/views/archive/info/DataDisplay.vue";
import FileUploadStep from "@/views/archive/info/FileUploadStep.vue";
import {getToken} from "@/utils/auth";
import JSZip from 'jszip';
import axios from "axios";
import {white} from "chalk";



export default {
  components: {
    TreeSelection,
    FileUploadStep,
    DataDisplay
  },
  created() {
    this.getCategoryList(); // 获取分类列表

  },
  data() {
    return {
      active: 0, // 当前步骤条的活动步骤
      tableData: [], // 表格数据
      selectedRows: [], // 选中的行
      showAllData: true, // 是否显示所有数据
      currentPage: 1, // 当前页码
      pageSize: 15, // 每页显示的条数
      rulesList: [{columnName: "archiveNumber",isEditing: false,itemName:"档号",prefix: "", suffix: ""}],
      upFileList: [],
      attachmentProgress: 0,
      zipLoading : false,
      uploadFiles:[],
      isDropdownVisible: false,
      selectedProperty: '',
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
      content: 0, // 导入的记录数
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

      steps: [
        { title: '开始选择文件' },
        { title: '进行文件上传' },
        { title: '添加挂接规则' },
        { title: '开始挂接附件' },
        { title: '挂接导入完成' },
      ],
      // 挂接步骤
      currentStep: 1,
      // 挂接文件列表的翻页
      currentTablePage: 1,
      tablePageSize: 50,


      //   挂接成功弹窗
      isAttachmentComplete: false,

      displayOutput:true,
      attach:false,
    };
  },
  computed: {
    isAttaching(){
      return this.attach === true;
    },
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
      return this.tableData.length === 0 || this.tableData.some(row => row.validationErrors && row.validationErrors.length > 0);
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
    currentPageData() {
      const start = (this.currentTablePage - 1) * this.tablePageSize;
      const end = this.currentTablePage * this.tablePageSize;
      return this.upFileList.slice(start, end);
    },
    isSelectFileDisabled() {
      return this.currentStep !== 1 ;
    },
    isSubmitUploadButtonDisabled() {
      return this.currentStep !== 2;
    },
    isToggleDropdownDisabled() {
      return this.currentStep !== 3;
    },
    isAutoAttachDisabled() {
      return this.currentStep !== 4;
    },

  },
  methods: {
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
        map[item.id] = {...item, children: []};
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
          name: "档案类型",
          children: tree
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
      this.selectedNodeKey = data.id; // 设置选中的节点Key
      this.itemQueryParams.categoryId = data.id; // 设置项目查询参数的分类ID
      this.getItemList(); // 获取项目列表
      this.categoryName = data.name;
      this.$message.success(`当前分类: ${data.name}`); // 显示当前分类
      this.active = 1; // 设置步骤条的活动步骤
    },
    // 上传EXCEL处理文件变化事件
    handleFileChange(file) {
      const reader = new FileReader();
      reader.onload = (e) => {
        const data = new Uint8Array(e.target.result);
        this.workbook = XLSX.read(data, {type: 'array', cellDates: true});
        this.sheetNames = this.workbook.SheetNames; // 获取Sheet名称
        this.selectedSheet = this.sheetNames[0]; // 设置选中的Sheet
        this.parseExcelData(this.workbook.Sheets[this.selectedSheet]); // 解析Excel数据
        this.active = 2; // 设置步骤条的活动步骤
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
      const rows = data.slice(1);
      this.tableData = rows.map(row => {
        const rowData = {validationErrors: [], categoryId: this.itemQueryParams.categoryId};
        headers.forEach((header, index) => {
          const column = this.columnList.find(col => col.label === header);
          if (column) {
            rowData[column.prop] = row[index];
            const error = this.validateCell(row[index], column.length, column.type, column.isRequired, column.prop);
            if (error) {
              rowData.validationErrors.push({field: column.prop, messssage: error});
            }
          }
        });
        return rowData;
      });
      this.showOn = 1; // 显示标志
      const hasErrors = this.tableData.some(row => row.validationErrors.length > 0);
      if (!hasErrors) {
        this.active = 3; // 设置步骤条的活动步骤
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
      this.submitData(); // 提交数据
    },

    // 提交数据到服务器
    submitData() {
      const batchSize = 1000; // 每批次插入的数据量
      const totalBatches = Math.ceil(this.tableData.length / batchSize);

      const insertBatch = (batchIndex) => {
        if (batchIndex >= totalBatches) {
          this.$message.success('数据插入成功');
          this.content = this.tableData.length; // 设置导入的记录数
          this.active = 4; // 设置步骤条的活动步骤
          this.currentStep = 5;
          return;
        }

        const start = batchIndex * batchSize;
        const end = Math.min(start + batchSize, this.tableData.length);
        const batchData = this.tableData.slice(start, end);

        bulkAdd(batchData).then(response => {
          if (batchIndex === totalBatches - 1) {
            this.tableData = response.data;
          }
          insertBatch(batchIndex + 1);
        }).catch(error => {
          this.$message.error('数据插入失败');
        });
      };

      insertBatch(0);
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
      this.showAllData = !this.showAllData; // 切换显示所有数据
      const hasErrors = this.tableData.some(row => row.validationErrors.length > 0);
      if (!hasErrors && this.tableData.length > 0) {
        this.active = 3; // 设置步骤条的活动步骤
      }
    },

    // 处理EXCEL分页变化事件
    handlePageChange(page) {
      this.currentPage = page; // 设置当前页码
    },

    // 导出模板
    exportTemplate() {
      const excludedColumns = ['主键ID', '创建者', '更新者', '创建时间', '更新时间'];
      const headers = this.columnList
        .filter(col => !excludedColumns.includes(col.label))
        .map(col => col.label);

      const worksheet = XLSX.utils.aoa_to_sheet([headers]);
      const workbook = XLSX.utils.book_new();
      XLSX.utils.book_append_sheet(workbook, worksheet, "Template");

      const fileName = `${this.categoryName}模板.xlsx`;
      XLSX.writeFile(workbook, fileName);
    },

    // 重置表单
    reset() {
      this.active = 0; // 设置步骤条的活动步骤
      this.selectedNodeKey = null; // ��空选中的节点Key
      this.resetOn = 0; // 清空重置标志
      this.columnList = []; // 清空列表列
      this.showOn = 0; // 清空显示标志
      this.categoryName = 0;
      this.resetAttachment();
      this.clearFormData();
    },


    // 打开批量挂接对话框
    openBatchAttachmentDialog() {
      this.batchAttachmentDialogVisible = true;
    },

    //选择文件点击事件
    async handleBatchFileChange(file, fileList) {
      this.index = 0;
      this.fileList = fileList;
      // const fileType = file.name.split('.').pop();
      let newFileList = [];
      await Promise.all(fileList.map(async file => {
        if (file.name.split('.').pop() === 'zip') {
          const extractedFiles = await this.handleFileUpload(file.raw);
          newFileList = newFileList.concat(extractedFiles);
          this.fileList = newFileList;
        } else {
          newFileList.push(file);
        }
      }));
      newFileList = newFileList.filter(file => file.suffix !== 'zip');
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

      this.currentStep = 2;
      this.upFileList = newFileList;
    },


    // 格式化文件大小
    formatFileSize(row) {
      const sizeInMB = (row.size / (1024 * 1024)).toFixed(2);
      return `${sizeInMB} MB`;
    },

    // 添加挂接规则
    addRule() {
      const selectedItem = this.itemList.find(item => item.columnName === this.selectedProperty);
      this.rulesList.push({
        itemName: selectedItem ? selectedItem.itemName : '',
        columnName: selectedItem ? this.toCamelCase(selectedItem.columnName) : '',
        prefix: '',
        suffix: '',
        isEditing: false
      });
      this.selectedProperty = '';
      this.currentStep = 3;
    },

    // 编辑挂接规则
    editRule(rule) {
      rule.isEditing = true;
    },
    // 保存挂接规则
    saveRule(rule) {
      rule.isEditing = false;
    },
    // 删除挂接规则
    deleteRule(index) {
      this.rulesList.splice(index, 1);
    },

    // 批量挂接
    autoAttach() {
      this.attach=true;
      this.startAttachment();
      const formattedData = this.tableData.map(row => {
        const formattedRow = { ...row };
        if (formattedRow.archiveDate) {
          const date = new Date(formattedRow.archiveDate);
          if (!isNaN(date.getTime())) {
            formattedRow.archiveDate = date.toISOString().split('T')[0];
          }
        }
        // 匹配文件列表到对应的档案对象，去掉文件名后缀
        formattedRow.sysOssList = this.upFileList.filter(file => this.removeFileExtension(file.name) === formattedRow.archiveNumber);
        return formattedRow;
      });
      // 提交数据到服务器
      bulkAdd(formattedData).then(response => {
        if (response.data.some(() => true)) {
          this.$message.success('数据插入成功');

          // 初始化 tableData 并确保 validationErrors 被正确初始化
          this.tableData = response.data.map(item => ({
            ...item,
            validationErrors: item.validationErrors || []
          }));

          this.content = formattedData.length; // 设置导入的记录数
          this.active = 4; // 设置步骤条的活动步骤
          this.currentStep = 5;
          this.currentStep = 6;
          this.isAttachmentComplete=true;
        }
      }).catch(error => {
        this.$message.error('数据插入失败');
      });
    },


    // 转换为驼峰命名
    toCamelCase(str) {
      return str.replace(/_([a-z])/g, (match, letter) => letter.toUpperCase());
    },


    // 处理上传到服务器成功事件
    handleUploadSuccess(response, file, fileList) {
      console.log("成功responde",response);
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
        });
      }
    },

    // 处理上传到服务器失败事件
    handleUploadError(err, file, fileList) {
      this.$message.error('文件上传失败');
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
      const batchSize = 5; // 每次上传的文件数量
      // 进度条服务
      const totalFiles = this.fileList.length;
      let uploadedFiles = 0;
      // 循环遍历文件列表，按批次上传
      for (let i = 0; i < this.fileList.length; i += batchSize) {
        const batch = this.fileList.slice(i, i + batchSize); // 获取当前批次的文件
        // 并行上传当前批次的文件
        await Promise.all(batch.map(file => this.uploadFile(file)));
        // 进度条服务
        uploadedFiles += batch.length;
        this.totalUploadProgress = Math.round((uploadedFiles / totalFiles) * 100);
      }
      this.$message.success('文件上传成功');
      // 流程变化
      this.currentStep = 3;
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
      if (file) {
        const zip = new JSZip();
        const zipContent = await zip.loadAsync(file);
        const files = [];
        const processZipEntry = async (zipEntry) => {
          if (!zipEntry.dir) {
            const fileName = zipEntry.name.split('/').pop(); // 只保留文件名
            const fileBlob = await zipEntry.async("blob"); // 使用 async 方法获取 Blob 对象
            const file = new File([fileBlob], fileName, {
              type: fileBlob.type || '', // 可能需要设置 MIME 类型
              lastModified: zipEntry.date ? zipEntry.date.getTime() : Date.now()
            });
            files.push({
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
            name: file.name,
            url: file.url,
            status: file.status,
            raw: file.raw,
            uid: file.uid,
            percentage: 0,
            size: file.size,
          };
        });
        this.zipLoading = false;
        return this.uploadFiles;
      }
    },

    // 获取颜色
    getStepColor(index) {
      if (index < this.currentStep) {
        const colors = ['#1C69DB', '#2E77DD', '#4186DF', '#538FE1', '#6698E3'];
        return colors[index];
      } else {
        return '#D0E3F7'; // 未完成的步骤显示为更浅的蓝色
      }
    }
    ,

    // 挂接档案左侧进度条
    nextStep() {
      if (this.currentStep < this.steps.length + 1) {
        this.steps[this.currentStep].completed = true;
        this.currentStep++;
      }
    },


    // 解压缩文件进度条
    formatProgress() {
      if (this.progress !== 100) {
        return '正在获取文件列表' + this.progress + '%';
      } else {
        this.nextStep();
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
        if (this.currentStep === 6) {
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
      return this.currentStep === 6 ? '挂接完成' : `正在挂接文件 ${percentage.toFixed(2)}%`;
    },
    // 挂接文件的翻页
    onPageSizeChange(newSize) {
      this.tablePageSize = newSize;
    },
    onPageChange(newPage) {
      this.currentTablePage = newPage;
    },

    //   添加挂接规则弹出
    toggleDropdownVisibility() {
      this.isDropdownVisible = !this.isDropdownVisible;
    },
    chooseItem(item) {
      this.selectedProperty = item.columnName;
      this.isDropdownVisible = false;
      this.addRule();
    },
    // 重置挂接内容
    resetAttachment() {
      this.currentStep = 1;
      this.isAttachmentComplete = false;
      this.rulesList= [{columnName: "archiveNumber",isEditing: false,itemName:"档号",prefix: "", suffix: ""}];
      this.upFileList = [];
      this.fileList = [];
      this.totalUploadProgress = 0;
      this.attachmentProgress = 0;
      this.progress = 0;
      this.zipLoading = false;
      this.uploadFiles = [];
      this.isDropdownVisible = false;
      this.selectedProperty = '';
    },

    confirmRules() {
      this.currentStep = 4;
    },

    // 辅助函数：去掉文件名的后缀
    removeFileExtension(fileName) {
      const lastDotIndex = fileName.lastIndexOf('.');
      if (lastDotIndex === -1) return fileName;
      return fileName.substring(0, lastDotIndex);
    },
    look(){
      // this.displayOutput=false;
      this.$router.push({path: 'info0'});
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
  //align-items: center;
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
</style>
