SELECT
OA.OrderCompany,
OA.XSellEventInPath,
OA.OrderID,
OA.OrderUTCTs,
OA.EventCompany,
CASE
  WHEN OA.EventType = 'Permalease' THEN 'PS'
  WHEN OA.EventType = 'PS - Missing Campaign' THEN 'PS'
  ELSE OA.EventType
END AS EventType,
OA.Brand,
OA.CampaignName,
count(*) OVER (PARTITION BY OA.OrderID) AS TotalTouchpoints,
OA.FirstTouch,
OA.LastTouch,
OA.Linear

FROM
ODS.attribution.OrderAttribution OA

WHERE
  OA.OrderUTCTs >= '2017-07-01 00:00:00'
  AND OA.OrderUTCTs < '2017-08-01 00:00:00'
