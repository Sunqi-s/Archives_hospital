<template>
  <div class="app-container home">
    <el-row :gutter="12">
      <el-col :lg="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>档案全宗</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <el-row>
            <el-col :span="12">
              <div class="grid-content bg-purple" style="margin-top: 18px"><img src="../assets/images/档案全宗.png"
                                                                                style="right: 50px;width: 50px"></div>
            </el-col>
            <el-col :span="12">
              <div class="grid-content bg-purple-light">
                <el-row>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">123</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">全宗数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :lg="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>档案入库统计</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <el-row>
            <el-col :span="12">
              <div class="grid-content bg-purple" style="margin-top: 18px"><img src="../assets/images/入库统计.png"
                                                                                style="right: 50px;width: 50px"></div>
            </el-col>
            <el-col :span="12">
              <div class="grid-content bg-purple-light">
                <el-row>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">123</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">全宗数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :lg="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>档案分类</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <el-row>
            <el-col :span="12">
              <div class="grid-content bg-purple" style="margin-top: 18px"><img src="../assets/images/档案分类.png"
                                                                                style="right: 50px;width: 50px"></div>
            </el-col>
            <el-col :span="12">
              <div class="grid-content bg-purple-light">
                <el-row>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">123</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">全宗数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :lg="6" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>借阅统计</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <el-row>
            <el-col :span="12">
              <div class="grid-content bg-purple" style="margin-top: 18px"><img src="../assets/images/档案统计.png"
                                                                                style="right: 50px;width: 50px"></div>
            </el-col>
            <el-col :span="12">
              <div class="grid-content bg-purple-light">
                <el-row>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">123</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">全宗数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
    </el-row>
    <el-row :gutter="12">
      <el-col :lg="12" :xs="24" >
        <el-card class="box-card" style="height: 400px">
          <div slot="header" class="clearfix">
            <span>工作中心</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <el-tabs v-model="activeName" @tab-click="handleClick">
            <el-tab-pane label="用户管理" name="first">
              <el-table
                :data="tableData"
                style="width: 100%">
                <el-table-column
                  prop="date"
                  label="日期"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="name"
                  label="姓名"
                  width="180">
                </el-table-column>
                <el-table-column
                  prop="address"
                  label="地址">
                </el-table-column>
              </el-table>
            </el-tab-pane>
            <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
            <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
            <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
          </el-tabs>
        </el-card>
      </el-col>

      <el-col :lg="12" :xs="24">
        <el-card class="box-card" style="height: 400px">
          <div slot="header" class="clearfix">
            <span>数据分析</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <div  id="main" style="width: 100%;height:273px;">

          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="12">
      <el-col :lg="24" :xs="24">
        <el-card class="box-card" style="height: 250px">
          <div slot="header" class="clearfix">
            <span>档案数据</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
<!------------------------------------------------------------------------------------------------------------------------->
          <el-row :gutter="24" style="margin-top: 30px">
            <!--文件条目-->
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="10">
                  <div class="grid-content bg-purple"><img src="../assets/images/文件条目.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">123</div>
                  <div class="grid-content bg-purple" style="color: #909399;">文件条目</div>
                </el-col>
              </div>
            </el-col>
            <!--文件条目-->
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="10">
                  <div class="grid-content bg-purple"><img src="../assets/images/案卷条目.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">123</div>
                  <div class="grid-content bg-purple" style="color: #909399;">案卷条目</div>
                </el-col>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="10">
                  <div class="grid-content bg-purple"><img src="../assets/images/电子文件.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">123</div>
                  <div class="grid-content bg-purple" style="color: #909399;">电子文件</div>
                </el-col>
              </div>
            </el-col>
          </el-row>
<!-------------------------------------------------------------------------------------------------------------------------->
          <el-row :gutter="24" style="margin-top: 30px">
            <!--文件条目-->
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="10">
                  <div class="grid-content bg-purple"><img src="../assets/images/资源占用.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">123</div>
                  <div class="grid-content bg-purple" style="color: #909399;">资源占用</div>
                </el-col>
              </div>
            </el-col>
            <!--文件条目-->
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="10">
                  <div class="grid-content bg-purple"><img src="../assets/images/利用申请.png" style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">123</div>
                  <div class="grid-content bg-purple" style="color: #909399;">利用申请</div>
                </el-col>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="10">
                  <div class="grid-content bg-purple"><img src="../assets/images/累计借阅.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">123</div>
                  <div class="grid-content bg-purple" style="color: #909399;">累计借阅</div>
                </el-col>
              </div>
            </el-col>
          </el-row>
