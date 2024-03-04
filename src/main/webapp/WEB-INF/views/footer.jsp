<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
       @font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
.footer-txt {
    font-family: 'TheJamsil5Bold', sans-seri;
    text-align: center;
    color: #F5EBEB;
}
.fcontents {
    display: flex; /* Add flex display */
    align-items: center;
}

.footer-bar {
            position: fixed; /* Fix the footer-bar position */
            bottom: 0; /* Stick to the bottom of the viewport */
            left: 0; /* Align to the left */
            width: 100%; /* Take the full width of the viewport */
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #867070;
            /* background: linear-gradient(to right, red, orange, yellow, green, blue, indigo, violet); */
}

</style>
<div class="footer-bar">
    <div class="content">
      <div class="fcontents">
        <img class="footer-logo"
        src="https://img.icons8.com/color/48/spam-can.png" width="48" height="53" alt="spam-can"/>
        <span class="footer-txt ">&copy;2023 인천일보아카데미, 9700</span>
      </div>
    </div>
  </div>
