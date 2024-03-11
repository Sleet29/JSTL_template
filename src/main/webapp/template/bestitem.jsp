<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<body>

<div class="container mt-3">
  <h2>인기 목록 Table</h2>
  <p>상품입력하세요.</p>  
  <input class="form-control" id="myInput" type="search" placeholder="Search..">
  <br>
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>상품이름</th>
        <th>가격</th>
        <th>제조사</th>
      </tr>
    </thead>
    <tbody id="myTable">
      <tr>
        <td>참치</td>
        <td>1000</td>
        <td>동원</td>
      </tr>
      <tr>
        <td>비타민</td>
        <td>100</td>
        <td>비타민왕국</td>
      </tr>
      <tr>
        <td>닌텐도스위치</td>
        <td>3000</td>
        <td>닌텐도</td>
      </tr>
      <tr>
        <td>아이폰</td>
        <td>50</td>
        <td>애플</td>
      </tr>
    </tbody>
  </table>
  
  <p>Note that we start the search in tbody, to prevent filtering the table headers.</p>
</div>

<script>
  $("#myInput").on("keyup", function() {
    const value = $(this).val().toLowerCase();
    $("#myTable tr").each(function() {
      console.log($(this).text().toLowerCase().indexOf(value) > -1)
      
      // toggle(true)는 선택한 요소를 보이도록 설정하는 메소드.
      // toggle(false)는 선택한 요소에 style="display:none;" 속성이 추가되어 보이지 않도록 한다.
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
</script>
<footer>
	<jsp:include page = "bottom.jsp" />
</footer>
</body>
</html>
