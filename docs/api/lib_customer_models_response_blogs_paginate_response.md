# API Reference: blogs_paginate_response

Source file: `lib/customer/models/response/blogs_paginate_response.dart`

## Classes

### class `BlogsPaginateResponse`

### class `Meta`

### class `Links`

## Whitelisted API Endpoints

### `copyWith({ List<BlogData>? data, Links? links, Meta? meta, }) => BlogsPaginateResponse( data: data ?? _data, links: links ?? _links, meta: meta ?? _meta, ); List<BlogData>? get data => _data; Links? get links => _links; Meta? get meta => _meta; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({ int? currentPage, int? from, int? lastPage, List<Links>? links, String? path, String? perPage, int? to, int? total, }) => Meta( currentPage: currentPage ?? _currentPage, from: from ?? _from, lastPage: lastPage ?? _lastPage, links: links ?? _links, path: path ?? _path, perPage: perPage ?? _perPage, to: to ?? _to, total: total ?? _total, ); int? get currentPage => _currentPage; int? get from => _from; int? get lastPage => _lastPage; List<Links>? get links => _links; String? get path => _path; String? get perPage => _perPage; int? get to => _to; int? get total => _total; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*

### `copyWith({dynamic url, String? label, bool? active}) => Links( url: url ?? _url, label: label ?? _label, active: active ?? _active, ); Dyn get url => _url; String? get label => _label; bool? get active => _active; Map<String, Dyn> toJson()`
*No documentation provided (generation failed).*
