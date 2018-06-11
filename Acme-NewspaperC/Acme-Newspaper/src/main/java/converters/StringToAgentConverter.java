
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import repositories.AgentRepository;
import domain.Agent;

@Component
@Transactional
public class StringToAgentConverter implements Converter<String, Agent> {

	@Autowired
	AgentRepository	AgentRepository;


	@Override
	public Agent convert(final String text) {
		Agent result;
		int id;

		try {
			id = Integer.valueOf(text);
			result = this.AgentRepository.findOne(id);
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}
}
