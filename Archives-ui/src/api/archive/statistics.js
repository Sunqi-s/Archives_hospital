import request from '@/utils/request'

export function getyearStatistics(query){
    return request({
      url: '/statistics/year',
      method: 'get',
      params: query
    })
}

export function getStatisticsByCondition(query){
    return request({
      url: '/statistics/condition',
      method: 'get',
      params: query
    })
}

export function getStatistics(query) {
      return request({
        url: 'statistics/archives/'+ query,
        method: 'get',
      })
  }
  
  export function exportData(data){
      return request({
        url: 'statistics/export',
        method: 'post',
        data: data
      })
  }
  
  export function getCategoryStatistics(query){
    return request({
      url: 'statistics/getCategory',
      'Content-Type': 'application/json',
      method: 'post',
      data: query
    })
  }