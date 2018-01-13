`目录 start`
 
- [Activiti](#activiti)
    - [基础概念](#基础概念)
    - [流程图](#流程图)

`目录 end` *目录创建于2018-01-14*
****************************************

# Activiti

## 基础概念


## 流程图
[案例视频](http://www.jikexueyuan.com/course/1777_2.html?ss=1)
![最简单示例图](https://gitlab.com/Kuangcp/ImageRepo/raw/master/Tech/activiti/activiti-first.png)
`bpmn是最原始的单纯的流程定义文件，与Springboot整合就是bpmn20.xml文件(区别在于动态注入)`

```xml
	<!-- dtd定义 -->
    <definitions id="definitions"
      targetNamespace="http://activiti.org/bpmn20"
      xmlns:activiti="http://activiti.org/bpmn"
      xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL">
	  
		<!-- 一个process表示了一个完整的流程图 -->
        <process id="financialReport" name="Monthly financial report reminder process">
		开始图形 一个细线的圆形
          <startEvent id="theStart" />
		 一条序列流线条 有id ， 有起始节点和目标节点
          <sequenceFlow id='flow1' sourceRef='theStart' targetRef='writeReportTask' />

			一个 task 任务 方框部分 
          <userTask id="writeReportTask" name="Write monthly financial report" >
		  文档 注释？
            <documentation>
              Write monthly financial report for publication to shareholders.
            </documentation>
            <potentialOwner>
              <resourceAssignmentExpression>
                <formalExpression>accountancy</formalExpression>
              </resourceAssignmentExpression>
            </potentialOwner>
          </userTask>
			一条序列流线条 
          <sequenceFlow id='flow2' sourceRef='writeReportTask' targetRef='verifyReportTask' />
			一个任务 
          <userTask id="verifyReportTask" name="Verify monthly financial report" >
            <documentation>
              Verify monthly financial report composed by the accountancy department.
              This financial report is going to be sent to all the company shareholders.
            </documentation>
            <potentialOwner>
              <resourceAssignmentExpression>
                <formalExpression>management</formalExpression>
              </resourceAssignmentExpression>
            </potentialOwner>
          </userTask>
			一条序列流线条
          <sequenceFlow id='flow3' sourceRef='verifyReportTask' targetRef='theEnd' />
		  	终结节点 一个粗线条 圆形
          <endEvent id="theEnd" />
        </process>
    </definitions>
```

