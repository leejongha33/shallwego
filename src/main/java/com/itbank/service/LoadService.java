package com.itbank.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.shallwego.AccommDTO;
import com.itbank.shallwego.CfDTO;
import com.itbank.shallwego.LoadDAO;
import com.itbank.shallwego.ReviewDTO;
import com.itbank.shallwego.RoomDTO;

@Service
public class LoadService {

   @Autowired
   private LoadDAO dao;
   
//   검색어 찾은것들 삭제하기
   private String[] searchFilter(String[] drr, String[] destination) {
      int count = 0;
      for(int i = 0; i < drr.length; i++) {
         for(int j = 0; j < destination.length; j++) {
            if(destination[j].equals(drr[i])) {
               drr[i] = null;
            }
         }
      }
      for(int i = 0; i < drr.length; i++) {
         if(drr[i] != null) {
            count++;
         }
      }
      String[] arr = new String[count];
      for(int i = 0; i < arr.length; i++) {
         for(int j = 0; j < drr.length; j++) {
            if(drr[j] != null) {
               arr[i] = drr[j];
               i++;
               if(arr[count - 1] != null) {
                  return arr;
               }
            }
         }
      }
      return arr;
   }

   public AccommDTO selectAccomm(int accomm_idx) {
      AccommDTO dto = dao.selectAccomm(accomm_idx);
      if (dto.getAccomm_type() == 1) {
         // home ㄴ> 받아온 dto 의 accomm_type이 1이면 (호텔이면)
         dto.setTier_number(dao.selectTier(accomm_idx));
//            ㄴ> dto에 tier_number를 set한다. 
      }
      String[] tmp = dto.getAccomm_img().split(",");
      dto.setImg_result(tmp);
      return dto;
   }

   public List<AccommDTO> selectIndexRoom() {
      List<AccommDTO> list = dao.selectIndexRoom();

      for(AccommDTO dto : list) {
         if (dto.getAccomm_type() == 1) {
            dto.setTier_number(dao.selectTier(dto.getAccomm_idx()));
            // 호텔 최저값 받아오기
//            dto.setCost_price(dao.selectRowPriceH(dto.getAccomm_idx()));
         }
         dto.setTitle_img(dto.getAccomm_img().split(",")[0]);
      }
      return list;
   }

   public List<RoomDTO> selectRoom(int accomm_idx) {
         List<RoomDTO> list = dao.selectRoom(accomm_idx);
         for(RoomDTO room : list) {
//         ㄴ> list 내부의 각각의 RoomDTO에 대하여
            room.setImg_result(room.getRoom_img().split(","));
//            ㄴ> 이미지 파일들이 ,로 구분되어 있는 room_img를 다시 ,로 split하여
//               img_result 배열에 각각 삽입.
         }
         return list;
      }

   public List<CfDTO> selectCfList(int accomm_idx) {
      return dao.selectCfList(accomm_idx);
   }

   public RoomDTO selectOneRoom(int room_idx) {
      return dao.selectOneRoom(room_idx);
   }
   
   public int payment(int room_idx) {
      return dao.payment(room_idx);
   }
   
//   검색한 정보 받아오기
   @SuppressWarnings("deprecation")
   public List<AccommDTO> selectSearchList(HashMap<String, Object> map) {
      String destination = (String) map.get("destination");      // 검색어 받아오기
      String[] drr = destination.split(" ");                  // 스페이스바 기준으로 자름
      
      
      String[] region = dao.selectRegion(drr);               // 검색어에 지역이 있는지 확인
      drr = searchFilter(drr, region);
      if(region.length == 0) {                           // 하나라도 없을 경우
         region = dao.selectRegion_sub(drr);                  // 지역서브 테이블에 있는지 확인
         drr = searchFilter(drr, region);                  // region_sub에 있는 친구를 가져왔으면
      }else if(region.length > 1){                        // 검색어에 지역이 2개 이상이 입력되었을 경우      검색어ex) 서울 부산 호텔
         return null;
      }
      if(region != null && region.length != 0) {
         map.put("region", region[0]);
      }
      
      if(drr.length != 0) {
         String[] accomm_type_value = dao.selectAccomm_type(drr);            // 검색어에 숙소타입이 있는지 확인
         int accomm_type = 0;
         if(accomm_type_value.length == 1) {
            drr = searchFilter(drr, accomm_type_value);
            accomm_type = dao.selectAccomm_type_idx(accomm_type_value[0]);         // 숙소타입을 인덱스번호로 바꿈
         }else if(accomm_type_value.length > 1) {                        // 숙소타입 테이블에 2개 이상이 입력되었을 경우      검색어ex) 부산 호텔 모텔
            return null;
         }
         map.put("accomm_type", accomm_type);
      }
      
      String[] accomm_name = drr;                                    // 지역과 숙소타입을 걸러내고 나머지는 숙소 이름이다~
      if(accomm_name.length > 1) {
         return null;
      }else if (accomm_name != null && accomm_name.length != 0) {
         map.put("accomm_name", accomm_name[0]);
      }
      
//      형변환 하기 위해 불러옴
      String start = (String) map.get("start");
      String end = (String) map.get("end");
      
//      일/월/년 으로 입력 받아서 형변환을 위해 월/일/년으로 변경
      String[] srr = start.toString().split("/");
      String[] err = end.toString().split("/");
      start = srr[1] + "/" + srr[0] + "/" + srr[2];
      end = err[1] + "/" + err[0] + "/" + err[2];
      
//      String -> Date 형변환
      Date startDate = new Date(start);
      Date endDate = new Date(end);
      
      String str = new SimpleDateFormat("yyyy-MM-dd").format(startDate);
      String ed = new SimpleDateFormat("yyyy-MM-dd").format(endDate);
      
      map.put("simpleStart", str);
      map.put("simpleEnd", ed);
//      다시 올려줌
      map.put("startDate", startDate);
      map.put("endDate", endDate);
      
      return dao.selectSearchList(map);
   }

//   리뷰 받아오기
   public List<ReviewDTO> getReviewList(int accomm_idx) {
      List<ReviewDTO> list = dao.selectReviewList(accomm_idx);
      return list;
   }

//   public List<AccommDTO> selectMinPrice() {
//      List<AccommDTO> list = dao.selectMinPrice();
//      for(AccommDTO dto : list) {
//         if(dto.getMinprice1().equals(dto.getMinprice2()) ) {
//            dto.setMinprice1(null);
//         }
//      }
//      System.out.println(list);
//      return list;
//   }

}