/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   quotes.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: sinawara <sinawara@student.s19.be>         +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/26 14:50:37 by sinawara          #+#    #+#             */
/*   Updated: 2025/01/29 13:07:33 by sinawara         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../../includes/minishell.h"

int	count_quotes(char *word, char quote)
{
	int	i;
	int	quote_count;

	if (!word)
		return (0);
	i = 0;
	quote_count = 0;
	while (word[i])
	{
		if (word[i] == quote)
			quote_count++;
		i++;
	}
	return (quote_count);
}
