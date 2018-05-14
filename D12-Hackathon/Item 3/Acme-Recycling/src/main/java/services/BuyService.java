
package services;

import java.util.Calendar;
import java.util.Collection;
import java.util.GregorianCalendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.validation.Validator;

import repositories.BuyRepository;
import domain.Buy;
import domain.CreditCard;
import domain.Material;

@Service
@Transactional
public class BuyService {

	// Managed repository -----------------------------------------------------

	@Autowired
	BuyRepository		buyRepository;

	@Autowired
	MaterialService		materialService;

	@Autowired
	private Validator	validator;


	public BuyService() {
		super();
	}

	// Simple CRUD methods ----------------------------------------------------
	public Buy create(final int materialId) {
		Buy result;
		Material material;
		result = new Buy();
		material = this.materialService.findOne(materialId);
		result.setMaterial(material);
		return result;
	}
	public Collection<Buy> findAll() {
		Collection<Buy> res;
		res = this.buyRepository.findAll();
		return res;
	}

	public Buy findOne(final int intBuy) {
		Buy res;
		res = this.buyRepository.findOne(intBuy);
		return res;
	}

	public Buy save(final Buy buy) {
		//TODO no comprobado
		Assert.notNull(buy);
		Buy result;

		result = this.buyRepository.save(buy);
		Assert.notNull(result);

		return result;
	}

	//	public Buy reconstruct(final Buy buy, final BindingResult binding) {
	//		Buy result;
	//		if (buy.getId() == 0)
	//			result = buy;
	//		else {
	//			Assert.notNull(null, "a subscription can not be modified");
	//			result = buy;
	//		}
	//		this.validator.validate(result, binding);
	//		return result;
	//	}

	public boolean checkCreditCard(final CreditCard creditCard) {
		boolean res;
		Calendar calendar;
		int actualYear;
		int actualMonth;

		res = false;
		calendar = new GregorianCalendar();
		actualYear = calendar.get(Calendar.YEAR);
		actualMonth = (calendar.get(Calendar.MONTH) + 1);
		actualYear = actualYear % 100;
		actualMonth = actualMonth % 100;
		if (creditCard.getExpirationYear() != null)
			if (Integer.parseInt(creditCard.getExpirationYear()) > actualYear)
				res = true;
			else if (Integer.parseInt(creditCard.getExpirationYear()) == actualYear && Integer.parseInt(creditCard.getExpirationMonth()) > calendar.get(Calendar.MONTH) + 1)
				res = true;
			else if (Integer.parseInt(creditCard.getExpirationYear()) == actualYear && Integer.parseInt(creditCard.getExpirationMonth()) == actualMonth)
				res = false;
		return res;
	}

	public void flush() {
		this.buyRepository.flush();
	}
}
