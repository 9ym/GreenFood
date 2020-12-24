package com.kh.greenfood.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/main")
public class EventController {
	
	@RequestMapping(value="/event/event1221_01")
	public String event1221_01() throws Exception{
		return "event/event1221_01";
	}
	
	@RequestMapping(value="/event/event1221_02")
	public String event1221_02() throws Exception{
		return "event/event1221_02";
	}
	
	@RequestMapping(value="/event/event1221_03")
	public String event1221_03() throws Exception{
		return "event/event1221_03";
	}
}
