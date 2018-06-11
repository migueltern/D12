package controllers.recycler;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.Assert;
import org.springframework.validation.BindingResult;
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
import domain.Recycler;

@Controller
@RequestMapping("/messageFolder/recycler")
public class MessageFolderRecyclerController extends AbstractController{
	
//	Services --------------------------------------------------------

	@Autowired
	private MessageFolderService	messageFolderService;
	
	@Autowired
	private ActorService actorService;
	
	@Autowired
	private MessageService messageService;
	
	//	Constructors

	public MessageFolderRecyclerController() {
		super();
	}
	
	//	Listing ---------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<MessageFolder> messageFolders;
		Actor principal;
		
		principal = this.actorService.findPrincipal();
		messageFolders = this.messageFolderService.findMessageFolderByActor(principal.getId());
		
		Assert.isTrue(principal instanceof Recycler);

		result = new ModelAndView("messageFolder/list");
		result.addObject("messageFolders", messageFolders);
		result.addObject("requestURI", "messageFolder/recycler/list.do");
		result.addObject("RequestURIedit", "messageFolder/recycler/edit.do");
		result.addObject("RequestURImessages", "message/recycler/list.do?d-16544-p=1");

		return result;
	}
	
	// Create-------------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		MessageFolder messageFolder;

		messageFolder = this.messageFolderService.create();
		result = this.createEditModelAndView(messageFolder);

		return result;

	}
	
	// Edit---------------------------------------------------------------
	
		@RequestMapping(value = "/edit", method = RequestMethod.GET)
		public ModelAndView edit(@RequestParam int messageFolderId) {
			ModelAndView result;
			MessageFolder messageFolder;

			messageFolder = this.messageFolderService.findOne(messageFolderId);
			Assert.notNull(messageFolder);
			Assert.isTrue(messageFolder.isModifiable()==true);
			result = this.createEditModelAndView(messageFolder);

			return result;

		}
	
	//	Save-------------------------------------------------------------------
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(MessageFolder messageFolder, BindingResult bindingResult) {
		ModelAndView result;
		
		messageFolder = this.messageFolderService.reconstruct(messageFolder, bindingResult);
		
		if (bindingResult.hasErrors())
			result = this.createEditModelAndView(messageFolder);
		else
			try {
				this.messageFolderService.saveToPrincipal(messageFolder);
				result = new ModelAndView("redirect:/messageFolder/recycler/list.do");
			} catch (final Throwable oops) {

				if (oops.getMessage().equals("This message folder doesn't edit"))
					result = this.createEditModelAndView(messageFolder, "messageFolder.commit.error.notModifiable");
				else if(oops.getMessage().equals("This folder exits"))
					result = this.createEditModelAndView(messageFolder, "messageFolder.commit.error.exits");
				else
					result = this.createEditModelAndView(messageFolder, "messageFolder.commit.error");
			}

		return result;
	}
	
	//Delete --------------------------------------------------------------------------
	
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "delete")
	public ModelAndView delete(MessageFolder messageFolder, BindingResult bindingResult) {
		ModelAndView result;
		messageFolder = this.messageFolderService.reconstruct(messageFolder, bindingResult);
		try {
			this.messageFolderService.delete(messageFolder);
			result = new ModelAndView("redirect:list.do");
		} catch (final Throwable oops) {
			result = this.createEditModelAndView(messageFolder, "messageFolder.commit.error");
		}

		return result;
	}
	
	// Ancillary methods ------------------------------------------------------
	protected ModelAndView createEditModelAndView(MessageFolder messageFolder) {
		ModelAndView result;
		result = this.createEditModelAndView(messageFolder, null);
		return result;
	}

	protected ModelAndView createEditModelAndView(MessageFolder messageFolder, String messageCode) {
		ModelAndView result;
		Collection<Message> mess;

		mess = this.messageService.findMessagesByMessageFolder(messageFolder.getId());

		result = new ModelAndView("messageFolder/edit");
		result.addObject("messageFolder", messageFolder);
		result.addObject("mes", mess);
		result.addObject("message", messageCode);
		result.addObject("RequestURIcancel", "messageFolder/recycler/list.do");
		result.addObject("requestURI", "messageFolder/recycler/edit.do");

		return result;

	}


}