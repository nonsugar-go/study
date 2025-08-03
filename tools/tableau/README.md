# Tableau

- https://public.tableau.com/
- https://public.tableau.com/app/learn/how-to-videos

## フィルタの種類と適用順序

- https://st-brain.com/media/tableau_filtering_context/

## データ フィールドの4つの役割

- https://help.tableau.com/current/pro/desktop/ja-jp/datafields_typesandroles.htm

- **DISCRETE** (青) Dimensions: 不連続ディメンション (一般的)
- **CONTINUOUS** (緑) Dimensions: 連続ディメンション (稀)
- **DISCRETE** (青) Measures: 不連続メジャー (稀)
- **CONTINUOUS** (緑) Measures: 連続メジャー (一般的)

# 計算式の例

## 初回オーダー日、2回目のオーダー日

- https://note.com/oukaon/n/n5a3000981171

```
初回オーダー日: {FIXED[顧客 Id]:MIN([オーダー日])}
最終オーダー日: {FIXED[顧客 Id]:MAX([オーダー日])}
2回目以降オーダー日: IIF([オーダー日]<>[初回オーダー日], [オーダー日], NULL)
2回目オーダー日: {FIXED[顧客 Id]:MIN([2回目以降オーダー日])}
初回と2回目オーダー日の差: DATEDIFF('day', [初回オーダー日], [2回目オーダー日])
```

## GEO

```
東京から150km: BUFFER(MAKEPOINT(35.6895, 139.6917), 150, 'km')
東京からの距離km: DISTANCE(MAKEPOINT(35.6895, 139.6917), MAKEPOINT([Lat], [Lon]), 'km')
```

## 標準偏差

- 売上、利益の ±σ の範囲外

```
ABS(SUM([売上]) - WINDOW_AVG(SUM([売上]))) > WINDOW_STDEV(SUM([売上]))
AND
ABS(SUM([利益]) - WINDOW_AVG(SUM([利益]))) > WINDOW_STDEV(SUM([利益]))
```
