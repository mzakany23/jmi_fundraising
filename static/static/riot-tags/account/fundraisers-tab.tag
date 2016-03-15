<profile-fundraisers>
<style type="text/css">
	.fund-select{
		width: 200px;
	}

  .hide(){
    display: none;
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
                          <tr each={ selection,i in currentFundraiser.selections }class="active">

                          	<th>
                              <p id="loading{i}">loading...</p>
                              <img value={ i } onload={ turnOffSpinner } src="http://localhost:8000{ selection.product.image }" height='50' width='100'>
                            </th>
                          	<th>{ selection.product.title }</th>
                          	<th>{ selection.product.price }</th>
                          	<th>{ selection.quantity }</th>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>

          
          <h3>Total Jars Selected: { totalJars }</h3>
          <h3>Total Shipping: ${ shippingCost }</h3>
          <h3>Total Cost: ${ totalCost-shippingCost }</h3>
          <button class='btn btn-danger'><h3>Total w/Shipping: ${ totalCost }</h3></button>
          </virtual>

          


        </div>   
    </div>
</div>

<script>
	self = this
	this.totalJars = 0
	this.totalCost = 0
	this.shippingCost = 0

	this.status = {
		'in-process': 'warning',
		'paid': 'success',
		'unpaid': 'danger'
	}
  
  turnOffSpinner(e){
    i = e.item.i
    tag = `#loading${i}`
    $(tag).addClass('hide')
  }

	recalculateTotals(){
    console.log(this.currentFundraiser)
		for(var key in this.currentFundraiser.selections){
			selection = this.currentFundraiser.selections[key]
			jarCost = parseFloat(selection.product.price)
			qty = selection.quantity
			cost = (jarCost*qty)
			this.totalCost += cost 
			this.totalJars += selection.quantity
		}
		if (this.totalJars < 90) {this.shippingCost = 30.00}
		this.totalCost += this.shippingCost
	}

	updateCurrentSelected(){
		this.currentFundraiser = null

		currentSelected = parseInt(this.fundraiserSelect.value)
		for (var key in opts.fundraisers){
			fundraiser = opts.fundraisers[key]
			if(fundraiser.id === currentSelected){
				this.currentFundraiser = fundraiser
				if (fundraiser.selections.length > 0){
					this.recalculateTotals()
					this.activateSelections = true	
          // spinner?
          
            
				}else{
					this.activateSelections = false
				}
			}
		}
	}

</script>

</profile-fundraisers>