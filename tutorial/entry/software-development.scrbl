#lang scribble/manual
@(require (for-label racket))

@title{軟體開發}

這一篇章的重點不在語言，而在學習如同 racket 熟手一般的真正開發的技巧

@section{撰寫好程式}

這個章節討論 racket 常見的慣例、風格、傳統與陷阱，學習 racket 程式的最佳實踐。

@subsection{格式}

@subsubsection{避免過長的單行}

@codeblock{
(define (filter pred? lst)
  (cond
    [(null? lst) '()]
    [(pred? (car lst)) (cons (car lst) (filter pred? (cdr lst)))]
    [else (filter pred? (cdr lst))]))
}

適當的折行有助於閱讀

@codeblock{
(define (filter pred? lst)
  (cond
    [(null? lst)
     '()]
    [(pred? (car lst))
     (cons (car lst)
           (filter pred? (cdr lst)))]
    [else
     (filter pred? (cdr lst))]))
}

@subsubsection{不要拆散結尾括號}

以下的程式是非常好的 racket 風格

@codeblock{
(define (factorial n)
    (if (zero? n)
        1
        (* n (factorial (- n 1)))))
}

不要寫成

@codeblock{
(define (factorial n)
    (if (zero? n)
        1
        (* n (factorial (- n 1)))
    )
)
}

@subsubsection{子表達式的縮排要一致}

以下是好的案例

@codeblock{
(list (foo)
      (bar)
      (baz))
}

以下是例外，當子表達式是 body 時，我們給它兩個空格做縮排

@codeblock{
(let ((pi 3.14)
      (r 120))
  (* pi r r))
}

@subsubsection{折一個就全部折}

假設你有

@codeblock{
(+ 1 foo bar baz)
}

折行時就應該寫

@codeblock{
(+ 1
   foo
   bar
   baz)
}

@subsection{共通的最佳實踐}

好程式不僅僅是縮排正確而已，還有一些守則需要遵循。

@subsubsection{慎重的命名}

好的命名可能比你想象的還要更重要也更困難。命名應該要含有變數或是函數所做的事情，並且要考慮其被使用的上下文中是否適合。除了命名要含有資訊之外，racket 還有一些慣例可以幫助你的程式變得更易讀，例如回傳 boolean 的函數可以用 @code{?} 結尾，有副作用的函數用 @code{!} 結尾。

@subsubsection{為程式加上註解}

沒有註解勝過錯誤的註解、有註解勝過沒有註解、簡短的註解勝過冗長的註解。

@subsubsection{保持函數簡短}

一個函數應該盡可能保持在一個螢幕可以看完整個定義的大小，大約在 60 行左右，拆分更多函數有助於保持這點。

@subsubsection{避免重複的程式}

把重複的程式抽成函數是個好習慣。

@subsubsection{避免重複的計算}

善用快取避免重複的計算。

@subsubsection{使用高階函數}

用高階函數如 @code{filter}、@code{map} 可以減少很多重複的基本工作，並且具備相當的描述能力。

@subsection{測試}

@subsection{模組}

@section{閱讀好程式}

帶你看各種優秀的 racket 專案，學習自己發掘程式的設計。

@section{發佈好程式}

討論如何發佈寫好的程式庫。
