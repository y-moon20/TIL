## 데이터 넣기 ####
history <- c(90, 80, 60, 70)
math <- c(50, 60, 100, 20)
df_midterm <- data.frame(history, math)
class <- c(1, 2, 3, 4)
# 클래스까지 포함된 4 x 3 frame
# 변수 따로 만들어서 합치기

df_midterm <- data.frame(history, math, class)
mean(df_midterm$history)
mean(df_midterm$math)

# 함수 중첩해서 한번에 만들기. 등호주의
df_midterm <- data.frame(history = c(90, 80, 60, 70),
                        math = c(50, 60, 100, 20),
                        class = c(1, 1, 2, 2))

## 파일 불러들이기 ####
install.packages("readxl")
library(readxl)
df_finalexam <- read_excel("finalexam.xlsx", sheet=1, col_names = T) # -> 불러올 sheet, 첫번째 행의 문자를 변수명으로 지정할래? T

exam <- read.csv("csv_exam.csv", header = T) # -> col_names같은 역할을 하는 header, read.csv는 엑셀파일부르는 것과 달리 내장함수

## 데이터 저장하기 ####
# 보통 데이터 파일은 csv파일로 관리함
write.csv(df_finalexam, file = "output_newdata.csv")

## 데이터 파악하기 ####
head(exam) #앞에서부터 6개
head(exam, 10)
tail(exam) #뒤에서부터 6개
View(exam) #대소문자 잘 구분해서 쓰기, 잘쓰이진 않음
dim(exam) # 행 열 출력
str(exam) # structure : 데이터의 속성 확인인
summary(exam) #요약 통계량 출력력

## 변수명 수정하기 ####
mpg <- ggplot2::mpg #(::)ggplot패키지 안에 있는  mpg요소만 뽑아옴
library(dplyr)
df_raw <- data.frame(var1 = c(1,2,1),
                    var2 = c(2,3,2))
df_new <- df_raw #수정하기 전에 데이터 백업해두기기
df_new <- rename(df_new, v2 = var2) #var2를 v2로 수정


## 파생변수만들기 ####
df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df$var_sum <- df$var1 + df$var2
df$var_mean <- (df$var1 + df$var2)/2

## 조건함수로 파생변수 만들기
# ifelse(조건, 조건에 맞을 때 부여, 조건에 맞지 않을 때 부여)
summary(mpg$total) #기준값 정하기1
hist(mpg$total) # 기준값 정하기2
mpg$test <- ifelse(mpg$total >= 20, "pass", "fail")
View(mpg)

mpg %>%
  select(total, test) %>%
  head(20)

##빈도분석 ####
table(mpg$test) # 연비합격빈도표 생성

library(ggplot2)
qplot(mpg$test) #연비 합격 빈도 막대 그래프 생성

## 중첩조건문 ####
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >=20, "B", "C"))
mpg %>%
  select(total, test, grade) %>%
  head(20)

## 원하는 데이터만 뽑아내는 필터링 ####
exam %>% filter(class != 1) #1반제외
exam %>% filter(class == 1) 
exam %>% filter(math > 50 & class == 1)
exam %>% filter(math >= 90 | english >= 90)

exam %>% filter(class %in% c(1,3,5)) #match operator %in%

## 열 추출 ####
exam %>% select(class, math, english) #여러변수 추출
exam %>% select(-math, -english) #변수 제외

exam %>% 
  filter(class == 1) %>% 
  select(english)

## 정렬하기 ####
exam %>%  arrange(math) # 오름차순으로 정렬하기
exam %>%  arrange(desc(math)) # 내림차순으로 정렬하기

## 파생변수 추가 ####
exam %>% 
  mutate(total = math+english+science.
         test = ifelse(science >= 60, "pass", "fail")) %>% 
  arrange(total)
# 내장함수를 통해 추가하는 것과 mutatue를 사용하는 것은 무엇이 다를까?
# -> %>% 을 통해서 어디에 있는 변수 인지를 알려주니까 exam&를 매 변수마다 붙이지 않아도 돼서 코드가 간결해짐
# -> 동시에 여러 변수를 추가할 수 있음
# -> 여전히 exam에는 total이 없지만, mutate이후에 pipe로 연결해주면 total 사용 가능
