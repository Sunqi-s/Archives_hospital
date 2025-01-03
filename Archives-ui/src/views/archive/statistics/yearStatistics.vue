<template>
    <div class="app-container">
        <!-- 搜索筛选 -->
        <el-row>
            <el-col :span="24" :xs="24">
                <el-card class="box-card">
                    <div slot="header" class="clearfix">
                        <span>搜索信息</span>
                    </div>
                    <div class="search-container">
                        <span style="margin-right: 1%;">统计年份</span>
                        <year-picker :value="value" @input="updateSelectedYears" />
                        <el-select v-model="Select" placeholder="请选择统计类型">
                            <el-option v-for="item in selection" :key="item.name" :label="item.label"
                                :value="item.name">
                            </el-option>
                        </el-select>
                        <el-button class="filter-item" size="mini" type="primary" icon="el-icon-search"
                            @click="handleQuery">搜索</el-button>
                        <el-button class="filter-item" size="mini" type="info" icon="el-icon-refresh"
                            @click="handleReset" plain>重置</el-button>
                        <el-button class="filter-item" size="mini" type="warning" icon="el-icon-download"
                        @click="handleExport" :disabled="able">导出</el-button>
                    </div>
                </el-card>
            </el-col>

            <el-col :span="24" :xs="24">
                <el-card class="box-card">
                    <div slot="header" class="clearfix">
                        <span>统计结果</span>
                        <el-radio-group v-model="radio" style="margin-left: 1%;" :fill="'#409EFF'" :aria-hidden="false">
                            <el-radio :label="2">统计图</el-radio>
                            <el-radio :label="1">统计表</el-radio>
                        </el-radio-group>
                    </div>

                    <div v-if="loading" class="loading">
                        <i class="el-icon-loading"></i>
                    </div>

                        <div v-show="radio == 1">
                            <el-table :data="tableData" style="width: 100%; margin-top: 10px;">
                                <el-table-column v-for="item in tableHeaders" :key="item.name" :prop="item.name"
                                    :label="item.label" :render-header="renderHeader">
                                    <template slot-scope="scope">
                                        {{ scope.row[item.name] }}
                                    </template>
                                </el-table-column>
                            </el-table>
                            <pagination v-show="total > 0" :total="total" :page.sync="pageNum" :limit.sync="pageSize"
                                @pagination="handleNextPage" />
                        </div>

                        <div v-show="radio == 2">
                            <div class="echarts" id="chartLineBox" style="width: 100%;height:35vh;"></div>
                        </div>

                </el-card>
            </el-col>
        </el-row>
    </div>
</template>

