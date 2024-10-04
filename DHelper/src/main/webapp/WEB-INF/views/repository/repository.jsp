<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<style>
  body {
    margin-top: 20px;
    background-color: #eee;
  }
  .project-list-table {
    border-collapse: separate;
    border-spacing: 0 12px;
  }

  .project-list-table tr {
    background-color: #fff;
  }

  .table-nowrap td,
  .table-nowrap th {
    white-space: nowrap;
  }
  .table-borderless > :not(caption) > * > * {
    border-bottom-width: 0;
  }
  .table > :not(caption) > * > * {
    padding: 0.75rem 0.75rem;
    background-color: var(--bs-table-bg);
    border-bottom-width: 1px;
    box-shadow: inset 0 0 0 9999px var(--bs-table-accent-bg);
  }

  .avatar-sm {
    height: 2rem;
    width: 2rem;
  }
  .rounded-circle {
    border-radius: 50% !important;
  }
  .me-2 {
    margin-right: 0.5rem !important;
  }
  img,
  svg {
    vertical-align: middle;
  }

  a {
    color: #3b76e1;
    text-decoration: none;
  }

  .badge-soft-danger {
    color: #f56e6e !important;
    background-color: rgba(245, 110, 110, 0.1);
  }
  .badge-soft-success {
    color: #63ad6f !important;
    background-color: rgba(99, 173, 111, 0.1);
  }

  .badge-soft-primary {
    color: #3b76e1 !important;
    background-color: rgba(59, 118, 225, 0.1);
  }

  .badge-soft-info {
    color: #57c9eb !important;
    background-color: rgba(87, 201, 235, 0.1);
  }

  .outer{
    text-align: center;
  }
  .row{
    padding-left: 500px;
  }

  tbody{
    width: 1000px;
    height: 715px;
  }
</style>
</head>
<body>
<jsp:include page="../common/menubar.jsp" />
<div class="outer">
      <div class="row">
          <table class="table project-list-table table-nowrap align-middle table-borderless">

            <thead>
              <tr>
                <th scope="col" class="ps-4" style="width: 50px">
                  <div class="form-check font-size-16">
                    <input type="checkbox" class="form-check-input" id="contacusercheck"/>
                    <label class="form-check-label" for="contacusercheck" ></label>
                  </div>
                </th>
                <th scope="col">Name</th>
                <th scope="col">Position</th>
                <th scope="col">Email</th>
                <th scope="col">Projects</th>
                <th scope="col" style="width: 200px">Action</th>
              </tr>
            </thead>

            <tbody>
              <tr>
                <th scope="row" class="ps-4">
                  <div class="form-check font-size-16">
                    <input type="checkbox" class="form-check-input" id="contacusercheck1" />
                    <label class="form-check-label" for="contacusercheck1" ></label>
                  </div>
                </th>
                <td>
                  <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-sm rounded-circle me-2" />
                  <a href="#" class="text-body">Simon Ryles</a>
                </td>
                <td>
                  <span class="badge badge-soft-success mb-0" >Full Stack Developer</span>
                </td>
                <td>SimonRyles@minible.com</td>
                <td>125</td>
                <td>1</td>
              </tr>


              <tr>
                <th scope="row" class="ps-4">
                  <div class="form-check font-size-16">
                    <input type="checkbox" class="form-check-input" id="contacusercheck2" />
                    <label class="form-check-label" for="contacusercheck2"></label>
                  </div>
                </th>

                <td>
                  <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-sm rounded-circle me-2" />
                  <a href="#" class="text-body">Marion Walker</a>
                </td>

                <td>
                  <span class="badge badge-soft-info mb-0" >Frontend Developer</span>
                </td>

                <td>MarionWalker@minible.com</td>
                <td>132</td>
                <td>1</td>
              </tr>

            </tbody>

          </table>
      </div>
    </div>

</body>
</html>