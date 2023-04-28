# 사용자의 확인률은 '확인된' 메시지 수를 요청된 확인 메시지의 총 수로 나눈 값입니다. 
# 확인 메시지를 요청하지 않은 사용자의 확인 비율은 0입니다. 확인 비율은 소수 둘째 자리에서 반올림하십시오.

SELECT 
  s.user_id,
  ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1.00 ELSE 0.00 END),2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id