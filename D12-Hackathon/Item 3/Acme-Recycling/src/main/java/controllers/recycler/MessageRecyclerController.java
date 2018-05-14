package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import services.ActorService;
import services.MessageFolderService;
import services.MessageService;
import controllers.AbstractController;
import domain.Actor;
import domain.Message;
import domain.MessageFolder;

@Controller
@RequestMapping("/message/recycler")
public class MessageRecyclerController extends AbstractController{
	
	//	Services --------------------------------------------------------
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private MessageFolderService messageFolderService;
	
	//	Constructors
	
	public MessageRecyclerController(){
		super();
	}
	
	//	Listing ---------------------------------------------------------
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(@RequestParam int messageFolderId) {

		ModelAndView result;
		Collection<Message> messages;
		Integer messageFolderId1 = messageFolderId;
		Actor actor;
		Collection<MessageFolder> messageFolders;

		actor = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(actor.getId());
		Assert.isTrue(messageFolders.contains(this.messageFolderService.findOne(messageFolderId)));

		messages = this.messageService.findMessagesByMessageFolder(messageFolderId);

		result = new ModelAndView("message/list");
		result.addObject("messages", messages);
		result.addObject("messageFolderId1", messageFolderId1);
		result.addObject("RequestURIChange", "message/recycler/changeFolder.do");
		result.addObject("RequestURIDisplay", "message/recyler/display.do");
		result.addObject("requestURI", "message/recycler/list.do");

		return result;

	}

}
