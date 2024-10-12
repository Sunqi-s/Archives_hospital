<template>
  <div>
  <el-main class="main-controller">
    <el-row :gutter="20">
      <el-col :span="4"><div><el-input v-model="inputArchiveName" placeholder="请输入档案名称" /></div></el-col>
      <el-col :span="4"><div><el-input v-model="inputArchiveNumber" placeholder="请输入档案号" /></div></el-col>
      <el-col :span="1.5" style="justify-content: center; display: flex;"><div><el-button type="primary" @click="handleSearch">搜索</el-button></div></el-col>
      <el-col :span="1.5"><div><el-button type="primary" @click="handleReset">重置</el-button></div></el-col>
      <el-col :span="1.5"><el-button type="success" icon="el-icon-s-flag" size="small" :disabled="!(savedids.length+ids.length)" @click="handleBorrow">申请借阅</el-button>
      </el-col>
    </el-row>
    <el-tabs type="border-card" @tab-click="selectedItem" v-model="selectedTag">
      <el-tab-pane v-for="tag in tagList" :label="tag.name" :name="String(tag.category)">
        <!-- 动态生成的表格 -->
        <div class="table-container">
          <el-table :data="FilteredList" @selection-change="handleSelectionChange" :default-sort = "{prop: 'id', order: 'descending'}" height="60vh" ref="dynamicTable" border >
            <el-table-column type="selection" width="55" align="center" />
            <el-table-column width="55" align="center" >
              <template slot-scope="scope">
              <i class="el-icon-document-checked" @click="handleRowClick(scope.row)"></i>
              </template>
            </el-table-column>
            <el-table-column
              v-for="field in sortedFields"
              :key="field.name"
              :prop="field.name"
              :label="field.label"
              :sortable="true"
              :width="field.width || '120px'"
            >
              <template slot-scope="scope">
                <span class="truncate-text" v-if="field.name === 'archiveStatus'">{{getArchiveStatus(scope.row.archiveStatus)}}</span>
                <span class="truncate-text" v-else-if="field.name === 'department'">{{ getDepartmentName(scope.row.department) }}</span>
                <span class="truncate-text" v-else v-html="scope.row[field.name]"></span>
              </template>
            </el-table-column>
          </el-table>
          <div class="block">
            <el-pagination
              v-show="total > 0"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
              :current-page="queryParams.pageNum"
              :page-sizes="[10, 20, 30, 50]"
              :page-size="queryParams.pageSize"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total">
            </el-pagination>
          </div>
        </div>

      </el-tab-pane>
    </el-tabs>
  </el-main>
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
                <el-descriptions-item v-for="field in itemFilteredListGroup1" :key="field.name">
                  <template slot="label">
                    <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                    <span v-else>{{ field.label }}</span>
                  </template>
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="itemFilteredListGroup1.length"></el-divider>
              <!--第2组项目-->
              <el-descriptions :column="2" size="medium" border>
                <el-descriptions-item v-for="field in itemFilteredListGroup2" :key="field.name" :label="field.label">
                  <template slot="label">
                    <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                    <span v-else>{{ field.label }}</span>
                  </template>
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="itemFilteredListGroup2.length"></el-divider>
              <!--第3组项目-->
              <el-descriptions :column="2" size="medium" border>
                <el-descriptions-item v-for="field in itemFilteredListGroup3" :key="field.name" :label="field.label">
                  <template slot="label">
                    <span v-if="field.isRequired === '1'" class="required-label">{{ field.label }}</span>
                    <span v-else>{{ field.label }}</span>
                  </template>
                  <el-form-item :prop="field.name" class="form-item">
                    <component  :is="getComponentType(field.type)" v-model="form[field.name]" v-bind="getComponentProps(field)" :readonly="true">
                      <el-option v-if="field.type === 'select'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-radio v-if="field.type === 'radio'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                      <el-checkbox v-if="field.type === 'checkbox'" v-for="option in field.options" :key="option.value" :label="option.label" :value="option.value" />
                    </component>
                  </el-form-item>
                </el-descriptions-item>
              </el-descriptions>
              <el-divider dashed v-if="itemFilteredListGroup3.length"></el-divider>

              <el-row>
                <el-col :span="24">
                  <el-table :data="form.sysOssList" style="width: 100%; margin-top: 10px;" >
                    <el-table-column type="index" label="序号" width="50">
                      <template slot-scope="scope">{{getIndex(scope.$index)}}</template>
                    </el-table-column>
                    <el-table-column prop="name" label="文件名称"></el-table-column>
                    <el-table-column prop="suffix" label="文件类型" width="120"></el-table-column>
                    <el-table-column prop="fileSize" label="文件大小" width="120">
                      <template slot-scope="scope">{{formatSize(scope.row.size)}}</template>
                    </el-table-column>
                    <el-table-column label="操作" width="120">
                      <template slot-scope="scope">
                        <div class="butten-column">
                          <el-button type="success" @click="handleFilePreview(scope.row.url)" size="small">预览</el-button>
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
    </el-dialog>
    <!--文件预览对话框-->
    <el-dialog title="文件预览" :visible.sync="showPreview" fullscreen>
      <onlinePreview v-if="showPreview" :initialUrl="previewUrl"/>
    </el-dialog>

    <!-- 申请借阅对话框 -->
    <el-dialog title="申请借阅" :visible.sync="showBorrowDialog" :before-close="clearBorrowForm">
      <el-form :model="ruleForm" :rules="borrowRules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
        <el-form-item label="申请人" prop="userName">
          <el-input v-model="ruleForm.userName"></el-input>
        </el-form-item>
        <el-form-item label="借阅人" prop="user">
          <el-input v-model="ruleForm.user"></el-input>
        </el-form-item>
        <el-form-item label="借阅时间" required>
          <el-col :span="11">
            <el-form-item prop="date1">
              <el-date-picker type="date" placeholder="选择归还日期" v-model="ruleForm.date1" style="width: 100%;"></el-date-picker>
            </el-form-item>
          </el-col>
          <el-col class="line" :span="2">-</el-col>
          <el-col :span="11">
            <el-form-item prop="date2">
              <el-time-picker placeholder="选择时间" v-model="ruleForm.date2" style="width: 100%;"></el-time-picker>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="档号" prop="archiveNumber">
          <el-input v-model="ruleForm.archiveNumber"></el-input>
        </el-form-item>
        <el-form-item label="题名" prop="archiveName">
          <el-input v-model="ruleForm.archiveName"></el-input>
        </el-form-item>
        <el-form-item label="借阅目的" prop="desc">
          <el-input type="textarea" v-model="ruleForm.desc"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="submitForm('ruleForm')">申请</el-button>
          <el-button @click="resetForm('ruleForm')">重置</el-button>
        </el-form-item>
      </el-form>
    </el-dialog>
  </div>
