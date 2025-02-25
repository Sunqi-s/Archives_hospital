<template class="container">
  <el-main>
    <el-row type="flex" :gutter="4" style="margin-bottom:20px">
      <el-col :span="4">
        <el-date-picker v-model="value" type="year" placeholder="选择年">
        </el-date-picker>
      </el-col>
      <el-col :span="1.5">
        <el-button type="primary" @click="getData()">查询</el-button>
      </el-col>
      <el-col :span="2">
        <el-button type="primary" @click="exportData()">导出</el-button>
      </el-col>
    </el-row>

    <div v-if="loading" class="loading">
      <i class="el-icon-loading"></i>
    </div>

    <div id="main" style="float: left; width: 100%; height: 350px;margin-bottom:20px"></div>
    <el-table :data="tableData" style="width: 170vh;margin-left:40px">
      <el-table-column type="index" :index="indexMethod" :width="'80px'" :label="'类型'">
      </el-table-column>
      <el-table-column v-for="(month, idx) in monthList" :key="month" :prop="idx + ''" :label="month" :width="'85px'"
        :align="'center'">
      </el-table-column>
    </el-table>
  </el-main>
</template>

<script>

import * as echarts from 'echarts';
import { getStatistics,exportData } from '@/api/archive/statistics';

export default {
  data() {
    return {
      value: new Date(),
      year:0,
      importCount: [],
      imporDatacount: [],
      mainChart:0,
      typeList:['接收','接收次数','归档','开放鉴定','销毁鉴定'],
      monthList:['一月', '二月', '三月', '四月', '五月', '六月', '七月','八月','九月','十月','十一月','十二月'],
      tableData: [],
      archivelogCount: [],
    }
  },
  mounted() {
    this.$nextTick(() => {
      var chartDom = document.getElementById('main');
      this.mainChart = echarts.init(chartDom);
      if(this.mainChart){
        this.getData()
      }
    })
  },
  methods: {
    getData(){
      if(!this.value){
        this.$message.error('请选择年份')
        return
      }
      this.loading = true
      this.year = this.value.getFullYear()
      this.importCount = []
      this.imporDatacount = []
      this.tableData = []
      this.archivelogCount = []
      getStatistics(this.year).then(response => {
        response.data.forEach(element => {
          this.importCount.push(element.logCount)
          this.imporDatacount.push(element.dataCount)
          this.archivelogCount.push(element.archiveCount)
        });
        this.makeTable(this.importCount)
        this.makeTable(this.imporDatacount)
        this.makeTable(this.archivelogCount)
        this.updateMain()
        this.loading = false
      })
    },
    updateMain() {

      const option = {
        title: {
          text: '月度统计'
        },
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: this.typeList
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          boundaryGap: false,
          data: this.monthList,
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            name: '接收',
            type: 'line',
            stack: 'Total',
            data: this.imporDatacount
          },
          {
            name: '接收次数',
            type: 'line',
            stack: 'Total',
            data: this.importCount
          },
          {
            name: '归档',
            type: 'line',
            stack: 'Total',
            data: this.archivelogCount
          },
          {
            name: '开放鉴定',
            type: 'line',
            stack: 'Total',
            data: []
          },
          {
            name: '销毁鉴定',
            type: 'line',
            stack: 'Total',
            data: []
          }
        ]
      };
      this.mainChart.setOption(option);
    },
    exportData(){
      const data = {
        typeList:this.typeList,
        logCountList:this.importCount,
        dataCountList:this.imporDatacount,
        archivelogList:this.archivelogCount
      }
      this.download('statistics/export', data, `模版.xlsx`)

    },
    indexMethod(index) {
      return this.typeList[index]
    },
    makeTable(list){
      let data = {}
      list.forEach((element,idx) => {
        this.$set(data,idx+'',element)
      });
      this.tableData.push(data)
    },

  }
}

</script>
<style>
.loading{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(255, 255, 255, 0.7);
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 24px;
    color: #606266;
}
</style>
