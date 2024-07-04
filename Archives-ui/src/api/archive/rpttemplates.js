import request from '@/utils/request'

// 查询报表设计列表
export function listRpttemplates(query) {
  return request({
    url: '/archive/rpttemplates/list',
    method: 'get',
    params: query
  })
}

// 查询报表设计详细
export function getRpttemplates(id) {
  return request({
    url: '/archive/rpttemplates/' + id,
    method: 'get'
  })
}

// 新增报表设计
export function addRpttemplates(data) {
  return request({
    url: '/archive/rpttemplates',
    method: 'post',
    data: data
  })
}

// 修改报表设计
export function updateRpttemplates(data) {
  return request({
    url: '/archive/rpttemplates',
    method: 'put',
    data: data
  })
}

// 删除报表设计
export function delRpttemplates(id) {
  return request({
    url: '/archive/rpttemplates/' + id,
    method: 'delete'
  })
}
