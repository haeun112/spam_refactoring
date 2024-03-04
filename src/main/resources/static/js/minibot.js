$(document).ready(function() {
    let buttonHistory = [];
    const modal = $("#myModal");
    const closeModal = $(".close")[0];

      // Open and close modal logic
      $("#openModal").on("click", function() {
        modal.css("display", "block");
    });

    $(closeModal).on("click", function() {
        modal.css("display", "none");
    });

    $(window).on("click", function(event) {
        if (event.target === modal[0]) {
            modal.css("display", "none");
        }
    });

     // Button tree logic
     const initialButtons = `
     <button class="level" data-level="1" data-category="음식">음식</button>
     <button class="level" data-level="1" data-category="운동">운동</button>
     <button class="level" data-level="1" data-category="취미">취미</button>
 `;

 $('#buttonTree').html(initialButtons);

    $('#buttonTree').on('click', '.level', function() {
        const category = $(this).data('category');
        let nextButtons = "";

        switch (category) {
            case '음식':
                nextButtons = `<button class="level" data-level="2" data-category="고기">고기</button>
                               <button class="level" data-level="2" data-category="해산물">해산물</button>`;
                break;
            case '운동':
                nextButtons = `<button class="level" data-level="2" data-category="물에서">물에서</button>
                               <button class="level" data-level="2" data-category="육지에서">육지에서</button>`;
                break;
            case '취미':
                nextButtons = `<button class="level" data-level="2" data-category="뜨개">뜨개</button>
                               <button class="level" data-level="2" data-category="게임">게임</button>`;
                break;
            case '고기':
                nextButtons = `<button class="level" data-level="3" data-category="구이">구이</button>
                               <button class="level" data-level="3" data-category="회">회</button>`;
                break;
            case '해산물':
                nextButtons = `<button class="level" data-level="3" data-category="생선">생선</button>
                               <button class="level" data-level="3" data-category="조개">조개</button>`;
                break;
            default:
                nextButtons = "";
                break;
        }

        buttonHistory.push($('#buttonTree').html());
        $('#buttonTree').html(nextButtons);
        $('#prevButton').show();
    });

    $('#prevButton').on('click', function() {
        if (buttonHistory.length > 0) {
            const lastState = buttonHistory.pop();
            $('#buttonTree').html(lastState);
        }
        
        if (buttonHistory.length === 0) {
            $('#prevButton').hide();
        }
    });
});
