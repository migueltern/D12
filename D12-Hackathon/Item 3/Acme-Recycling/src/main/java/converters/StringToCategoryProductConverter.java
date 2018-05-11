
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import repositories.CategoryProductRepository;
import domain.CategoryProduct;

@Component
@Transactional
public class StringToCategoryProductConverter implements Converter<String, CategoryProduct> {

	@Autowired
	private CategoryProductRepository	CategoryProductRepository;


	@Override
	public CategoryProduct convert(final String text) {

		CategoryProduct result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.CategoryProductRepository.findOne(id);

			}

		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}

		return result;
	}
}
