<fundraiser-list>
    <div class="row">

            <!-- begin page-header -->
            <h1 class="page-header">Fundraiser List <small>all active fundraisers</small></h1>
            <!-- end page-header -->
            
            <!-- begin row -->
            <div class="row">
                
                <!-- begin col-10 -->
                <div class="col-md-12">
                    <!-- begin panel -->
                    <div class="panel panel-inverse">
                        <div class="panel-heading">
                            <div class="panel-heading-btn">
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                            </div>
                            <h4 class="panel-title">DataTable - Autofill</h4>
                        </div>
                        
                        <div class="panel-body">
                            
                            <div><a href="">All</a><a style='margin-left: 10px; margin-right: 10px;' href="">Paid<a><a href="">Unpaid</a></div>

                            

                            <hr>

                            <div class="table-responsive">
                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Shipment</th>
                                            <th>Date Created</th>
                                            <th>Status</th>
                                            <th>Payment</th>
                                            <th>Title</th>
                                            <th>Organization</th>
                                            <th>Type</th>
                                            <td>Status</td>
                                            <td></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        
                                        
                                        <form method='POST' action="">
                                        
                                        <tr each={ fundraiser in model.results } style="" class="odd gradeX">
                                            <td><a onclick={ detail } href="">shipment</a></td>
                                            <td>{ fundraiser.created }</td>
                                              <td>{ fundraiser.status }</td>
                                            <td>{ fundraiser.finalized }</td>
                                            <td>{ fundraiser.title }</td>
                                            <td>{ fundraiser.profile.organization }</td>
                                            <td>{ fundraiser.type }<td>
                                            <td>{ fundraiser.finalized }</td>           
                                        </tr>
                                        </form>
                                        
                                        
                                    </tbody>
                                </table>
                            </div>  

                            <div class="dataTables_info" id="data-table_info" role="status" aria-live="polite">Showing { model.pagination.current_page } to { model.pagination.pages } of { model.pagination.total_records } entries</div>

                            <div class="dataTables_paginate paging_simple_numbers" id="data-table_paginate">
                                
                                <a onclick={ prev } class="paginate_button previous" aria-controls="data-table" data-dt-idx="0" tabindex="0" id="data-table_previous">Previous</a>

                            <span>
                                <a onclick={ getPageNum } each={ num in maxPageCount } class="paginate_button { current: num === currentPage }" aria-controls="data-table" data-dt-idx="1" tabindex="0">{ num }</a>
                            </span>
                                
                                <a onclick={ next } class="paginate_button next" aria-controls="data-table" data-dt-idx="7" tabindex="0" id="data-table_next">Next</a>
                            </div>

                        </div>



                    </div>
                    <!-- end panel -->

                </div>
                <!-- end col-10 -->

            </div>

            <!-- end row -->
        </div>



<script>
    self = this;
    this.on('mount',function(){
        this.initPage(this.opts.model)
    });
    
    // actions
    initPage(model){
        this.detailView = false
        this.model = null
        this.current_page = null
        this.cache = this.opts.store.initModel(model).results
        this.maxPageCount = []
        this.model = model
        this.currentPage = parseInt(model.pagination.current_page)
        this.setMaxPageCount(model.pagination.max_pages)
        this.update()
    }

    detail(e){
        fundraiser = e.item.fundraiser
        this.currentFundraiser = fundraiser
        this.opts.bus.trigger('detailView',{fundraiser:fundraiser})
        riot.route(`/fundraisers/${fundraiser.id}`)   
    }


    // pagination buttons
    hasNextPage(){
        return this.model.pagination.has_next === 'True'
    }

    next(){
        nextPage = this.currentPage+1
        if (this.hasNextPage()) this.linkTo(nextPage);
    }

    prev(){
        prevPage = this.currentPage - 1
        if (prevPage >= 1) this.linkTo(prevPage)
    }

    getPageNum(e){
        pageNum = e.item.num
        this.linkTo(pageNum)
    }

    linkTo(pageNum){
        riot.route(`fundraisers/?page=${pageNum}`)
        scroll(0,0)
    }

    setMaxPageCount(num){
        for (var i=1; i<=num;i++){
            this.maxPageCount.push(i)
        }
    }

</script>


</fundraiser-list>