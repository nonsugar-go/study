# Earned Value Management

|頭文字|用語|意味|
|--|--|--|
|PV|Planned value|計画価値、現時点までに完了すべき作業量（計画）|
|EV|Earned Value|達成価値、現時点までに完了した作業量（実績）|
|AC|Actual Cost|実コスト、現時点までに支出した費用|

|頭文字|用語|意味|計算式|
|--|--|--|--|
|CV|Cost Variance|コスト差異|EV-AC|
|SV|Schedule Variance|スケジュール差異|EV-PV|
|CPI|Cost Performance Index|コストパフォーマンス指数|EV/AC|
|SPI|Schedule Performance Index|スケジュール効率指数|EV/PV|

|頭文字|用語|意味|
|--|--|--|
|BAC|Budget At Completion|完成時総予算=コストベースライン、プロジェクト完了までの計画予算|
|EAC|Estimate At Completion|完成時総見積もり、PJ開始時～PJ完了時までの総見積もり|
|ETC|Estimate To Complete|残作業見積もり、現時点～PJ完了時までの見積もり|
|VAC|Variance At Completion|完成時差異、PJ完了時の差異の見積もり|

|用語|パターン|計算式|
|--|--|--|
|EAC|当初の見積もりが適応できず全体的な再精査が必要な場合|AC+ボトムアップETC|
|EAC|現在までは特殊要因での差異で今後は計画通りと想定される場合|AC+(BAC-EV)|
|EAC|現在までの差異傾向が今後も継続すると想定される場合|BAC/CPI
|EAC|現在までの差異傾向が今後も継続すると想定される場合|AC+[(BAC-EV)/(CPI×SPI)]
