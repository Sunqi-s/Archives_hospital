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
import { getStatistics, exportData } from '@/api/archive/statistics';

export default {
  data() {
    return {
      value: new Date(),
      year: 0,
      importCount: [],
      imporDatacount: [],
      archivelogCount: [],
      mainChart: 0,
      typeList: ['接收次数', '接收', '归档'],
      monthList: ['一月', '二月', '三月', '四月', '五月', '六月', '七月', '八月', '九月', '十月', '十一月', '十二月'],
      tableData: [],
    }
  },
  mounted() {
    this.$nextTick(() => {
      var chartDom = document.getElementById('main');
      this.mainChart = echarts.init(chartDom);
      if (this.mainChart) {
        this.getData()
      }
    })
  },
  methods: {
    getData() {
      if (!this.value) {
        this.$message.error('请选择年份');
        return;
      }
      this.year = this.value.getFullYear();
      this.importCount = [];
      this.imporDatacount = [];
      this.archivelogCount = [];
      this.tableData = [];

      getStatistics(this.year).then(response => {
        if (!response.data || response.data.length === 0) {
          this.$message.warning('暂无数据');
          return;
        }

        response.data.forEach(element => {
          this.importCount.push(element.logCount === 0 ? 0.1 : element.logCount);
          this.imporDatacount.push(element.dataCount === 0 ? 0.1 : element.dataCount);
          this.archivelogCount.push(element.archiveCount === 0 ? 0.1 : element.archiveCount);
        });
        this.makeTable(this.importCount);        // 接收次数
        this.makeTable(this.imporDatacount);     // 接收
        this.makeTable(this.archivelogCount);    // 归档
        this.$nextTick(() => {
          this.updateMain();
        });
      }).catch(error => {
        this.$message.error('数据加载失败');
        console.error(error);
      });
    },
    updateMain() {
      const globalMax = Math.max(
        Math.max(...this.importCount.map(v => v === 0.1 ? 0 : v)), // 恢复原始值计算
        Math.max(...this.imporDatacount.map(v => v === 0.1 ? 0 : v)),
        Math.max(...this.archivelogCount.map(v => v === 0.1 ? 0 : v))
      );

      const option = {
        title: {
          text: '月度统计'
        },
        tooltip: {
          trigger: 'axis',
          formatter: (params) => {
            if (!params || !params.length) return '';
            const dataIndex = params[0].dataIndex;
            const xAxisValue = this.monthList[dataIndex] || `第${dataIndex + 1}月`;
            let tooltip = `${xAxisValue}<br>`;
            params.forEach((item) => {
              // 显示原始值（将 0.1 转换回 0）
              const rawValue = item.value === 0.1 ? 0 : item.value;
              tooltip += `${item.marker} ${item.seriesName}: ${rawValue}<br>`;
            });
            return tooltip;
          }
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
          type: 'log',
          logBase: 10,
          min: 0.1, // 允许最小值到 0.1（对应原始零值）
          max: globalMax * 2,
          axisLabel: {
            formatter: (value) => {
              // 将 0.1 显示为 0
              return value === 0.1 ? '0' : value.toFixed(0);
            }
          },
          name: '数值',
        },
        series: [
          {
            name: '接收次数',
            type: 'line',
            data: this.importCount,
            smooth: true,       // 平滑折线
            lineStyle: { width: 2 }, // 加粗线条
          },
          {
            name: '接收',
            type: 'line',
            data: this.imporDatacount,
            smooth: true,
            lineStyle: { width: 2 },
          },
          {
            name: '归档',
            type: 'line',
            data: this.archivelogCount,
            smooth: true,
            lineStyle: { width: 2 },
          },
          // {
          //   name: '开放鉴定',
          //   type: 'line',
          //   stack: 'Total',
          //   data: []
          // },
          // {
          //   name: '销毁鉴定',
          //   type: 'line',
          //   stack: 'Total',
          //   data: []
          // }
        ]
      };
      this.mainChart.setOption(option);
    },
    exportData() {
      // 恢复原始值后再导出
      const data = {
        typeList: this.typeList,
        logCountList: this.importCount.map(v => v === 0.1 ? 0 : v),
        dataCountList: this.imporDatacount.map(v => v === 0.1 ? 0 : v),
        archivelogList: this.archivelogCount.map(v => v === 0.1 ? 0 : v)
      };
      this.download('statistics/export', data, `${this.year}年档案统计.xlsx`);
    },
    indexMethod(index) {
      return this.typeList[index]
    },
    makeTable(list) {
      let data = {};
      list.forEach((element, idx) => {
        // 将 0.1 恢复为 0
        const rawValue = element === 0.1 ? 0 : element;
        this.$set(data, idx + '', rawValue);
      });
      this.tableData.push(data);
    }
  }
}

</script>
