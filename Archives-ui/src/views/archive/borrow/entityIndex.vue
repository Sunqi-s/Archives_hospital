<template class="demo-template">
  <el-form :model="ruleForm" :rules="rules" ref="ruleForm" label-width="100px" class="demo-ruleForm">
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
</template>

<script>
import {borrowUser} from "@/api/archive/borrow";

export default {
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
      rules: {
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
      LoginUserName: ''
    };
  },
  created() {
    borrowUser().then(response => {
      this.LoginUserName = response.userName;
      this.ruleForm.userName = this.LoginUserName;
    })
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert('提交成功!');
        } else {
          console.log('提交失败!');
          return false;
        }
      });
    },
    resetForm(formName) {
      this.ruleForm.userName = this.LoginUserName;
      this.ruleForm.user = '';
      this.ruleForm.date1 = '';
      this.ruleForm.date2 = '';
      this.ruleForm.archiveNumber = '';
      this.ruleForm.archiveName = '';
      this.ruleForm.desc = '';
    },

  }
}
</script>

<style>
.demo-ruleForm {
  padding: 10%;
}
</style>
