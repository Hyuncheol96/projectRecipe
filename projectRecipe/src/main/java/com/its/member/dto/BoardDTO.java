package com.its.member.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO {
    private Long id;
    private String boardCategory;
    private String boardTitle;
    private String boardWriter;
    private String boardContents;
    private int boardHits;
    private Timestamp boardCreatedDate;
//    private MultipartFile boardRecipeFile;
//    private String boardFileName;
}