</template>

<script>
import { getCategory, listCategory } from '@/api/archive/category'
import { getItemByCategoryId } from '@/api/archive/item'
import { getOssByFid } from '@/api/system/oss'
import { listDept } from '@/api/system/dept'
import { borrow, borrowDetail, borrowUser } from '@/api/archive/borrow'
import { updatAarchiveStatus } from '@/api/archive/info'

export default {
  name: "index",
  data() {
    return {
      ruleForm: {
        userName: '',
        user: '',
        date1: '',
        date2: '',
        archiveNumber: '',
        archiveName:'',
        desc: ''
      },
      borrowRules: {
        userName: [
          { required: true, message: '请输入申请人', trigger: 'blur' },
          { min: 3, max: 10, message: '长度应在 3 到 10 个字符之间', trigger: 'blur' }
        ],
        user: [
          { required: true, message: '请输入借阅人', trigger: 'blur' }
        ],
        date1: [
          { type: 'date', required: true, message: '请选择归还日期', trigger: 'change' }
        ],
        date2: [
          { type: 'date', required: true, message: '请选择归还时间', trigger: 'change' }
        ],
        archiveNumber: [
          { required: true, message: '请输入档号', trigger: 'blur' }
        ],
        archiveName: [
          { required: true, message: '请输入题名', trigger: 'blur' }
        ],
        desc: [
          { required: true, message: '请填写借阅目的', trigger: 'blur' }
        ]
      },
      LoginUserName: '',
      inputArchiveNumber: null,
      inputArchiveName: null,
      tableData: [
        {
          archiveNumber: "",
          archiveName: "",
          categoryId: "",
          department: ""
        }
      ],
      itemFilteredList: [],
      tagList: [{name: '全部', category: 0}],
      categoryList: [],
      selectedTag: 0,
      form: {categoryId: null, sysOssList: []},// 表单数据
      rules:{},
      itemFilteredListGroup1:[],//第1组档案字段列表
      itemFilteredListGroup2:[],//第2组档案字段列表
      itemFilteredListGroup3:[],//第3组档案字段列表
      total:0,
      open:false,
      multiple:true,
      queryParams:{
        pageNum: 1,
        pageSize: 10,
        categoryId: null,
        field9: null,
        archiveNumber: null,
      },
      savedids:[],
      ids:[],
      showBorrowDialog:false,
      searchResult:[],
      title:null,
      showPreview:false,//文件预览对话框
      previewUrl:"",
    }
  },
  created() {
    listCategory().then(res => {
      this.categoryList = res.data;
    })
    borrowUser().then(response => {
      this.LoginUserName = response.userName;
      this.ruleForm.userName = this.LoginUserName;
    })
    console.log(this.categoryList)
    this.loadDepartments();
    this.handleSearch()
  },
  computed:{
    FilteredList(){
      let filteredResults  =this.searchResult.filter(item => {
        return item.categoryId === Number(this.selectedTag);
      });
      return filteredResults
    },
    sortedFields(){
      return this.itemFilteredList.sort((a,b)=>{
        if(a.name === 'archiveNumber') return -1;
        if(b.name === 'archiveNumber') return 1;
        return 0;
      }).sort((a,b)=>{
        if(a.name === 'field9') return -1;
        if(b.name === 'field9') return 1;
        return 0;
      }).sort((a,b)=>{
        if(a.name === 'archiveStatus') return -1;
        if(b.name === 'archiveStatus') return 1;
        return 0;
      });
    }
  },
  methods: {
    handleSearch() {
      this.tagList = [];
      this.selectedTag = '0';
      this.queryParams.pageNum = 1;
      const searchJson = {field9:this.inputArchiveName,archiveNumber:this.inputArchiveNumber};
      borrow(searchJson).then(tagListRes => {
        // console.log(tagListRes)
        tagListRes.forEach(tag => {
          getCategory(tag).then(nameFromCategory => {
            // console.log(nameFromCategory)
            const newTag = {name:nameFromCategory.data.name,category:nameFromCategory.data.id};
            // console.log(newTag)
            this.tagList.push(newTag)
          })
        })

        });
      // console.log(this.tagList)
      this.showTable = true;
    },
    handleReset() {
      this.inputArchiveNumber = null;
      this.inputArchiveName = null;
      this.handleSearch();
    },
    handleNextPage(){
      this.savedids = this.savedids.concat(this.ids);
      borrowDetail(this.queryParams).then(infoRes => {
        console.log(infoRes)
        this.searchResult = infoRes.searchResults;
        this.total = infoRes.total;
      })
    },
    handleSizeChange(nowPageSize){
      this.queryParams.pageSize = nowPageSize;
      this.handleNextPage();
    },
    handleCurrentChange(nowCurrentPage){
      this.queryParams.pageNum = nowCurrentPage;
      this.handleNextPage();
    },
    selectedItem(tag, event){
      console.log(tag)
      console.log(this.selectedTag)
      getItemByCategoryId(tag.name).then(res => {
        this.itemListOriginal = res.data;
        this.mapFieldData();
        // 根据不同的场景过滤字段
        this.queryFields = this.itemList.filter(field => field.isQuery === '1');
        this.itemFilteredList = this.itemList.filter(field => field.isList === '1');
        this.itemFilteredListGroup1 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '1').sort((a, b) => a.sort - b.sort);
        this.itemFilteredListGroup2 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '2').sort((a, b) => a.sort - b.sort);
        this.itemFilteredListGroup3 = this.itemList.filter(field => field.isInsert === '1' && field.htmlGroup === '3').sort((a, b) => a.sort - b.sort);
        this.editFields = this.itemList.filter(field => field.isEdit === '1');
        this.editFields = this.itemList.filter(field => field.isEdit === '1');
        //初始化校验
        // this.generateRules();
      })
      this.queryParams.field9 = this.inputArchiveName;
      this.queryParams.archiveNumber = this.inputArchiveNumber;
      this.queryParams.categoryId = this.selectedTag;
      this.handleNextPage();
    },
    handleBorrow(){
      this.savedids = this.savedids.concat(this.ids);
      console.log(this.savedids)
      const numberList = this.savedids.map(item => item.archiveNumber)
      this.ruleForm.archiveNumber = numberList.join(',');

        this.showBorrowDialog = true;
    },
    handleRowClick(row){
      console.log(row)
      const  notLightedContent = {...row};
      const fid = row.id;
      getOssByFid(fid).then(res => {
        notLightedContent.sysOssList = res.data;
      })
      this.form = notLightedContent;
      this.open = true;
      this.title = '详情';
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.selectedItems = selection;
      this.ids = selection.map(item => {
        return {
          id: item.id,
          archiveNumber: item.archiveNumber,
          field9: item.field9,
        }
      })
      this.archiveNumbers = selection.map(item => item.archiveNumber)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    getArchiveStatus(status){
      switch (status) {
        case 0:
          return '待归档';
        case 1:
          return '已归档';
        case 2:
          return '利用';
        default:
          return '未知状态';
      }
    },
    getDepartmentName(department) {
      return this.departmentMap[department] || '未知部门';
    },
    handleClose(){
      this.open = false;
    },
    clearBorrowForm(){
      this.showBorrowDialog= false;
      this.resetForm();
      this.ids = [];
      this.savedids = [];
      this.selectedItems = [];
      this.handleNextPage();
    },
    resetForm() {
      this.ruleForm.userName = this.LoginUserName;
      this.ruleForm.user = '';
      this.ruleForm.date1 = '';
      this.ruleForm.date2 = '';
      this.ruleForm.archiveNumber = '';
      this.ruleForm.archiveName = '';
      this.ruleForm.desc = '';
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
    //文件预览
    handleFilePreview(url) {
      this.previewUrl = url;
      this.showPreview = true;
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
    mapFieldData(){
      const itemFilteredList = []
      for(let i = 0; i < this.itemListOriginal.length; i++){
        const item = this.itemListOriginal[i];
        itemFilteredList.push({
          categoryId: item.categoryId,
          name: this.toCamelCase(item.columnName),
          label: item.itemName,
          type: item.htmlType,
          htmlGroup: item.htmlGroup,
          maxLength: item.columnLength,
          isQuery: item.isQuery,
          isList: item.isList,
          isInsert: item.isInsert,
          isEdit: item.isEdit,
          isRequired: item.isRequired,
          dictType: item.dictType,
          options: []
        })
      }
      this.itemList = itemFilteredList;
    },
    toCamelCase(columnName) {
      return columnName.replace(/_([a-z])/g, (match, p1) => p1.toUpperCase());
    },
    mapHtmlType(htmlType) {
      switch (htmlType) {
        case 'input':
          return 'el-input';
        case 'textarea':
          return 'el-input';
        case 'select':
          return 'el-select';
        case 'treeselect':
          return 'el-input'
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
    loadDepartments(){
      listDept().then(response => {
        this.departmentMap = response.data.reduce((map, dept) => {
          map[dept.deptId] = dept.deptName;
          return map;
        }, {});
      })
    },
    show(name){
      console.log(name);
    }
  }
}
</script>

<style scoped lang="scss">
.main-controller {
  padding: 20px !important;
}
</style>
