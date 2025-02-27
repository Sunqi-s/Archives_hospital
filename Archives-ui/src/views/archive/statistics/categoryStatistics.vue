<template>
    <div class="app-container">
        <el-row :gutter="10">
            <!-- 档案分类树形结构 -->
            <el-col :span="4" :xs="24">
                <file-tree :file-options="fileOptions" @check-change="handleCheckChange" :default-expand-all="false"
                    ref="fileTree" :isClick="isClick" :show="true"></file-tree>
            </el-col>
            <el-col :span="20" :xs="24">
                <el-card class="box-card">
                    <div slot="header" class="clearfix">
                        <span>搜索信息</span>
                    </div>
                    <div class="box-item">
                        <year-picker ref="yearPicker" :value="yearList" @input="changeValue" />
                        <el-button type="primary" style="margin-left:1%;" @click="handleQuery">搜索</el-button>
                        <el-button type="info" style="margin-left:1%;" @click="clearSearch" plain>重置</el-button>
                        <el-button type="warning" style="margin-left:1%;" @click="handleExport">导出</el-button>
                    </div>
                </el-card>
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
                                    <span v-if="item.name == 'totalSize'">{{ scope.row[item.name] }} MB</span>
                                    <span v-else>{{ scope.row[item.name] }}</span>
                                </template>
                            </el-table-column>
                        </el-table>
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
import { getCategory, listCategory } from "@/api/archive/category";
import categoryTree from "@/views/archive/category/categoryTree.vue";
import { getCategoryStatistics } from "@/api/archive/statistics";
import yearPicker from "./yearPicker.vue";
import * as echarts from 'echarts';
import * as XLSX from 'xlsx';
export default {
    components: {
        'file-tree': categoryTree,
        yearPicker: yearPicker
    },
    data() {
        return {
            fileOptions: [],
            checkCategory: [],
            isClick: true,
            categoryId: null,
            yearList: [],
            radio: 2,
            tableHeaders: [],
            tableData: [],
            categoryData: [],
            myEcharts: null,
            loading: false,
            chartLegend: ['档案条数', '文件数量', '文件大小'],
        }
    },
    created() {
        this.getCategoryTreeList();
        this.formatSize(12583541.1456)
    },
    mounted() {
        this.charChange();
    },
    methods: {
        handleQuery() {
            let queryParams = {};
            queryParams.dataCountList = this.checkCategory.filter(item => item.ancestors === 1).map(item => item.id);
            if(this.yearList.length != 0){
                queryParams.typeList = this.yearList;
            }else{
                queryParams.typeList = [];
            }

            if (queryParams.dataCountList.length == 0) {
                this.$message.error('请勾选档案分类');
                return;
            }
            if (queryParams.typeList.length != 2&&queryParams.typeList.length != 0) {
                this.$message.error('请正确选择年份或不选择年份');
                return;
            }
            getCategoryStatistics(queryParams).then(response => {
                const data = response.data;
                data.forEach(item => {
                    item.totalSize = this.formatSize(item.totalSize);
                })
                this.tableData = data;
            }).then(() => {
                this.totalSize = this.formatSize(this.totalSize);
                this.tableHeaders = [
                    { label: '档案名称', name: 'category' },
                    { label: '档案条数', name: 'archiveCount' },
                    { label: '文件数量', name: 'fileCount' },
                    { label: '文件大小', name: 'totalSize' }]
                this.updateChart()
            });
        },
        handleCheckChange(data, checked, indeterminate) {
            // console.log(data.name + " checked: " + checked + " indeterminate: " + indeterminate);
            if (data.type === 1) {
                const checknode = checked ? 1 : 0;
                let idx = this.checkCategory.findIndex(item => item.id === data.id);
                if (idx != -1) {
                    this.checkCategory[idx].ancestors = checknode;
                }
            }
            if (data.type === 0 && !indeterminate) {
                let list = this.checkCategory.filter(item => item.parentId === data.id);
                list.forEach(check => {
                    let idx = this.checkCategory.findIndex(i => i.id === check.id);
                    if (idx != -1) {
                        this.checkCategory[idx].ancestors = checked ? 1 : 0;
                    }
                })
            }
            // console.log(this.checkCategory);

        },
        handleExport() {
            const worksheetData = [];
            const headers = this.tableHeaders.map(header => header.label);
            worksheetData.push(headers);

            this.tableData.forEach(row => {
                const rowData = this.tableHeaders.map(header => row[header.name] || '');
                worksheetData.push(rowData);
            })
            const workbook = XLSX.utils.book_new();
            const worksheet = XLSX.utils.aoa_to_sheet(worksheetData);
            XLSX.utils.book_append_sheet(workbook, worksheet, '统计数据');
            XLSX.writeFile(workbook, `档案分类统计.xlsx`);
        },
        clearSearch() {
            this.yearList = [];
            this.$refs.fileTree.reset();
            this.tableData = [];
            this.tableHeaders = [];
            this.updateChart()
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
            const option = {
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: this.chartLegend,
                },
                toolbox: {
                    show: true,
                },
                calculable: true,
                xAxis: [
                    {
                        type: 'category',
                        data: this.tableData.map(item => item.category),
                    }
                ],
                yAxis: [
                    {
                        type: 'value'
                    }
                ],
                series: [
                    {
                        name: '档案条数',
                        type: 'bar',
                        data: this.tableData.map(item => item.archiveCount)
                    },
                    {
                        name: '文件数量',
                        type: 'bar',
                        data: this.tableData.map(item => item.fileCount)
                    },
                    {
                        name: '文件大小',
                        type: 'bar',
                        data: this.tableData.map(item => item.totalSize)
                    }
                ]
            }

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
        },
        changeValue(value) {
            this.yearList = value
        },
        getCategoryTreeList() {
            listCategory().then(response => {
                this.checkCategory = response.data.filter(item => item.type === 1);
                this.fileOptions = this.handleFileOptions(response.data, "id", "parentId");
            });
        },
        handleFileOptions(data, idKey, parentKey) {
            const tree = [];
            const idMap = {};

            data.forEach(item => {
                idMap[item[idKey]] = { ...item, label: item.name, children: [] };
            });

            data.forEach(item => {
                const parent = idMap[item[parentKey]];
                if (parent) {
                    parent.children.push(idMap[item[idKey]]);
                } else {
                    tree.push(idMap[item[idKey]]);
                }
            });

            return tree;
        },
        formatSize(size) {
            const sizeInKB = size / (1024 * 1024);
            return sizeInKB.toFixed(2)
        },

    },
}

</script>
<style scoped>
.box-card {
    display: block;
    list-style-type: decimal;
    margin-block-end: 1em;
    margin-inline-start: 0;
    margin-inline-end: 0;
}

.box-item {
    display: flex;
    align-items: center;
}

.loading {
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