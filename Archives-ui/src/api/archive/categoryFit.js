import request from '@/utils/request'

// 查询所属字段设置列表
export function listFit(query) {
  return request({
    url: '/categoryFit/fit/list',
    method: 'get',
    params: query
  })
}

// 查询所属字段设置详细
export function getFit(id) {
  return request({
    url: '/categoryFit/fit/' + id,
    method: 'get'
  })
}

// 新增所属字段设置
export function addFit(data) {
  return request({
    url: '/categoryFit/fit',
    method: 'post',
    data: data
  })
}

// 修改所属字段设置
export function updateFit(data) {
  return request({
    url: '/categoryFit/fit',
    method: 'put',
    data: data
  })
}

// 删除所属字段设置
export function delFit(id) {
  return request({
    url: '/categoryFit/fit/' + id,
    method: 'delete'
  })
}
