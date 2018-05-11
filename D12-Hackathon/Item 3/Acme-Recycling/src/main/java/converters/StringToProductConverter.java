
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.ProductRepository;
import domain.Product;

@Component
@Transactional
public class StringToProductConverter implements Converter<String, Product> {

	@Autowired
	private ProductRepository	ProductRepository;


	@Override
	public Product convert(final String text) {

		Product result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.ProductRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
