<fundraiser-selections-form>

<style type="text/css">
  .showTotals{
    border: 2px solid green;
    background-color: #B6C4C6;
  }
</style>

<!-- selections -->
  <div class="row">
	<div class="col-md-12 ui-sortable">
      <div class="panel panel-inverse" data-sortable-id="form-stuff-1">
          <div class="panel-heading">
              <h4 class="panel-title">Salsa Selections</h4>
          </div>
          <div class="panel-body">

          	<form class="form-horizontal">
              	<!-- shipment -->

                  <div class="form-group">

                    <div class="col-md-3 control-label">
                    	<button onclick={ addSelection } href="" class="btn btn-sm btn-success" data-toggle="modal">Add Selection<i class="fa fa-plus-square" style='padding-left: 10px;'></i>
                    	</button>	
                    </div>
                    
	                </div>

                  
              </form>

              <virtual each={ selection in selections }>
              <form if={ selection.active } class="form-horizontal">
              	<!-- shipment -->

                  <div class="form-group">

                    <label class="col-md-3 control-label">Selection { selection.id }</label>

                    <!-- product -->
                    <div class="col-md-4">
                        <select onchange={ updateSelections } id="select{ selection.id }" class="form-control">   
                            <option>Select Salsa</option>
                        		<option each={ salsa in originalRed } value={ salsa.id }>Original Red:  { salsa.title }</option>
                            <option each={ salsa in verde } value={ salsa.id }>Verde:  { salsa.title }</option>
                            <option each={ salsa in specialty } value={ salsa.id }>Specialty:  { salsa.title }</option>
                            <option each={ salsa in fruit } value={ salsa.id }>Fruit:  { salsa.title }</option>
                        </select>
                    </div>

                    <div class="col-md-1">
                    	<label class="col-md-3 control-label">Quantity</label>
                    </div>
                    <div class="col-md-1">
                    	<input id="quantity{ selection.id }" onfocusout={ updateSelections } type="text" class="form-control text-center" placeholder="0" name="selection-{selection}">
                    </div>
                    <a onclick={ removeSelection } href="" class="btn btn-sm btn-danger" data-toggle="modal"><i class="fa fa-minus-circle"></i></i></a>
	                </div>

              </form>
              </virtual>
                
          </div>

    <div if={ selectionsActive } class="row">
    <div class="col-md-8 col-md-offset-2">
      <div class="panel">
        
        <div class="panel-body showTotals">
            <table class="table">
                <thead>
                    <tr>
                        <th>Product Id</th>
                        <th>Title</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <tr each={ selection in finalSelections }>
                        <td>{ selection.id }</td>
                        <td>{ selection.title }</td>
                        <td>{ selection.qty }</td>
                    </tr>
                </tbody>
            </table>
            <h3>Total Jars: { jarCount }</h3>
        </div>
     </div>
    </div>
    </div>

      </div>
      <!-- end panel -->

  </div>
  



  </div>



	
<script>
  this.finalSelections = []
  this.selectionsActive = false
	this.selectionCount = 0
	this.selections = []

  this.on('mount',function(){
    this.fruit = this.opts.products.Fruit
    this.verde = this.opts.products.Verde
    this.specialty = this.opts.products.Specialty
    this.originalRed = this.opts.products['Original Red']
  })

	addSelection(e){
		this.selectionCount += 1
		this.selections.push({id:this.selectionCount,active:true})
		this.update()
	}
  var self = this

  this.on('update',function(){
    this.updateJarCount()
  })

 
  // red button delete
	removeSelection(e){
		selection = e.item.selection 
		
    for (var key in this.finalSelections){
      item = this.finalSelections[key]
      if (item.selection === selection.id) {
        this.finalSelections.splice(key, 1);
      }
    }

    if (this.finalSelections.length == 0){
      this.selectionsActive = false
      this.selectionCount = 0
    }

		selection.active = false 
		this.update()
	}

  updateJarCount(){
    count = 0
    
    for (var key in this.finalSelections){
      sel = this.finalSelections[key]
      count += parseInt(sel.qty)
    }
    
    this.jarCount = count 
  }

  updateSelections(e){
    
    for (var key in this.selections){
      sel = this.selections[key]

      // id 
      tag = `#select${sel.id}`
      id = $(tag).val()

      // title
      tag = `#select${sel.id} option:selected`
      title = $(tag).text()

      // qty
      tag = `#quantity${sel.id}`
      qty = $(tag).val()

      currentSelection = {id:id,selection: sel.id,qty:qty,title:title}

      this.finalSelections = this.updateCurrentSelection(currentSelection,this.finalSelections)
      

    }
  }

  updateCurrentSelection(current,arr){
  
    for (var key in arr){
      sel = arr[key]
      // check if its the same selection

      if (sel.id === current.id || sel.selection === current.selection || sel.title === current.title){
        arr.splice(key,1)
      }
    }

    // check if empty
    if (current.id !== 'Select Salsa' && current.qty !== '' && current.id !== undefined) {
      this.selectionsActive = true
      arr.push(current)
    }
    return arr
  }

  
</script>

</fundraiser-selections-form>