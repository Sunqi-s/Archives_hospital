// src/api/filePreview.js
import request from '@/utils/request'

export function getPreviewUrl(filePath) {
  return request({
    url: '/archive/preview/url',
    method: 'get',
    params: { filePath }
  })
}
