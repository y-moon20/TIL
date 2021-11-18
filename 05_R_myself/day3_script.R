library(dplyr)

## summarise ####
exam %>% 
  group_by(class) %>% #class별로 분리
  summarise(mean_math = mean(math)) #math평균 산출출

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math), #mean말고도 요약통계량을 나타내는 함수 사용 가능함
            n = n()) #빈도 -학생 수(행이 몇  개있나 세는 것)

new_exam <- exam %>%  
  group_by(class) %>% 
  summarise(mean_math = mean(math), 
            n = n())

## 시각화(그래프만들기) ####
#qqplot2 레이어(1단계 : 배경 설정(축), 2단계 : 그래프추가(점, 막대, 선), 3단계 : 설정 추가(축범위, 색, 표식))
library(ggplot2)

# 산점도 ####
ggplot(data = mpg, aes(x = displ, y = hwy)) + #배경설정하기
  geom_point() +  # 그래프추가
  xlim(3, 6) + #설정 추가
  ylim(10, 30)

# 선그래프 ####
economics <- ggplot2::economics
economics_raw <- economics
ggplot(data = economics, aes(x = date, y = unemploy)) +
  geom_line()

# 막대그래프 ####
# 1단계: 집단별 요약 표를 만듦
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))
#2단계: 그래프 만들기
ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) +
  geom_col()
# x축이 숫자-알파벳 순으로 기본 정렬됨.
# x = reorder(drv, -mean_hwy) : mean_hwy 기준 내림차순 정렬

# 상자그림 ####
ggplot(data = mpg, aes(x = drv, y = hwy)) +
  geom_boxplot()




