import request from '@/utils/request'

// 查询placeonlog列表
export function listPlaceonlog(query) {
  return request({
    url: '/placeonlog/placeonlog/list',
    method: 'get',
    params: query
  })
}

// 查询placeonlog详细
export function getPlaceonlog(placeonfileId) {
  return request({
    url: '/placeonlog/placeonlog/' + placeonfileId,
    method: 'get'
  })
}

// 新增placeonlog
export function addPlaceonlog(data) {
  return request({
    url: '/placeonlog/placeonlog',
    method: 'post',
    data: data
  })
}

// 修改placeonlog
export function updatePlaceonlog(data) {
  return request({
    url: '/placeonlog/placeonlog',
    method: 'put',
    data: data
  })
}

// 删除placeonlog
export function delPlaceonlog(placeonfileId) {
  return request({
    url: '/placeonlog/placeonlog/' + placeonfileId,
    method: 'delete'
  })
}

export function getIdByOddNumbers(oddNumbers) {
  return request({
    url: '/placeonlog/placeonlog/getIdByOddNumbers/',
    method: 'post',
    data: oddNumbers
  })
}
