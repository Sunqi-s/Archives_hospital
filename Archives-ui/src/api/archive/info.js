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
    url: '/archive/info/' + id,
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

//归档档案信息
export function updatAarchiveStatus(id) {
  return request({
    url:'/archive/info/document/' + id,
    method: 'put',
  })
}
