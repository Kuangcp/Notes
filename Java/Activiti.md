# Activiti

## 基础概念


## 流程图
![最简单示例图](https://gitlab.com/Kuangcp/ImageRepo/raw/master/Tech/activiti/activiti-first.png)

```
    <definitions id="definitions"
      targetNamespace="http://activiti.org/bpmn20"
      xmlns:activiti="http://activiti.org/bpmn"
      xmlns="http://www.omg.org/spec/BPMN/20100524/MODEL">
	  
		<!-- 一个process表示了一个完整的流程图 -->
        <process id="financialReport" name="Monthly financial report reminder process">
		开始图形 一个细线的圆形
          <startEvent id="theStart" />
		 一条数据流线条 有id ， 有起始节点和目标节点
          <sequenceFlow id='flow1' sourceRef='theStart' targetRef='writeReportTask' />

			一个 task 任务 方框部分 
          <userTask id="writeReportTask" name="Write monthly financial report" >
            <documentation>
              Write monthly financial report for publication to shareholders.
            </documentation>
            <potentialOwner>
              <resourceAssignmentExpression>
                <formalExpression>accountancy</formalExpression>
              </resourceAssignmentExpression>
            </potentialOwner>
          </userTask>
			一条数据流线条 
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
			一条数据流线条
          <sequenceFlow id='flow3' sourceRef='verifyReportTask' targetRef='theEnd' />
		  	终结节点 一个粗线条 圆形
          <endEvent id="theEnd" />
        </process>
    </definitions>
```

