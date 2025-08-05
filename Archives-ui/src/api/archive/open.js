import request from '@/utils/request'

// 查询公开记录列表
export function listOpen(query) {
  return request({
    url: '/archive/open/list',
    method: 'get',
    params: query
  })
}

// 查询公开记录详细
export function getOpen(id) {
  return request({
    url: '/archive/open/' + id,
    method: 'get'
  })
}

// 新增公开记录
export function addOpen(data) {
  return request({
    url: '/archive/open',
    method: 'post',
    data: data
  })
}

// 修改公开记录
export function updateOpen(data) {
  return request({
    url: '/archive/open',
    method: 'put',
    data: data
  })
}

// 删除公开记录
export function delOpen(id) {
  return request({
    url: '/archive/open/' + id,
    method: 'delete'
  })
}
