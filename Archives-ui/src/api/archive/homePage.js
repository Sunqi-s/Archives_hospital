import request from '@/utils/request'

export function getData(query){
    return request({
        url:'/home/data',
        method:'get',
        params:query
    })
}

export function getList(){
    return request({
        url:'/home/get',
        method:'get',
    })
}

export function getImportData(){
    return request({
        url:'/home/import',
        method:'get',
    })
}

export function getImpertOssData(){
    return request({
        url:'/home/importOss',
        method:'get',
    })
}

export function getStatusList(){
    return request({
        url:'/home/getStatus',
        method:'get',
    })
}