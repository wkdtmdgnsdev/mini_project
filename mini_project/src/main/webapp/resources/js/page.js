const size = document.querySelector("#size");
        const searchValue = document.querySelector("#searchValue");

        size.addEventListener("change", () => {
            const url = new URL(window.location.href);
            url.searchParams.set("pageNo", 1);
            url.searchParams.set("size", size.value);
            url.searchParams.set("searchValue", searchValue.value);
            window.location.href = url.toString();
        });

        function pageMove(pageNo) {
            document.querySelector("#pageNo").value = pageNo;
            document.querySelector("#searchForm").submit();
        }