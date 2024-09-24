import request from '@/utils/request';

export function searchArchive(searchJson) {
  return request({
    url: '/archive/search/list/',
    method: 'post',
    data: searchJson,
  });
}
export function getArchiveDetail(queryParams) {
  return request({
    url:'/archive/search/list/all/',
    method:'post',
    data: queryParams,
  });

}
