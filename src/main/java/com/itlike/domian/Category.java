package com.itlike.domian;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class Category {
    private Integer cid;
    private String cname;
    private Integer parentid;
}
