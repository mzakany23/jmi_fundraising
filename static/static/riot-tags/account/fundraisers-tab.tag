<profile-fundraisers>
<style type="text/css">
	.fund-select{
		width: 200px;
	}
</style>

<div class="panel panel-inverse" data-sortable-id="table-basic-6">
	                     	   
		<h2 class="panel-title">Organization Fundraisers</h2>

    
    	<select class="form-control input-sm fund-select" onchange={ updateCurrentSelected } name='fundraiserSelect'>
    		<option>Past Fundraisers</option>
        <option value={ fundraiser.id } each={ fundraiser in opts.fundraisers }>{ fundraiser.title } | Date: { moment(fundraiser.created).format('MMMM Do YYYY, h:mm:ss a') } </option>
    	</select>
    
    
    <div if={ currentFundraiser } class="tab-content">
        <div class="tab-pane fade active in" id="profile-tab">
            <div >
            <message-notification messages={ messages } title={ messageTitle }></message-notification>
            <errors-list errors={ errors }></errors-list>

            <!-- begin breadcrumb -->
            
            <!-- end breadcrumb -->
            <!-- begin page-header -->

            <!-- table -->
            <h3>{ fundraiser.title }</h3>
            <h4>{ fundraiser.plan.name } : { fundraiser.type }</h4>

            <div class="panel panel-inverse" data-sortable-id="table-basic-6">
              <div class="panel-body">
                  <table class="table">
                      <thead>
                          <tr>
                          		<th>created</th>
                              <th>description</th>
                              <th>status</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr class="{ status[fundraiser.status] }">
                              <td>
                              	{ moment(fundraiser.created).format('MMMM Do YYYY, h:mm:ss a') }
                              </td>
                              <td>{ currentFundraiser.description }</td>
                              <td>{ currentFundraiser.status }</td>
                              <td>{ currentFundraiser.account }</td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>

          <!-- table -->
          <h3 if={ !activateSelections }>No Selections</h3>

          <virtual if={ activateSelections }>
          <h3>Selections</h3>
          <div class="panel panel-inverse" data-sortable-id="table-basic-6">
              <div class="panel-body">
                  <table class="table">
                      <thead>
                          <tr>
                          		<th>Image</th>
                              <th>title</th>
                              <th>$/jar</th>
                              <th>quantity</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr each={ selection in selections }class="active">

                          	<th><img src="http://localhost:8000{ selection.product.image }" height='50' width='100'></th>
                          	<th>{ selection.product.title }</th>
                          	<th>{ selection.product.price }</th>
                          	<th>{ selection.quantity }</th>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>

          <h3>Total Jars Selected: 34</h3>
          <h3>Total: $123.50</h3>
          </virtual>

          


        </div>   
    </div>
</div>

<script>
	self = this

	this.status = {
		'in-progres': 'warning',
		'paid': 'success',
		'unpaid': 'danger'
	}

	updateCurrentSelected(){
		currentSelected = parseInt(this.fundraiserSelect.value)
		for (var key in opts.fundraisers){
			fundraiser = opts.fundraisers[key]
			if(fundraiser.id === currentSelected){
				this.currentFundraiser = fundraiser
				if (fundraiser.selections.length > 0){
					this.selections = fundraiser.selections
					this.activateSelections = true	
				}
				
			}
		}
	}

</script>

</profile-fundraisers>