window.addEventListener('load',function(){
    var upd = document.querySelectorAll('.upd');
    var del = document.querySelectorAll('.del');
    for (let i = 0; i < upd.length; i++) {
        upd[i].addEventListener('click', function() {
            alert('修改成绩成功！');
        })
        del[i].addEventListener('click', function() {
            alert('删除成功！');
        })
    }
    var ins = document.querySelector('.ins');
    ins.addEventListener('click',function() {
        alert("添加成功！");
    })
})