<script>
import { getyearStatistics } from '@/api/archive/statistics'
import yearPicker from './yearPicker.vue';
import * as echarts from 'echarts';
import * as XLSX from 'xlsx';
export default {
    components: { yearPicker },
    data() {
        return {
            value: [],
            Select: '',
            radio: 2,
            tableHeaders: [],
            tableData: [],
            selection: [
                { name: 1, label: '档案条数' },
                { name: 2, label: '文件总数' },
                { name: 3, label: '附件大小' },
                { name: 4, label: '档案页数' }
            ],
            chartInstance2: null,
            key: 0,
            categoryData: [],
            charData: [],
            myEcharts: null,
            loading: false,
            total: 0,
            pageNum: 1,
            pageSize: 10,
            sliceData: []
        };
    },
    mounted() {
        this.charChange();
    },
    computed: {
        able(){
           return !(this.tableHeaders.length && this.tableData.length && this.categoryData.length);
        }
    },
    methods: {

        updateSelectedYears(value) {
            this.value = value;
        },
        handleQuery() {
            this.loading = true;
            if (!this.value || this.value.length != 2) {
                this.$message.error('请选择有效时间范围');
                this.loading = false;
                return;
            }
            if (this.Select == '') {
                this.$message.error('请选择统计类型');
                this.loading = false;
                return;
            }
            const query = {};
            let header = [{ name: '年度', label: '年度' }];
            let yearCount = [];
            let charData = []; // 初始化 charData
            //将日期对象转换为时间戳或字符串
            query.startData = this.value[0]
            query.endData = this.value[1]
            query.select = this.Select
            getyearStatistics(query).then(res => {
                if (res.data.length != 0) {
                    for (let i = 0; i < res.data.length; i++) {
                        if (res.data[i].select == 1) {
                            if (!yearCount.find(f => f.年度 == res.data[i].year)) {
                                yearCount.push({
                                    '年度': res.data[i].year
                                });
                                charData.push({
                                    '年度': res.data[i].year
                                })

                            }
                        } else if (res.data[i].select == 2) {
                            if (!yearCount.find(f => f.年度 == res.data[i].year)) {
                                yearCount.push({
                                    '年度': res.data[i].year,
                                });
                                charData.push({
                                    '年度': res.data[i].year
                                })
                            }
                        } else if (res.data[i].select == 3) {
                            if (!yearCount.find(f => f.年度 == res.data[i].year)) {
                                yearCount.push({
                                    '年度': res.data[i].year,
                                });
                                charData.push({
                                    '年度': res.data[i].year
                                })
                            }
                        } else if (res.data[i].select == 4) {
                            if (!yearCount.find(f => f.年度 == res.data[i].year)) {
                                yearCount.push({
                                    '年度': res.data[i].year,
                                });
                                charData.push({
                                    '年度': res.data[i].year
                                })
                           }
                        }

                        if (!header.find(f => f.name == res.data[i].category)) {
                            header.push({
                                'name': res.data[i].category,
                                'label': res.data[i].category
                            })
                        }
                    }
                    res.data.forEach(item => {
                        const a = yearCount.findIndex(f => f.年度 == item.year);
                        if (a != -1) {
                            if (item.select == 1) {
                                yearCount[a][item.category] = item.archiveCount;
                                charData[a][item.category] = item.archiveCount;
                            } else if (item.select == 2) {
                                yearCount[a][item.category] = item.fileCount;
                                charData[a][item.category] = item.fileCount;
                            } else if (item.select == 3) {
                                yearCount[a][item.category] = (item.totalSize / (1024 * 1024)).toFixed(2)+'MB';
                                charData[a][item.category] = (item.totalSize / (1024 * 1024)).toFixed(2);
                            } else if (item.select == 4) {
                                yearCount[a][item.category] = item.totalSize;
                                charData[a][item.category] = item.totalSize;
                            }
                        }
                    })
                    this.tableHeaders = header;
                    this.tableData = yearCount;
                    this.total = this.tableData.length;
                    this.pageNum = 1;
                    this.charData = charData;
                    this.categoryData = header.map(item => {
                        if (item.name != '年度') {
                            return item.name
                        }
                    });
                    this.updateChart();
                    this.handleNextPage();
                    
                } else {
                    this.$message.error('查询失败');
                    this.loading = false;
                }
            })
        },
        handleNextPage() {
            const start = (this.pageNum - 1) * this.pageSize;
            const end = start + this.pageSize;
            this.sliceData = this.tableData.slice(start, end);
        },
        handleReset() {
            this.value = [];
            this.radio = 2;
            this.tableHeaders = [];
            this.tableData = [];
            this.Select = '';
            this.categoryData = [];
            this.able = true;
            this.updateChart();
        },
        handleExport() {
            const worksheetData = [];
            const headers = this.tableHeaders.map(header => header.label);
            worksheetData.push(headers);

            this.tableData.forEach(row => {
                const rowData = headers.map(header => row[header] || '');
                worksheetData.push(rowData);
            })
            const workbook = XLSX.utils.book_new();
            const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
            XLSX.utils.book_append_sheet(workbook, worksheet, '统计数据');
            XLSX.writeFile(workbook, `年度统计_${this.Select}.xlsx`);
            
        },
        renderHeader(h, { column, $index }) {
            let realWidth = 0;
            let span = document.createElement('span');

            span.innerText = column.label;
            document.body.appendChild(span);

            realWidth = span.getBoundingClientRect().width;
            column.minWidth = realWidth; // 可能还有边距/边框等值，需要根据实际情况加上

            document.body.removeChild(span);
            return h('span', column.label);
        },

        updateChart() {
            let unit = '';
            switch(this.Select) {
                case 1:
                    unit = '件';
                    break;
                case 2:
                    unit = '个';
                    break;
                case 3:
                    unit = 'MB';
                    break;
            }

            const option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: this.categoryData,
                },
                toolbox: {
                    show: true,
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: this.tableData.map(item => item.年度),
                    }
                ],
                yAxis: [
                    {
                        type: 'value',
                        axisLabel: {
                            formatter: function(value) {
                                return `${value}${unit}`;
                            }
                        }
                    }
                ],
                series: this.categoryData.map((header, index) => ({
                    name: header,
                    type: 'bar',
                    data: this.charData.map(item => item[header])
                }))
            };
            if (this.myEcharts) {
                this.myEcharts.setOption(option, true);
                this.loading = false;
            }
        },

        charChange() {
            this.myEcharts = echarts.init(document.getElementById('chartLineBox'))
            if (this.myEcharts) {
                this.updateChart();
            }
        }
    }

}

</script>

<style>
.search-container {
    display: flex;
    align-items: center;
}
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