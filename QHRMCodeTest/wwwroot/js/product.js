var dtProduct;
var id = 0;


jQuery(document).ready(function () {

    dtProduct = $('#dtProduct').dataTable({
        retrieve: true,
        paging: false,
        lengthMenu: [[10, 25, 50, 100, 200, -1], [10, 25, 50, 100, 200, 'All']],
        columnDefs: [
            {
                targets: [0], name: 'SrNo', className: 'center', orderable: false, sWidth: '5%',
            },
            {
                targets: [1], name: 'Name', className: 'center', orderable: false, sWidth: '5%',
            },
            {
                targets: [2], name: 'Description', className: 'left', orderable: false, sWidth: '5%',
            },
            {
                targets: [3], name: 'Price', className: 'right', orderable: false, sWidth: '5%',
            },
            {
                targets: [4], name: 'CreatedDate', className: 'left', orderable: false, sWidth: '5%',
            },
            {
                targets: [5], name: 'Action', className: 'left', sWidth: '10%', orderable: false,
                editor: { type: 'Action', required: false, class: '' }, render: _RenderContentButton
            },
            {
                targets: [6], name: 'Id', className: 'center', orderable: false, sWidth: '5%',
            }
        ]
    });
    dtProduct.on('draw.dt', function () {
        $('#dtProduct .tooltips').tooltip();
    });
    dtProduct.on('click', '.edit', function (e) {
        e.preventDefault();
        var pos = dtProduct.fnGetPosition($(this).closest('tr')[0]);
        var data = dtProduct.fnGetData(pos);
        var id = data[6];
        edit(id);
    });
    dtProduct.on('click', '.delete', function (e) {
        e.preventDefault();
        var pos = dtProduct.fnGetPosition($(this).closest('tr')[0]);
        var data = dtProduct.fnGetData(pos);
        var id = data[6];
        Delete(id);
    });

    Load();
});
function Delete(id) {
    $('#deletedid').val(id);
    $('#deleteModal').modal('show');
}
function Load() {
    var data = GetData();
    dtProduct.api().clear().rows.add(data).draw();
}
function edit(id) {
    $('#hiddenid').val(id);
    $('#product-modal').modal('show');
    GetDataById(id);

}
function Add() {
    $('#product-modal').modal('show');
}
function Save() {
    var gpid = $('#hiddenid').val();
    var l_Name = $('#txtProductName').val();
    var l_Description = $('#txtDescription').val();
    var l_Price = $('#txtPrice').val();

    $.ajax({
        type: 'POST',
        dataType: 'json',
        url: "/Product/SaveUpdate",
        data: {
            Id: gpid,
            Name: l_Name,
            Description: l_Description,
            Price: l_Price
        }, success: function (data) {
            console.log(data);
            if (data.respCode == "success") {
                $('#product-modal').modal('hide');
                toastr.success(data.respMsg, "Success");
                Load();
            }
            else {
                toastr.warning(data.respMsg, "Error");
            }
        }
    });
}

function GetData() {
    var request = $.ajax({
        type: 'GET',
        dataType: 'json',
        async: false,
        beforeSend: function () {
            return true;
        },
        url: "/Product/GetList",
        data: {
        }, success: function (data) {
        }
    });
    var result = request.responseJSON;
    return (result.data != null) ? result.data : [];
}

function GetDataById(id) {
    var request = $.ajax({
        type: 'GET',
        dataType: 'json',
        async: false,
        beforeSend: function () {
            return true;
        },
        url: "/Product/GetDataById",
        data: {
            id: id
        }, success: function (data) {
            console.log(data);
            $('#txtProductName').val(data.name);
            $('#txtDescription').val(data.description);
            $('#txtPrice').val(data.price);

        }
    });
}

function Delete(id) {
    $('#deletedid').val(id);
    $('#deleteModal').modal('show');
}

function ConfirmedDelete() {
    var id = $('#deletedid').val();

    $.ajax({
        type: 'POST',
        dataType: 'json',
        url: '/Product/Delete',
        data: {
            id: id
        },
        beforeSend: function () {
        },
        success: function (data) {
            if (data.respCode === "success") {
                toastr.success(data.respMsg, 'Success');
                Load();
            } else {
                toastr.warning(data.respMsg, 'Error');
            }
        },
        error: function (xhr, status, error) {
            console.error('Error deleting item:', error);
            toastr.error('Error deleting item.', 'Error');
        }
    });

    $('#deleteModal').modal('hide');  // Hide the modal after the AJAX request
}

function _RenderContentButton(data, type, row, meta) {
    return '<div class="actions ">'
        + '<button class="btn btn-sm bg-success-light me-2 view"><i class="feather-eye"></i> </button>'
        + '<button class="btn btn-sm bg-success-light me-2 view hidden"><i class="feather-eye"></i> </button>'
        + '<button class="btn btn-sm bg-danger-light edit"><i class="feather-edit"></i></button>'
        + '</div>';
}
