import request from '@/utils/request'

// 查询归还列表
export function listRestorations(query) {
  return request({
    url: '/archive/restorations/list',
    method: 'get',
    params: query
  })
}

// 查询归还详细
export function getRestorations(id) {
  return request({
    url: '/archive/restorations/' + id,
    method: 'get'
  })
}

// 新增归还
export function addRestorations(data) {
  return request({
    url: '/archive/restorations',
    method: 'post',
    data: data
  })
}

// 修改归还
export function updateRestorations(data) {
  return request({
    url: '/archive/restorations',
    method: 'put',
    data: data
  })
}

// 删除归还
export function delRestorations(id) {
  return request({
    url: '/archive/restorations/' + id,
    method: 'delete'
  })
}
