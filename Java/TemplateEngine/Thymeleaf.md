# Thymeleaf
> 辣鸡

## 流程控制
### if
- lt 小于 
- eq 等于
- gt 大于
- le 小于等于
- ge 大于等于

- 拼接参数：`th:href="@{/student/ChooseTopic/{id} (id=${pageNum}-2)}"`
- 判断块`<th:block th:if="${pageNum lt pageTotal}" ></th:block>`


## 集合处理

- 判断list大小：`th:if="${#lists.size(topicList) == 0}"`