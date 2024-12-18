<template>
  <div class="app-container home">
    <el-row :gutter="4" type="flex">
      <el-col :span="5" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix" @click="goToZhengli()">
            <span >整理库档案统计</span>
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
                      <el-button type="text" @click="getCount('0','上月')">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text" @click="getCount('0','本月')">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text" @click="getCount('0','本年')">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text" @click="getCount('0','全部')">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">{{ archivecount0 }}</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="5" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix" @click="goToZiyuan">
            <span >资源库档案统计</span>
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
                      <el-button type="text" @click="getCount('1','上月')">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text" @click="getCount('1','本月')">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text" @click="getCount('1','本年')">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text" @click="getCount('1','全部')">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">{{ archivecount1 }}</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="5" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span @click="goToLiyong">利用库档案统计</span>
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
                      <el-button type="text" @click="getCount('2','上月')">上月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text" @click="getCount('2','本月')">本月</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text" @click="getCount('2','本年')">本年</el-button>
                    </div>
                  </el-col>
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text" @click="getCount('2','全部')">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">{{ archivecount2 }}</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="5" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>待审批统计</span>
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
                  <!-- <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">上月</el-button>
                    </div>
                  </el-col> -->
                  <!-- <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">本月</el-button>
                    </div>
                  </el-col> -->
                  <!-- <el-col :span="6">
                    <div class="grid-content bg-purple" style="float: right">
                      <el-button type="text">本年</el-button>
                    </div>
                  </el-col> -->
                  <el-col :span="6">
                    <div class="grid-content bg-purple-light" style="float: right">
                      <el-button type="text">全部</el-button>
                    </div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple card-font" style="float: right">{{ Approvalcount }}</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">数量</div>
                  </el-col>
                </el-row>
              </div>
            </el-col>
          </el-row>
        </el-card>
      </el-col>
      <el-col :span="5" :xs="24">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span>合同统计</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <el-row>
            <el-col :span="12">
              <div class="grid-content bg-purple" style="margin-top: 18px"><img src="../assets/images/文档1.png"
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
                    <div class="grid-content bg-purple card-font" style="float: right">{{ contractCount }}</div>
                  </el-col>
                </el-row>
                <el-row>
                  <el-col :span="10" :offset="14">
                    <div class="grid-content bg-purple" style="float: right;color: #909399">数量</div>
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
            <span>档案分类占比</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <div class="echart" id="mychart" style="float: left; width: 100%; height: 39vh;"></div>
        </el-card>
      </el-col>

      <el-col :lg="12" :xs="24">
        <el-card class="box-card" style="height: 400px">
          <div slot="header" class="clearfix">
            <span>档案状态占比</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div>
          <div class="echart" id="main" style="float: left; width: 100%; height: 39vh;"></div>
        </el-card>
      </el-col>
    </el-row>

    <!-- <el-row :gutter="12">
      <el-col :lg="24" :xs="24">
        <el-card class="box-card" style="height: 200px">
          <div slot="header" class="clearfix">
            <span>档案数据</span>
            <el-button style="float: right; padding: 3px 0" type="text" icon="el-icon-loading"></el-button>
          </div> -->
<!------------------------------------------------------------------------------------------------------------------------->
          <!-- <el-row :gutter="24" style="margin-top: 30px"> -->
            <!--文件条目-->
            <!-- <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="4">
                  <div class="grid-content bg-purple"><img src="../assets/images/文件条目.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">{{guidang}}</div>
                  <div class="grid-content bg-purple" style="color: #909399;">归档申请</div>
                </el-col>
              </div>
            </el-col> -->
            <!--文件条目-->
            <!-- <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="4">
                  <div class="grid-content bg-purple"><img src="../assets/images/利用申请.png" style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">{{liyong}}</div>
                  <div class="grid-content bg-purple" style="color: #909399;">利用申请</div>
                </el-col>
              </div>
            </el-col>
            <el-col :span="8">
              <div class="grid-content bg-purple">
                <el-col :span="4">
                  <div class="grid-content bg-purple"><img src="../assets/images/电子文件.png"
                                                           style="width: 50px;height: 50px"></div>
                </el-col>
                <el-col :span="14">
                  <div class="grid-content bg-purple card-font">{{wenjian}}</div>
                  <div class="grid-content bg-purple" style="color: #909399;">电子文件</div>
                </el-col>
              </div>
            </el-col>
          </el-row> -->
<!-------------------------------------------------------------------------------------------------------------------------->
          <!-- <el-row :gutter="24" style="margin-top: 30px"> -->
            <!--文件条目-->
            <!-- <el-col :span="8">
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
            </el-col> -->
            <!--文件条目-->
            <!-- <el-col :span="8">
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
          </el-row> -->