<!-------------------------------------------------------------------------------------------------------------------------->
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts'

export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.7",
      activeName: 'first',
      tableData: [{
        date: '2016-05-02',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1518 弄'
      }, {
        date: '2016-05-04',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1517 弄'
      }, {
        date: '2016-05-01',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1519 弄'
      }, {
        date: '2016-05-03',
        name: '王小虎',
        address: '上海市普陀区金沙江路 1516 弄'
      }],
      chartInit: null,
      count: 20
    };
  },
  mounted() {
    this.initChart();
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    handleClick(tab, event) {
      console.log(tab, event);
    },
    initChart() {
      this.chartInit = echarts.init(document.getElementById('main'));
      this.chartInit.setOption(option);
    },
    load() {
      this.count += 2
    }
  }
};
// 指定图表的配置项和数据
var option = {
  title: {
    text: '月份'
  },
  tooltip: {
    trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
  },
  legend: {
   // Try 'horizontal'
   orient: 'vertical',
          right: 10,
          top: 'center'
  },
  dataset: {
          source: [
            ['product', '接口接收', '批量挂接', '手工著录','离线导入'],
            ['1月', 43.3, 85.8, 93.7, 30.3],
            ['2月', 83.1, 73.4, 55.1, 65.2],
            ['3月', 86.4, 65.2, 82.5, 39.1],
            ['4月', 72.4, 53.9, 39.1, 72.4],
            ['5月', 72.4, 53.9, 39.1, 85.8],
            ['6月', 72.4, 53.9, 39.1, 93.7]
          ]
        },
        xAxis: { type: 'category' },
        yAxis: {},
        series: [{ type: 'bar' }, { type: 'bar' }, { type: 'bar' },{ type: 'bar' }],

};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
    background-color: #f5f5f5;
  }

  hr {
    margin-top: 20px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }

  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 10px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    ol {
      display: block;
      list-style-type: decimal;
      margin-block-start: 1em;
      margin-block-end: 1em;
      margin-inline-start: 0;
      margin-inline-end: 0;
      padding-inline-start: 40px;
    }
  }
}

.text {
  font-size: 14px;
}

.item {
  margin-bottom: 12px;
}
.clearfix{
  color: #1C69DB;
}
.clearfix:before,
.clearfix:after {
  display: table;
  content: "";
}

.clearfix:after {
  clear: both
}
.calendar-end[data-v-a83bd3b0] {
    background: aliceblue;
    border-radius: 0px 0px 6px 6px;
    height: 35px;
    text-align: center;
    font-weight: bold;
    font-size: 25px;
    width: 65px;
}
.calendar-top[data-v-a83bd3b0] {
    background: #dfe7ff;
    border-radius: 6px 6px 0px 0px;
    height: 25px;
    text-align: center;
    padding: 3px 0;
    font-weight: bold;
    font-size: 14px;
    width: 65px;
}
.box-card {
  display: block;
  list-style-type: decimal;
  //margin-block-start: 1em;
  margin-block-end: 1em;
  margin-inline-start: 0;
  margin-inline-end: 0;
}

.card-font {
  font-size: 20px;
  line-height: 1.3;
  font-weight: bold;
}

span {
  font-size: 15px;
  font-weight: bold;
}
.calendar{
  margin-top: 25px;
}
.calendar-top{
  background: #cccef3;
  border-radius: 6px 6px 0px 0px;
  height: 25px;
  text-align: center;
  padding: 3px 0;
  font-weight: bold;
  font-size: 14px;
  width: 65px;
}
.calendar-end{
  background: #c0d6fa;
  border-radius: 0px 0px 6px 6px;
  height: 35px;
  text-align: center;
  font-weight: bold;
  font-size: 25px;
  width: 65px;
}
.calendar-top-text{
  height: 25px;
  padding: 3px 0;
  font-size: 14px;
}
.calendar-end-text{
  height: 35px;
  padding: 8px 0;
  color: #909399;
  font-size: 12px;
}
</style>

