// const replyService =  {};
const replyService = (function() { 
    const url = "/member_post/reply";
    function write(reply){
        console.log(reply);
    }
    function list(pno, callback){
        // 비동기 : ajax
        $.getJSON(url + "/list/" + pno).done(function(data){
            if(callback){
                callback(data);
            }
        })

        // $.ajax({
        //     url : url + "/list/" + pno,
        //     method : 'GET',
        //     dataType : 'JSON',
        //     success : function(data){
        //         console.log(data)
        //     }
        // })
    }

    return {write, list}    
})();
// 함수 내부는 결국 내부로부터 보호받는 공간. 
// url 같은 경우는 약간의 변화만 생기고 큰 변화가 없기 때문에 