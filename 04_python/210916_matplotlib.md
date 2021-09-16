## matplotlib 설치 및 불러오기

- 파이썬의 대표적 시각화 패키지
- 기본적인 형태의 다양한 시각화 함수 제공

```python
import matplotlib.pyplot as plt

%matplotlib inline #주피터 노트북에 최적화 된 그래프 설정
```

## lineplot

- line plot은 시간 혹은 순서에 따라 데이터 변화 보여줌

```python
plt.plot(x축 데이터, y축 데이터, '문자열인수')
```

- 색, 마커, 선종류 순으로 '문자열인수'에 입력하여 line plot스타일 지정 가능
- 색상 blue(b), green(g), red(r), cyan(c), magenta(m), black(k)
- 마커
- 선 스타일 `-`(solid line style), `--`(dashed line style)


## barplot
- 구간이 나누어져 있는 범주형 데이터 표현할 때에 주로 사용
- 데이터의 개수, 빈도 표현
```
# 기본 bar그래프
plt.bar(x축 데이터, y축 데이터)

# 가로형 bar그래프
plt.barh(x축 데이터, y축 데이터)
```


