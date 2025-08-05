import request from '@/utils/request'

// 查询鉴定记录列表
export function listIdentify(query) {
  return request({
    url: '/archive/identify/list',
    method: 'get',
    params: query
  })
}

// 查询鉴定记录详细
export function getIdentify(id) {
  return request({
    url: '/archive/identify/' + id,
    method: 'get'
  })
}

// 新增鉴定记录
export function addIdentify(data) {
  return request({
    url: '/archive/identify',
    method: 'post',
    data: data
  })
}

// 修改鉴定记录
export function updateIdentify(data) {
  return request({
    url: '/archive/identify',
    method: 'put',
    data: data
  })
}

// 删除鉴定记录
export function delIdentify(id) {
  return request({
    url: '/archive/identify/' + id,
    method: 'delete'
  })
}
