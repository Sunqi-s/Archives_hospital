import request from '@/utils/request'

// 查询档号规则列表
export function listRule(query) {
  return request({
    url: '/archive/rule/list',
    method: 'get',
    params: query
  })
}

// 查询档号规则详细
export function getRule(id) {
  return request({
    url: '/archive/rule/' + id,
    method: 'get'
  })
}

// 新增档号规则
export function addRule(data) {
  return request({
    url: '/archive/rule',
    method: 'post',
    data: data
  })
}

// 修改档号规则
export function updateRule(data) {
  return request({
    url: '/archive/rule',
    method: 'put',
    data: data
  })
}

// 删除档号规则
export function delRule(id) {
  return request({
    url: '/archive/rule/' + id,
    method: 'delete'
  })
}
