import request from '@/utils/request'

// 查询档案信息列表
export function listInfo(query) {
  return request({
    url: '/archive/info/list',
    method: 'get',
    params: query
  })
}

// 查询档案信息详细
export function getInfo(id) {
  return request({
    url: '/archive/info/getInfo/' + id,
    method: 'get'
  })
}

// 新增档案信息
export function addInfo(data) {
  return request({
    url: '/archive/info',
    method: 'post',
    data: data
  })
}

// 修改档案信息
export function updateInfo(data) {
  return request({
    url: '/archive/info',
    method: 'put',
    data: data
  })
}

// 删除档案信息
export function delInfo(id) {
  return request({
    url: '/archive/info/' + id,
    method: 'delete'
  })
}

// 批量导入档案信息
export function bulkAdd(data) {
  return request({
    url: '/archive/info/bulkAdd',
    method: 'post',
    data: data
  })
}

//批量归档档案信息
export function updatAarchiveStatus(ids,type,categoryId,oddNumbers) {
  return request({
    url:'/archive/info/document/',
    method: 'post',
    data: {
      ids: ids,
      archiveStatus: type,
      categoryId: categoryId,
      archiveNumber: oddNumbers
    }
  })
}

//归档档案信息
export function updateArchiveStatusById(ids,type,categoryId,oddNumbers) {
  return request({
    url:'/archive/info/updateArchiveStatusById',
    method: 'post',
    data: {
      ids: ids,
      categoryId: categoryId,
      archiveStatus: type,
      archiveNumber: oddNumbers,
    }
  })
}

//批量发送利用档案信息
export function sendInfo(id) {
  return request({
    url:'/archive/info/send/' + id,
    method: 'put',
  })
}

export function updatAarchiveStatusAll(data) {
  return request({
    url:'/archive/info/documentAll/',
    method: 'post',
    data: data
  })
}

//发送利用档案信息
export function sendInfoByIds(ids,type,categoryId,oddNumbers) {
  return request({
    url:'/archive/info/sendInfoByIds',
    method: 'post',
    data: {
      ids: ids,
      archiveStatus: type,
      categoryId: categoryId,
      archiveNumber: oddNumbers
    }
  })
}

export function sendInfoAll(data) {
  return request({
    url:'/archive/info/sendAll',
    method: 'post',
    data: data
  })
}

//高级搜索
export function getBeachList(query) {
  return request({
    url: '/archive/info/beachSearch',
    method: 'post',
    params: query
  })
}

//获取待删除数量
export function getDelCount(query) {
  return request({
    url: '/archive/info/getDeleteCount',
    method: 'get',
    params: query
  })
}

export function getDeleteCountBySearch(query) {
  return request({
    url: '/archive/info/getDeleteCountByQuickSearch',
    method: 'get',
    params: query
  })
}

export function getInfoByIds(query) {
  return request({
    url: '/archive/info/getInfoByIds',
    method: 'post',
    data: query
  })
}

export function updateArchiveNumber(query) {
  return request({
    url: '/archive/info/updateArchiveNumber',
    method: 'post',
    data: query
  })
}
