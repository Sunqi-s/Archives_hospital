<template>
    <div class="app-container">
        <el-row :gutter="10">
            <!-- 档案分类树形结构 -->
            <el-col :span="4" :xs="24">
                <file-tree :file-options="fileOptions" @node-click="handleNodeClick" :default-expand-all="false"
                    ref="fileTree" :isClick="isClick"></file-tree>
            </el-col>
            <el-col :span="20" :xs="24">
                <el-card class="box-card">
                    <div slot="header" class="clearfix">
                        <span>搜索信息</span>
                    </div>
                    <div class="search-container">
                        <year-picker :value="value" @input="changeValue"></year-picker>
                        <el-select v-model="archiveItem" placeholder="请选择查询字段">
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
                <el-card class="box-card">
                    <div slot="header" class="clearfix">
                        <span>统计结果</span>
                    </div>

                    <div v-if="loading" class="loading">
                        <i class="el-icon-loading"></i>
                    </div>

                    <div>
                        <el-table :data="tableData" style="width: 100%; margin-top: 10px;">
                            <el-table-column v-for="item in tableHeaders" :key="item.name" :prop="item.name"
                                :label="item.label" :render-header="renderHeader">
                                <template slot-scope="scope">
                                    {{ scope.row[item.name] }}
                                </template>
                            </el-table-column>
                        </el-table>
                    </div>
                </el-card>
            </el-col>
        </el-row>
    </div>
</template>


<script>
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import categoryTree from '@/views/archive/category/categoryTree.vue';
import { getCategory, listCategory } from '@/api/archive/category';
import {listItem} from '@/api/archive/item';
import * as XLSX from 'xlsx';
import YearPicker from './yearPicker.vue';
import {getStatisticsByCondition} from '@/api/archive/statistics';
export default {
    components: {
        'file-tree': categoryTree, Treeselect,
        YearPicker,
    },
    data() {
        return {
            value: '',
            fileOptions: [],
            isClick: true,
            tableData: [],
            tableHeaders: [
                {
                    name: 'category',
                    label: '档案名称(分类)'
                },
                {
                    name: 'archiveCount',
                    label: '档案数量(件)'
                },
                {
                    name: 'fileCount',
                    label: '文件数量(个)'
                },
                {
                    name: 'totalSize',
                    label: '文件大小(MB)'
                }
            ],
            loading: false,
            categoryId: null,
            Select: null,
            archiveItem: null,
            selection: [],
            queryParams: {
                categoryId: null,
                pageNum: 1,
                pageSize: 10
            }
        }
    },
    created() {
        this.getCategoryTreeList();
    },
    computed: {
        able() {
            return this.tableData.length === 0;
        }
    },
    methods: {
        getCategoryTreeList() {
            listCategory().then(response => {
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
        handleNodeClick(nodeData) {
            this.categoryId = null;
            this.queryParams = {
                pageNum: 1,
                pageSize: 10,
                categoryId: null
            }
            if (this.isClick) {
                //选择档案节点不显示列表页面
                if (nodeData.type === 1) {
                    this.categoryId = nodeData.id;
                    this.getItem();
                    this.isClick = false;
                } else {
                    this.categoryId = null;
                }
            }
        },
        getItem(){
            this.queryParams.pageSize = 5000;
            this.queryParams.categoryId = this.categoryId;
            let resp = [];
            listItem(this.queryParams).then(response => {
                resp = response.rows;
                this.selection = resp.filter(item => !item.itemName.includes('备用') && !item.itemName.includes('ID')).map(item => ({
                    name: item.columnName,
                    label: item.itemName
                }))
                this.isClick = true;
            })
        },
        changeValue(value) {
            this.value = value
        },
        handleQuery(){
            this.Select = this.archiveItem;
            this.loading = true;
            if(this.categoryId == null){
                this.$message.error('请选择档案分类');
                this.loading = false;
                return;
            }
            if(!this.value || this.value.length != 2){
                this.$message.error('请选择有效时间范围');
                this.loading = false;
                return;
            }
            if(this.Select == null){
                this.$message.error('请选择查询条件字段');
                this.loading = false;
                return;
            }
            let query = {
                startData: this.value[0],
                endData: this.value[1],
                condition: this.Select,
                dataCountList: []
            }
            query.dataCountList.push(this.categoryId);
            getStatisticsByCondition(query).then(res => {
                this.tableData = res.data.map(item => ({
                    ...item,
                    totalSize: (item.totalSize /(1024 * 1024)).toFixed(2) + 'MB'
                }))
                this.loading = false;
            })
            
            
        },
        handleReset(){
            this.value = '',
            this.radio = 1,
            this.categoryId = null,
            this.isClick = true,
            this.tableData = [],
            this.loading = false,
            this.selection = [],
            this.Select= null,
            this.archiveItem = null,
            this.$refs.fileTree.clear();
        },
        handleExport(){
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
            XLSX.writeFile(workbook, `档案统计_${this.Select}.xlsx`);
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