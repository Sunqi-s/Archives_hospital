import request from '@/utils/request'

// 查询处置记录列表
export function listDispose(query) {
  return request({
    url: '/archive/dispose/list',
    method: 'get',
    params: query
  })
}

// 查询处置记录详细
export function getDispose(id) {
  return request({
    url: '/archive/dispose/' + id,
    method: 'get'
  })
}

// 新增处置记录
export function addDispose(data) {
  return request({
    url: '/archive/dispose',
    method: 'post',
    data: data
  })
}

// 修改处置记录
export function updateDispose(data) {
  return request({
    url: '/archive/dispose',
    method: 'put',
    data: data
  })
}

// 删除处置记录
export function delDispose(id) {
  return request({
    url: '/archive/dispose/' + id,
    method: 'delete'
  })
}