<!-------------------------------------------------------------------------------------------------------------------------->
        <!-- </el-card>
      </el-col>
    </el-row> -->
  </div>
</template>

<script>
import * as echarts from 'echarts'
import {getData, getList, getStatusList, getImpertOssData} from "@/api/archive/homePage";

export default {
  name: "Index",
  data() {
    return {
      // 版本号
      version: "3.8.7",
      activeName: 'first',
      chartInstance1: null,
      chartInstance2: null,
      count: 20,
      pieChartData: [],//饼状图数据
      pieChartData2: [],
      importData1:[],//柱状图数据1
      importData2:[],//柱状图数据2
      importData3:[],//柱状图数据3
      importData4:[],//柱状图数据4
      archivecount0: 0,//整理库存数量
      archivecount1: 0,//资源库数量
      archivecount2: 0,//利用库数
      Approvalcount: 0,//待审批数量
      contractCount: 0,//合同数量
      guidang: 0,//归档申请数量
      liyong: 0,//利用申请数量
      wenjian: 0,//文件总数
    };
  },
  mounted() {
    this.$nextTick(() => {
      this.initChart()
    })
    this.fetchPieChartData();
    this.fetchSourceData();
    // this.fetchOssData();
    this.getCount('0','本月');
    this.getCount('1','本月');
    this.getCount('2','本月');
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    // 获取图表数据
    initChart() {
      this.$nextTick(() => {
        this.chartInstance1 = echarts.init(document.getElementById('mychart'));
        if (this.chartInstance1) {
          this.updateChart1();
        }
      })
      
      this.$nextTick(() => {
        this.chartInstance2 = echarts.init(document.getElementById('main'));
        if (this.chartInstance2) {
          this.updateChart2();
        }
      })
      
    },
    // 更新图表
    updateChart1(){
      const option1 = {
        tooltip:{
          trigger: 'item'
        },
        legend:{
          orient:'vertical',
          left:'left'
        },
        series:[
          {
            name:'档案分类',
            type:'pie',
            radius:'110vh',
            data:this.pieChartData,
            itemStyle:{
              emphasis:{
                shadowBlur:10,
                shadowOffsetX:0,
                shadowColor:'rgba(0,0,0,0.5)'
              }
            }
          }
        ]
      };
      this.chartInstance1.setOption(option1);
    },
    // 获取饼图数据
    fetchPieChartData(){
      getList().then(res => {
        this.pieChartData = res.data.map(item => {
          return {
            value:item.value,
            name:item.name
          }
        })
        this.updateChart1();//更新图表
      })
    },
    // 获取数据
    fetchSourceData() {
      getStatusList().then(res => {
        this.pieChartData2 = res.data.map(item => {
          return {
            value:item.value,
            name:item.name
          }
        })
        this.updateChart2();
      })
    },
    // 更新图表
    updateChart2() {
      const color = ['#ff4d4d','#ffd11a','#47d147']
      // 指定图表的配置项和数据
      const option2 = {
        color: color,
        tooltip: {
          trigger: 'item'
        },
        legend: {
          top: '5%',
          orient: 'vertical',
          left: 'left'
        },
        series: [
          {
            name: '状态分类',
            type: 'pie',
            radius: ['40%', '70%'],
            avoidLabelOverlap: false,
            label: {
              show: false,
              position: 'center'
            },
            emphasis: {
              label: {
                show: true,
                fontSize: 40,
                fontWeight: 'bold'
              }
            },
            labelLine: {
              show: false
            },
            data: this.pieChartData2,
          }
        ]
      };
      this.chartInstance2.setOption(option2)
    },
    // 加载数据
    load() {
      this.count += 2
    },
    // 获取数据
    getCount(status,time){
      const params = {
        status: status,
        time: time
      }
      getData(params).then(response => {
        if (status == 0) {
          this.archivecount0 = response.data
        }else if (status == 1) {
          this.archivecount1 = response.data
        }else if (status == 2) {
          this.archivecount2 = response.data
        }
      })
    },
    goToZhengli(){
      this.$router.push({
        path: '/ArchiveManagement/info0',
      });
    },
    goToZiyuan(){
      this.$router.push({
        path: '/ArchiveManagement/info1',
      });
    },
    goToLiyong(){
      this.$router.push({
        path: '/ArchiveManagement/info2',
      });
    }
    // 获取oss数据
    // fetchOssData(){
    //   getImpertOssData().then(response => {
    //     this.wenjian = response.data.value
    //   })
    // }
  }
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

