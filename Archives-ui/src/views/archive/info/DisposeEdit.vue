<template>
  <div class="archive-table-container">
    <!-- 搜索及操作按钮区域 -->
    <div class="search-operation-bar">
      <input
        type="text"
        placeholder="快速搜索"
        class="quick-search-input"
        v-model="queryParams.searchValue"
      />
      <button class="btn reset-btn" @click="handleReset">重置</button>
      <button class="btn search-btn" @click="handleSearch">搜索</button>
    </div>

    <el-row :gutter="10" class="mb8">
      <el-col :span="4" :xs="24">
        <el-button type="success" icon="el-icon-s-flag" size="small" @click="handleDispose">处置</el-button>
      </el-col>
    </el-row>

    <!-- 表格区域 -->
    <div class="fixed-table-container">
      <el-table
        :data="tableData"
        border
        style="width: 100%"
        loading="loading"
        @selection-change="handleSelectionChange"
      >
        <el-table-column
          type="selection"
          width="55"
        />
        <el-table-column
          prop="archiveStatus"
          label="归档状态"
          sortable
        >
          <template slot-scope="scope">
            <span v-if="scope.row.archiveStatus == '1'">已归档</span>
            <span v-else-if="scope.row.archiveStatus == '0'">未归档</span>
            <span v-else-if="scope.row.archiveStatus == '2'">利用</span>
          </template>
        </el-table-column>
        <el-table-column
          label="档案分类"
          sortable
        >
          <template slot-scope="scope">
            <el-tag>{{ getCategoryName(scope.row.categoryId) }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column
          prop="field3"
          label="题名"
          sortable
        >
          <template slot-scope="scope">
            <span v-html="scope.row.field3"></span>
          </template>
        </el-table-column>
        <el-table-column
          prop="fondsNumber"
          label="全宗号"
          sortable
        >
          <template slot-scope="scope">
            <span v-html="scope.row.fondsNumber"></span>
          </template>
        </el-table-column>
        <el-table-column
          prop="fondsName"
          label="全宗名称"
          sortable
        >
          <template slot-scope="scope">
            <span v-html="scope.row.fondsName"></span>
          </template>
        </el-table-column>

        <el-table-column
          prop="archiveNumber"
          label="项目档号"
        >
          <template slot-scope="scope">
            <span v-html="scope.row.archiveNumber"></span>
          </template>
        </el-table-column>
        <el-table-column
          prop="retentionPeriod"
          label="保管期限"
        >
          <template slot-scope="scope">
            <span v-html="scope.row.retentionPeriod"></span>
          </template>
        </el-table-column>
        <el-table-column
          prop="itemNumber"
          label="件号"
        >
          <template slot-scope="scope">
            <span v-html="scope.row.itemNumber"></span>
          </template>
        </el-table-column>
        <el-table-column
          label="归档部门"
        >
          <template slot-scope="scope">
            {{ getDepartmentName(scope.row.department) }}
          </template>
        </el-table-column>
        <el-table-column
          prop="archiver"
          label="归档人"
        >
          <template slot-scope="scope">
            <span v-html="scope.row.archiver"></span>
          </template>
        </el-table-column>
        <el-table-column
          prop="archiveDate"
          label="归档日期"
        >
          <template slot-scope="scope">
            <span v-html="scope.row.archiveDate"></span>
          </template>
        </el-table-column>
        <el-table-column
          label="操作"
        >
          <template slot-scope="scope">
            <!-- 这里可根据实际需求添加操作按钮，比如编辑、查看等 -->
            <button class="operate-btn" @click="handleDetail(scope.row)">查看</button>
          </template>
        </el-table-column>
      </el-table>
      <pagination v-show="total > 0" :total="total" :page.sync="queryParams.pageNum"
                  :limit.sync="queryParams.pageSize" @pagination="handleNextPage"
      />
    </div>

    <!-- 添加或修改对话框 -->
    <el-dialog :title="title" :visible.sync="open" append-to-body class="dialog-container" :before-close="handleClose"
               style="text-align: left;" fullscreen
    >
      <div class="background">
        <el-row>
          <el-col :span="24">
            <div class="grid-content bg-purple-dark"></div>
          </el-col>
        </el-row>
        <div class="grid-content bg-purple" disabled="true">
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
                               v-bind="getComponentProps(field)" :readonly="true"
                    >
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                                 :label="option.label" :value="option.value"
                      />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                                :label="option.label" :value="option.value"
                      />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                                   :label="option.label" :value="option.value"
                      />
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
                               v-bind="getComponentProps(field)" :readonly="true"
                    >
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                                 :label="option.label" :value="option.value"
                      />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                                :label="option.label" :value="option.value"
                      />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                                   :label="option.label" :value="option.value"
                      />
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
                               v-bind="getComponentProps(field)" :readonly="true"
                    >
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value"
                                 :label="option.label" :value="option.value"
                      />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value"
                                :label="option.label" :value="option.value"
                      />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value"
                                   :label="option.label" :value="option.value"
                      />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="insertFieldsGroup3.length"></el-divider>

              <el-row>
                <el-col :span="24">
                  <div>
                    <el-button type="success" plain icon="el-icon-download" size="small"
                               @click="handleBatchDownload"
                    >批量下载
                    </el-button>
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
                          <el-button @click="handleFileDownload(scope.row.url)" size="small">下载</el-button>
                          <el-button type="success" @click="handleFilePreview(scope.row.url)"
                                     size="small"
                          >预览
                          </el-button>
                        </div>
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
        <el-button @click="close">关 闭</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import pagination from '@/components/Pagination/index.vue'
import { disposeContractByIds, getContractDisposal, getInfo } from '@/api/archive/info'
import { listDept } from '@/api/system/dept'
import { getItemByCategoryId } from '@/api/archive/item'
import { getPreviewUrl } from '@/api/archive/filePreview'
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import { getDicts } from '@/api/system/dict/data'
import { deptTreeSelect } from '@/api/system/user'

export default {
  name: 'ArchiveTable',
  components: { pagination, Treeselect },
  data() {
    return {
      tableData: [], // 表格数据，后续从后端获取
      total: 0, // 表格数据总数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        searchValue: ''
      }, // 分页参数
      loading: false,// 表格加载状态
      selectedItems: [], // 已选择的项
      ids: [],
      single: true,// 非单个禁用
      multiple: true, // 非多个禁用
      deptOption: [],
      deptOptions:[],
      open: false,
      form: { categoryId: null, sysOssList: [] },
      rules: {},
      title: null,
      insertFieldsGroup1: [],
      insertFieldsGroup2: [],
      insertFieldsGroup3: [],
      fields: [],
      queryFields: [], // 添加缺失的属性
      listFields: [],  // 添加缺失的属性
      categoryId: null, // 添加缺失的属性
      categoryName: null // 添加缺失的属性
    }
  },
  created() {
    // 可在此处添加初始化逻辑，比如获取表格数据等
    this.loadData()
    this.getDeptTree()
  },
  methods: {
    getCategoryName(categoryId) {
      const categoryMap = {
        15: '文书档案',
        32: '文件目录',
        34: '科技档案',
        35: '科技案卷',
        36: '科技卷内',
        37: '科技项目',
        38: '人事档案',
        39: '人事卷内',
        40: '人事案卷',
        41: '会计档案',
        42: '会计案卷',
        43: '会计卷内',
        44: '照片档案',
        45: '照片案卷',
        46: '照片卷内',
        47: '录音档案',
        48: '录音案卷',
        49: '录音卷内',
        50: '录像档案',
        51: '录像案卷',
        52: '录像卷内',
        53: '实物档案',
        54: '实物档案',
        55: '光盘档案',
        56: '光盘案卷',
        57: '光盘卷内',
        58: '专题档案',
        59: '收文档案',
        60: '发文档案',
        61: '会议纪要',
        62: '规则制度',
        63: '业务档案',
        64: '业务项目',
        65: '业务案卷',
        66: '业务卷内',
        67: '电子文件级目录',
        69: '文件目录(密)'
      }
      return categoryMap[categoryId] || '未知分类'
    },
    getDeptTree() {
      listDept().then(res => {
        this.deptOption = res.data
      })
      deptTreeSelect().then(response => {
        this.deptOptions = response.data;
      });
    },
    getDepartmentName(department) {
      console.log('1', department)
      for (let i = 0; i < this.deptOption.length; i++) {
        if (this.deptOption[i].deptId == department) {
          console.log('2', department)
          return this.deptOption[i].deptName
        }
      }
    },
    mapHtmlType(htmlType) {
      switch (htmlType) {
        case 'input':
          return 'el-input'
        case 'textarea':
          return 'el-input'
        case 'select':
          return 'el-select'
        case 'treeselect':
          return 'treeselect'
        case 'radio':
          return 'el-radio-group'
        case 'checkbox':
          return 'el-checkbox-group'
        case 'datetime':
          return 'el-date-picker'
        default:
          return 'el-input'
      }
    },
    getComponentType(type) {
      return this.mapHtmlType(type)
    },
    getComponentProps(field) {
      console.log('field', field)
      switch (this.mapHtmlType(field.type)) {
        case 'el-select':
          return {
            placeholder: `请选择${field.label}`,
            options: field.options || [],
            default: null
          }

        case 'treeselect':
          if (field.dictType === 'sys_dept_list') {
            return {
              placeholder: `请选择${field.label}`,
              options: this.deptOptions,
              default: null
            }
          }
        case 'el-checkbox-group':
        case 'el-radio-group':
          return {
            options: field.options || [],
            default: Array.isArray(field.options) ? field.options.find(option => option.value === field.defaultValue) : null
          }
        case 'el-date-picker':
          return {
            type: 'datetime',
            placeholder: `请选择${field.label}`,
            'value-format': 'yyyy-MM-dd HH:mm:ss'
          }
        case 'el-input':
          return field.type === 'textarea' ? {
            type: 'textarea',
            placeholder: `请输入${field.label}`
          } : { placeholder: `请输入${field.label}` }
        default:
          return {}
      }
    },
    // 重置按钮事件
    handleReset() {
      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        searchValue: ''
      }
      // 可在此处添加其他重置逻辑，比如重置表格数据等
      this.loadData()
    },
    // 搜索按钮事件
    handleSearch() {
      this.loadData()
    },
    // 文件查看
    handleDetail(row) {
      const id = row.id || this.ids
      const categoryId = row.categoryId
      console.log(row)
      this.categoryId = categoryId

      this.getFieldDefinitions(categoryId)
        .then(() => {
          return getInfo(id)
        })
        .then(response => {
          this.form = response.data
          this.open = true
          this.title = this.categoryName + '详情'
        })
        .catch(error => {
          console.error('获取详情失败:', error)
        })
    },

    getFieldDefinitions(categoryId) {
      const FIELD_ENABLED = '1'

      return getItemByCategoryId(categoryId).then(res => {
        console.log('1', res)
        this.fields = res.data.map(field => this.mapFieldData(field))
        console.log(this.fields)

        // 初始化分组字段
        this.queryFields = []
        this.listFields = []
        this.insertFieldsGroup1 = []
        this.insertFieldsGroup2 = []
        this.insertFieldsGroup3 = []

        // 一次遍历完成所有字段分类和排序
        this.fields.forEach(field => {
          this.$set(this.queryParams, field.name, null)

          if (field.isQuery === FIELD_ENABLED) {
            this.queryFields.push(field)
          }
          if (field.isList === FIELD_ENABLED) {
            this.listFields.push(field)
          }
          if (field.isInsert === FIELD_ENABLED) {
            switch (field.htmlGroup) {
              case '1':
                this.insertFieldsGroup1.push(field)
                break
              case '2':
                this.insertFieldsGroup2.push(field)
                break
              case '3':
                this.insertFieldsGroup3.push(field)
                break
            }
          }
        })

        // 排序插入字段组
        const sortBySort = (a, b) => a.sort - b.sort
        this.insertFieldsGroup1.sort(sortBySort)
        this.insertFieldsGroup2.sort(sortBySort)
        this.insertFieldsGroup3.sort(sortBySort)

        // 设置 categoryId 参数
        this.$set(this.queryParams, 'categoryId', this.categoryId)
      }).catch(error => {
        console.error('获取字段定义失败:', error)
      })
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

    loadData() {
      this.loading = true
      const params = {
        ...this.queryParams, // 保留现有的查询参数
        pageNum: this.queryParams.pageNum, // 当前页码
        pageSize: this.queryParams.pageSize // 每页显示条数
      }
      getContractDisposal(params).then(response => {
        console.log('response', response)
        if (this.queryParams.searchValue) {
          this.tableData = this.markMatches(response.rows)
        } else {
          this.tableData = response.rows
        }
        this.total = response.total
        this.$nextTick(() => {
          setTimeout(() => {
            this.isClick = true
            this.loading = false
          }, 400)
        })

      })
    },
    handleNextPage() {
      // 翻页事件，可结合 queryParams 向后端发送请求获取数据，示例：
      this.loadData()

    },
    markMatches(data) {
      if (!this.queryParams.searchValue) return data
      const regex = new RegExp(`(${this.queryParams.searchValue})`, 'gi')
      // 定义需要高亮的字段
      const highlightFields = ['field3', 'fondsNumber', 'fondsName', 'archiveNumber', 'retentionPeriod', 'itemNumber', 'department', 'archiver']

      return data.map(record => {
        const highlightedRecord = { ...record }
        for (const key of highlightFields) {
          if (typeof highlightedRecord[key] === 'string') {
            highlightedRecord[key] = highlightedRecord[key].replace(regex, '<span style="color: red;">$1</span>')
          }
        }
        return highlightedRecord
      })
    },
    handleSelectionChange(selection) {
      this.selectedItems = selection
      this.ids = selection.map(item => item.id)
      this.single = selection.length !== 1
      this.multiple = !selection.length
    },
    async handleDispose() {
      if (this.selectedItems.length === 0) {
        this.$message.error('请选择要处置的合同！')
        return
      }

      try {
        await this.$confirm('确定要处置选中合同吗？', '警告', {
          type: 'warning'
        })

        this.$modal.loading('正在处理中...')
        const ids = this.selectedItems.map(item => item.id)
        const res = await disposeContractByIds(ids)

        if (res.code === 200) {
          this.loadData()
          this.$message.success(`成功处置 ${ids.length} 份合同`)
        } else {
          throw new Error(res.message || '处置失败')
        }
      } catch (error) {
        if (error !== 'cancel') { // 忽略取消操作
          this.$message.error(error.message)
        }
      } finally {
        this.$modal.closeLoading()
      }
    },
    /** 对话框关闭操作 */
    handleClose(done) {
      // 实现当 handleClose 被调用时应该发生的逻辑
      // 例如，你可能想要显示一个确认对话框
      this.$confirm('确定要关闭这个对话框吗？')
        .then(() => {
          this.form = { categoryId: null, sysOssList: [] }
          done() // 当你想要关闭对话框时调用 done()
        })
        .catch(() => {
        })
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
    // 文件下载
    handleFileDownload(url) {
      this.$download.resource(url);
    },
    //文件预览
    async handleFilePreview(filePath) {
      try {
        const response = await getPreviewUrl(filePath);
        if (response.code === 200) {
          const previewUrl = response.msg;
          // 在新标签页中打开预览链接（_blank 为浏览器默认新标签页）
          window.open(previewUrl);
        } else {
          this.$message.error(response.msg);
        }
      } catch (error) {
        this.$message.error('文件预览失败，请检查路径或权限');
      }
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
    toCamelCase(columnName) {
      return columnName.replace(/_([a-z])/g, (match, p1) => p1.toUpperCase());
    },
    /** 对话框关闭操作 */
    close() {
      this.open = false;
      this.form = { categoryId: null, sysOssList: [] };
    },

  }
}
</script>

<style scoped>
.archive-table-container {
  padding: 10px;
}

.search-operation-bar {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.quick-search-input {
  height: 32px;
  padding: 0 8px;
  border: 1px solid #d9d9d9;
  border-radius: 4px;
  margin-right: 10px;
}

.btn {
  height: 32px;
  padding: 0 12px;
  margin-right: 10px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  color: #fff;
}

.reset-btn {
  background-color: #1890ff;
}

.search-btn {
  background-color: #1890ff;
}

.advanced-search-btn {
  background-color: #91d5ff;
  color: #000;
}

.operate-btn {
  background-color: #52c41a;
}

.delete-btn {
  background-color: #f5222d;
}

.el-table {
  width: 100%;
}

.operate-btn {
  padding: 4px 8px;
  background-color: #1890ff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
