<template class="demo-template">
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
    <el-form-item label="申请人" prop="applicant">
      <el-input v-model="ruleForm.applicant"></el-input>
    </el-form-item>
    <el-form-item label="借阅人" prop="borrower">
      <el-input v-model="ruleForm.borrower"></el-input>
    </el-form-item>
    <el-form-item label="借阅时间" required>
      <el-col :span="11">
        <el-form-item prop="borrowingTime">
          <el-date-picker clearable
                          v-model="ruleForm.borrowingTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择借阅时间">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="归还时间">
      <el-col :span="11">
        <el-form-item prop="returnTime">
          <el-date-picker clearable
                          v-model="ruleForm.returnTime"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择归还时间">
          </el-date-picker>
        </el-form-item>
      </el-col>
    </el-form-item>
    <el-form-item label="档号" prop="archiveNumber">
      <el-input v-model="ruleForm.archiveNumber"></el-input>
    </el-form-item>
    <el-form-item label="题名" prop="title">
      <el-input v-model="ruleForm.title"></el-input>
    </el-form-item>
    <el-form-item label="借阅目的" prop="borrowingPurpose">
      <el-input type="textarea" v-model="ruleForm.borrowingPurpose"></el-input>
    </el-form-item>
    <el-form-item>
      <el-button type="primary" @click="submitForm('ruleForm')">申请</el-button>
      <el-button @click="resetForm('ruleForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
import { addBorrow, borrowUser, updateBorrow } from '@/api/archive/borrow'

export default {
  data() {
    return {
      ruleForm: {
        applicant: null,
        borrower: null,
        borrowingTime: null,
        returnTime: null,
        archiveNumber: null,
        title: null,
        borrowingPurpose: null
      },
      rules: {
        applicant: [
          { required: true, message: '请输入申请人', trigger: 'blur' },
          { min: 3, max: 10, message: '长度应在 3 到 10 个字符之间', trigger: 'blur' }
        ],
        borrower: [
          { required: true, message: '请输入借阅人', trigger: 'blur' }
        ],
        borrowingTime: [
          {
            required: true,
            validator: (rule, value, callback) => {
              if (!value) {
                callback(new Error('请选择借阅日期'));
              } else if (!/^\d{4}-\d{2}-\d{2}$/.test(value)) {
                callback(new Error('日期格式应为 YYYY-MM-DD'));
              } else {
                callback();
              }
            },
            trigger: 'change'
          }
        ],
        archiveNumber: [
          { required: true, message: '请输入档号', trigger: 'blur' }
        ],
        title: [
          { required: true, message: '请输入题名', trigger: 'blur' }
        ],
        borrowingPurpose: [
          { required: true, message: '请填写借阅目的', trigger: 'blur' }
        ]
      },
      LoginUserName: ''
    };
  },
  created() {
    borrowUser().then(response => {
      this.LoginUserName = response.userName;
      this.ruleForm.applicant = this.LoginUserName;
    })
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          if (this.ruleForm.id != null) {
            updateBorrow(this.ruleForm).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.resetForm(formName);
            });
          } else {
            addBorrow(this.ruleForm).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.resetForm(formName);
            });
          }
        }
      });
    },
    resetForm() {
      this.ruleForm.applicant = this.LoginUserName;
      this.ruleForm.borrower = null;
      this.ruleForm.borrowingTime = null;
      this.ruleForm.returnTime = null;
      this.ruleForm.archiveNumber = null;
      this.ruleForm.title = null;
      this.ruleForm.borrowingPurpose = null;
    },

  }
}
</script>

<style>
.demo-ruleForm {
  padding: 10%;
}
</style>
